# nf-core/rnaseq 3.23.0 for Open OnDemand

This app wraps `nf-core/rnaseq` 3.23.0 in Open OnDemand for bulk RNA-seq analysis.

## Purpose

Use this app to launch bulk RNA-seq runs with configurable references, trimming, filtering, UMI handling, alignment settings, optional outputs, and QC controls.

## Key Features

- Sample-sheet driven bulk RNA-seq launch form.
- Exposes the main configuration groups commonly needed by administrators and power users.
- Supports optional resume and Seqera Platform / Tower monitoring.

## Key Form Sections

- Input/output options
- Reference genome options
- Read trimming options
- Read filtering options
- UMI options
- Alignment options
- Optional outputs
- Quality control
- Process skipping options

## Installation

1. Install the app in your Open OnDemand system app directory.
2. Review `manifest.yml`, `form.yml.erb`, and `submit.yml.erb` for local policy changes.
3. Update module, scheduler-profile, filesystem, and pipeline-path assumptions.

## Configuration

This app currently assumes:

- `module load nf-core`
- a local install path for `nf-core-rnaseq` 3.23.0
- a shared Singularity cache path
- `-profile tufts`
- `@tufts.edu` email notifications

## Usage

1. Choose resources, executor, and working directory.
2. Provide the sample sheet, output path, and any required reference inputs.
3. Configure optional trimming, filtering, UMI, alignment, output, and QC settings.
4. Submit the workflow and monitor outputs from the Open OnDemand job page.

## Important Notes and Limitations

- This is a non-interactive launcher.
- Local sites should verify the memory-unit handling in `submit.yml.erb` before release.
- Public users will expect sample input documentation and supported-reference guidance.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
