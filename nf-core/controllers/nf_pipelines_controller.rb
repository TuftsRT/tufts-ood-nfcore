# frozen_string_literal: true

class NfPipelinesController < ApplicationController
  def index
    @groups = discover_groups
  end

  private

  def discover_groups
    # Use the full system app list (not nav-filtered), so apps with empty
    # category remain discoverable here even if hidden from navigation.
    source_apps =
      if respond_to?(:sys_apps) && sys_apps.present?
        sys_apps
      else
        nav_sys_apps
      end

    apps = source_apps.select(&:batch_connect_app?).select do |app|
      app.router.name.to_s.start_with?('nf-core-')
    end

    grouped = Hash.new { |h, k| h[k] = {} }

    apps.each do |app|
      manifest = app.manifest
      subcategory = manifest.subcategory.to_s.strip
      subcategory = 'other' if subcategory.empty?

      title, version = parse_name(manifest.name.to_s, app.router.name.to_s)
      key = title.downcase

      grouped[subcategory][key] ||= { title: title.downcase, versions: [] }
      grouped[subcategory][key][:versions] << { label: version, app: app }
    end

    grouped.keys.sort.map do |subcat|
      pipelines = grouped[subcat].values.map do |p|
        p[:versions].uniq { |v| v[:app].router.name }.sort_by! { |v| v[:label] }.reverse!
        p
      end.sort_by { |p| p[:title] }

      { name: subcat.downcase, pipelines: pipelines }
    end
  end

  def parse_name(manifest_name, app_name)
    name = manifest_name.to_s.strip
    name = app_name.sub(/^nf-core-/, '') if name.empty?
    m = name.match(/(v?\d+(?:\.\d+)+)\s*\z/)
    version = m ? m[1] : ''
    version = "v#{version}" unless version.empty? || version.start_with?('v')
    title = m ? name.sub(/(v?\d+(?:\.\d+)+)\s*\z/, '').strip : name
    [title.empty? ? app_name : title, version]
  end
end