# nf-core/methylseq 4.1.0 for Open OnDemand

This app wraps `nf-core/methylseq` 4.1.0 in Open OnDemand for DNA methylation analysis workflows.

## Purpose

Use this app to process bisulfite-sequencing datasets with options for alignment, methylation calling, QC, and targeted-analysis features supported by the upstream pipeline.

## Key Features

- Exposes input, alignment, library-type, adapter-trimming, Bismark, Qualimap, and targeted-sequencing settings.
- Includes controls for saving intermediate outputs and selectively skipping or enabling major steps.
- Supports optional resume and Seqera Platform / Tower monitoring.

## Key Form Sections

- Input/output options
- Save intermediate files
- Reference genome options
- Alignment options
- Special library types
- Adapter trimming
- Bismark options
- Qualimap options
- Targeted sequencing analysis options
- Skip pipeline steps
- Run pipeline steps

## Installation

1. Install the app under the Open OnDemand system app directory.
2. Review local paths, genome references, scheduler settings, and app visibility.
3. Update launch-time module, cache, and pipeline path assumptions for your site.

## Configuration

Current site-specific assumptions:

- `module load nf-core`
- hardcoded `nf-core-methylseq` 4.1.0 pipeline path
- shared Singularity cache directory
- `-profile tufts`
- `@tufts.edu` email notifications

Operational notes:

- `workdir` is the app staging area.
- `outdir` is the pipeline results path.
- Local execution still happens inside a scheduler allocation.

## Usage

1. Set executor and resource values.
2. Provide the required input and output paths.
3. Configure references, library-type settings, and any optional trimming or Bismark controls.
4. Submit the job and inspect progress through Open OnDemand and the output directory.

## Important Notes and Limitations

- This app is non-interactive after launch.
- Public users will expect a short explanation of supported input formats and common bisulfite-seq modes.
- Reference preparation and Bismark resource choices may need site-specific guidance.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
