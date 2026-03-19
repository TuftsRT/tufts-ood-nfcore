# nf-core/mag 5.0.0 for Open OnDemand

This app wraps `nf-core/mag` 5.0.0 in Open OnDemand for metagenome-assembled genome workflows.

## Purpose

Use this app to process metagenomic short-read, long-read, or hybrid datasets for assembly, binning, annotation, taxonomic profiling, and MAG quality assessment.

## Key Features

- Supports multiple sequencing and reproducibility modes.
- Exposes short-read and long-read QC, assembly, binning, annotation, virus-identification, and bin-quality sections.
- Includes options relevant to taxonomic profiling and ancient-DNA assembly workflows.
- Supports optional resume and Seqera Platform / Tower monitoring.

## Key Form Sections

- Input/output options
- Reference genome options
- Reproducibility options
- Quality control for short reads
- Quality control for long reads
- Taxonomic profiling options
- Assembly options
- Gene prediction and annotation options
- Virus identification options
- Binning options
- Bin quality check options
- Ancient DNA assembly

## Installation

1. Install the app into your Open OnDemand system app path.
2. Review the app form for site-appropriate defaults and reference resources.
3. Update scheduler, module, and filesystem assumptions before public release.

## Configuration

This app currently assumes:

- `module load nf-core`
- a hardcoded local install path for `nf-core-mag` 5.0.0
- a shared Singularity cache location
- `-profile tufts`
- `@tufts.edu` email notifications

Also review storage expectations for large assemblies and intermediate files.

## Usage

1. Choose execution mode and requested resources.
2. Provide required input files and output directory.
3. Configure the sequencing/QC path that matches the dataset type.
4. Adjust assembly, binning, and annotation options as needed.
5. Submit and track outputs from the working-directory link.

## Important Notes and Limitations

- This is a non-interactive launcher.
- MAG workflows can consume substantial CPU, memory, and storage; the README should set expectations clearly for outside users.
- Sites may want to publish recommended presets for common short-read, long-read, and hybrid use cases.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
