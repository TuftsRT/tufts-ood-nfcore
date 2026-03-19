# nf-core/fetchngs 1.12.0 for Open OnDemand

This app wraps `nf-core/fetchngs` 1.12.0 in Open OnDemand to download sequencing data and metadata from public archives through a guided form.

## Purpose

Use this app to retrieve public datasets and build standardized sample sheets for downstream nf-core pipelines.

## Key Features

- Simple input form focused on accession-driven data retrieval.
- Supports optional resume and Seqera Platform / Tower monitoring.
- Uses the same launch model as the other nf-core apps in this repository.

## Key Form Sections

- Input/output options

## Installation

1. Install the app in your Open OnDemand system app path.
2. Review site scheduler settings, filesystem widgets, and visibility in `manifest.yml`.
3. Update the hardcoded runtime assumptions in the launch script for your environment.

## Configuration

Current site-specific assumptions include:

- `module load nf-core`
- hardcoded local install path for `nf-core-fetchngs` 1.12.0
- shared Singularity cache path
- `-profile tufts`
- `@tufts.edu` email notifications

Operational notes:

- `workdir` is the app-side staging directory.
- `outdir` is the pipeline output directory.
- `executor=local` still runs inside a scheduler job allocation.

## Usage

1. Choose executor and resource settings.
2. Provide the required accession or input sheet values and an output directory.
3. Submit the job and use the working-directory link on the running page to inspect downloaded files and generated metadata.

## Important Notes and Limitations

- This app is non-interactive after submission.
- Download-heavy workflows may require site review for network policy, storage quotas, and archive-access rules.
- Public-facing documentation benefits from an example of accepted accession formats or sample sheets.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
