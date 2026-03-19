# nf-core/rnaseq 3.22.2 for Open OnDemand

This app wraps `nf-core/rnaseq` 3.22.2 in Open OnDemand for bulk RNA-seq processing and expression-analysis preparation.

## Purpose

Use this app to run bulk RNA-seq workflows with configurable reference selection, trimming, filtering, UMI handling, alignment, optional outputs, and QC settings.

## Key Features

- Supports standard bulk RNA-seq sample-sheet driven launches.
- Exposes reference-genome, trimming, filtering, UMI, alignment, optional-output, and QC controls.
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

1. Install the app in your Open OnDemand system app path.
2. Review navigation visibility in `manifest.yml`.
3. Update the scheduler, module, pipeline-path, and filesystem assumptions for your site.

## Configuration

Current site-specific assumptions include:

- `module load nf-core`
- hardcoded local install path for `nf-core-rnaseq` 3.22.2
- shared Singularity cache path
- `-profile tufts`
- `@tufts.edu` email notifications

Operational behavior:

- `workdir` is the app staging path.
- `outdir` is the pipeline results directory.
- Local mode submits one scheduler job and runs Nextflow inside it with `-profile singularity`.

## Usage

1. Choose execution mode and resource values.
2. Provide the RNA-seq sample sheet, output directory, and any required reference inputs.
3. Configure trimming, alignment, UMI, output, and QC settings as needed.
4. Submit and inspect results from the working-directory link or final output path.

## Important Notes and Limitations

- This app is non-interactive after launch.
- Sites should document which reference presets are supported locally.
- Outside users may expect example sample-sheet formats in the README or adjacent docs.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
