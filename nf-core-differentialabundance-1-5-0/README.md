# nf-core/differentialabundance 1.5.0 for Open OnDemand

This app wraps `nf-core/differentialabundance` 1.5.0 in Open OnDemand so users can launch differential-abundance or differential-expression analyses from a browser-based form.

## Purpose

Use this app for studies driven by count tables, abundance matrices, or supported assay-specific inputs when the main goal is statistical comparison between experimental groups.

## Key Features

- Supports multiple study and abundance-input modes.
- Exposes options for observations, features, filtering, exploratory analysis, differential testing, GSEA, and reporting.
- Includes assay-specific controls for Affymetrix and Proteus-style inputs.
- Supports optional resume and Seqera Platform / Tower monitoring.

## Key Form Sections

- Input/output options
- Abundance values
- Observations options
- Features options
- Affy input options
- Proteus input options
- Filtering
- Exploratory analysis
- Differential analysis
- DESeq2 specific options
- Limma specific options
- GSEA
- Shiny app settings
- Gene set analysis options
- Reporting options
- Reference genome options

## Installation

1. Install the app into the Open OnDemand system app path.
2. Review site-specific widget defaults and scheduler settings.
3. Confirm that the packaged pipeline path and software module names exist at your site.

## Configuration

Before sharing publicly, review these Tufts-specific assumptions:

- `module load nf-core`
- hardcoded `nf-core-differentialabundance` 1.5.0 pipeline location
- shared Singularity cache location
- `-profile tufts`
- `@tufts.edu` email notifications

Important runtime behavior:

- `study_type` and related options determine which input fields are relevant.
- `workdir` is used for staging and generated files.
- `outdir` is passed to the pipeline as the results path.

## Usage

1. Set execution mode, scheduler resources, working directory, and output directory.
2. Choose the study type and provide the matching input files.
3. Configure filtering, exploratory analysis, statistical testing, and reporting sections as needed.
4. Submit the run and review outputs from the linked working directory or pipeline result directory.

## Important Notes and Limitations

- This app is non-interactive after job launch.
- The form is broad because the upstream pipeline supports many data modalities; not every section applies to every run.
- Public users will expect examples of supported input formats, so adding sample input references before submission would help.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
