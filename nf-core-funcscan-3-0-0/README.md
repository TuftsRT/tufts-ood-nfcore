# nf-core/funcscan 3.0.0 for Open OnDemand

This app wraps `nf-core/funcscan` 3.0.0 in Open OnDemand for metagenomic functional screening and annotation workflows.

## Purpose

Use this app to screen metagenomic assemblies or sequence data for functions such as antimicrobial peptides, antimicrobial resistance genes, biosynthetic gene clusters, and taxonomic annotation.

## Key Features

- Exposes a broad set of functional-screening and annotation options.
- Supports multiple screening families including AMP, ARG, and BGC analyses.
- Includes database download and annotation-tool configuration sections.
- Supports optional resume and Seqera Platform / Tower monitoring.

## Key Form Sections

- Input/output options
- Screening type activation
- Taxonomic classification options
- Annotation general options
- Annotation tool sections for BAKTA, Prokka, Prodigal, and Pyrodigal
- Protein annotation options
- Database downloading options
- AMP analysis sections
- ARG analysis sections
- BGC analysis sections

## Installation

1. Install the app in your Open OnDemand system app directory.
2. Review form defaults carefully; this workflow exposes many advanced controls and database-dependent options.
3. Customize scheduler, module, filesystem, and database assumptions for your site.

## Configuration

This app currently depends on Tufts-specific assumptions:

- `module load nf-core`
- hardcoded `nf-core-funcscan` 3.0.0 pipeline location
- shared Singularity cache directory
- `-profile tufts`
- `@tufts.edu` email notifications

Because this workflow is database-heavy, external sites should also verify:

- database locations and permissions
- expected disk consumption
- whether users can or should download databases at run time

## Usage

1. Choose the executor and requested resources.
2. Provide required inputs and output directory.
3. Enable only the screening families needed for the project.
4. Configure the matching annotation and database sections.
5. Submit and monitor the results through Open OnDemand or Seqera Platform.

## Important Notes and Limitations

- This is a non-interactive launcher.
- The form is extensive and may be intimidating for new users without site guidance.
- Reviewers may expect example inputs and clearer database prerequisites before Appverse submission.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
