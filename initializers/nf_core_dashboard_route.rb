# /etc/ood/config/apps/dashboard/initializers/
# This is not a OOD recommended way to do this.  It can break the dashboard badly.
# Its only sane way to add this route outside of forking the built in dashboard.

Rails.application.config.after_initialize do
  Rails.application.routes.append do
    get 'nf-core', to: 'nf_pipelines#index', as: 'nf_core'
  end

  Rails.application.routes_reloader.reload!
end
