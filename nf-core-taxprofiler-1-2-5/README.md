# nf-core/taxprofiler 1.2.5 for Open OnDemand

This app wraps `nf-core/taxprofiler` 1.2.5 in Open OnDemand for metagenomic taxonomic profiling workflows.

## Purpose

Use this app to run taxonomic profiling on short-read or long-read datasets with configurable preprocessing, host-removal, profiler selection, and postprocessing options.

## Key Features

- Supports separate preprocessing controls for short reads and long reads.
- Exposes redundancy estimation, host-removal, run-merging, profiler selection, and visualization options.
- Supports multiple profilers such as Kraken2, Bracken, MetaPhlAn, Kaiju, Centrifuge, KrakenUniq, MALT, and others supported by the pipeline.
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
2. Review local scheduler settings, filesystem widgets, and profiler/database expectations.
3. Update the launch script for your module stack, cache locations, and pipeline install paths.

## Configuration

Current site-specific assumptions:

- `module load nf-core`
- hardcoded local install path for `nf-core-taxprofiler` 1.2.5
- shared Singularity cache path
- `-profile tufts`
- `@tufts.edu` email notifications

This app also assumes users can supply profiler database CSV metadata in the format expected by the upstream pipeline.

## Usage

1. Choose resources, executor, working directory, and output directory.
2. Provide the input sample sheet and database-definition CSV.
3. Configure any relevant preprocessing and host-removal steps.
4. Enable the profilers and postprocessing tools needed for the project.
5. Submit and monitor outputs through Open OnDemand or Seqera Platform.

## Important Notes and Limitations

- This is a non-interactive launcher.
- Database preparation is a major prerequisite and should be documented clearly for outside users.
- Public-facing docs should include example `input` and `databases` CSV formats.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
