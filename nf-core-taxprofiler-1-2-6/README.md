# nf-core/taxprofiler 1.2.6 for Open OnDemand

This app wraps `nf-core/taxprofiler` 1.2.6 in Open OnDemand for metagenomic taxonomic profiling workflows.

## Purpose

Use this app to launch short-read or long-read taxonomic profiling runs with configurable preprocessing, host removal, profiler selection, and postprocessing.

## Key Features

- Supports detailed preprocessing settings for both short-read and long-read data.
- Exposes redundancy estimation, host removal, run merging, profiling, and visualization sections.
- Includes a more robust parameter-template implementation than the older 1.2.5 app, with explicit boolean and numeric coercion in `template/nf-params.json.erb`.
- Supports optional resume and Seqera Platform / Tower monitoring.

## Key Form Sections

- Input/output options
- Preprocessing general QC options
- Preprocessing short-read QC options
- Preprocessing long-read QC options
- Redundancy estimation
- Preprocessing host-removal options
- Preprocessing run-merging options
- Profiling options
- Postprocessing and visualization options

## Installation

1. Install the app in the Open OnDemand system app directory.
2. Review database, profiler, scheduler, and filesystem assumptions.
3. Update module, cache, email, and pipeline-path settings for your site.

## Configuration

This app currently assumes:

- `module load nf-core`
- a local install path for `nf-core-taxprofiler` 1.2.6
- a shared Singularity cache path
- `-profile tufts`
- `@tufts.edu` email notifications

## Usage

1. Choose executor and requested resources.
2. Provide the input sample sheet, database CSV, and output directory.
3. Configure preprocessing, host-removal, profiler, and visualization sections as needed.
4. Submit the job and monitor progress through Open OnDemand or Seqera Platform.

## Important Notes and Limitations

- This app is non-interactive after launch.
- Public users will expect example input files and database metadata templates.
- Verify the memory-unit handling in `submit.yml.erb` before Appverse release.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
