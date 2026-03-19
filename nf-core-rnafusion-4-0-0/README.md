# nf-core/rnafusion 4.0.0 for Open OnDemand

This app wraps `nf-core/rnafusion` 4.0.0 in Open OnDemand for RNA fusion detection workflows.

## Purpose

Use this app to run fusion-detection analyses on RNA-seq data with configurable trimming, alignment-compression, skip-step, and reference-genome settings.

## Key Features

- Supports pipeline inputs and skip-step controls for targeted fusion workflows.
- Exposes read-trimming, reference, and aligner-related compression options.
- Supports optional resume and Seqera Platform / Tower monitoring.

## Key Form Sections

- Skip steps
- Input/output options
- Read trimming options
- Alignment compression options
- Reference genome options

## Installation

1. Install the app under the Open OnDemand system app directory.
2. Review the form defaults and site-specific runtime assumptions.
3. Update scheduler profile, module, and filesystem settings before public release.

## Configuration

Current assumptions to revisit:

- `module load nf-core`
- hardcoded `nf-core-rnafusion` 4.0.0 pipeline path
- shared Singularity cache directory
- `-profile tufts`
- `@tufts.edu` email notifications

## Usage

1. Set executor, resources, and working directory.
2. Provide the required RNA-seq input sheet and output directory.
3. Configure any trimming, skip-step, and reference settings needed for the dataset.
4. Submit and monitor through Open OnDemand or Seqera Platform.

## Important Notes and Limitations

- This is a non-interactive launcher.
- Fusion workflows often depend heavily on reference preparation; outside users will expect clear reference prerequisites.
- The form contains some highly specific advanced fields, so adding example use cases before Appverse submission would help.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
