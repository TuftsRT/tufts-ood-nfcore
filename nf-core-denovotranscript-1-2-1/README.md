# nf-core/denovotranscript 1.2.1 for Open OnDemand

This app wraps `nf-core/denovotranscript` 1.2.1 in Open OnDemand for de novo transcriptome assembly, QC, and quantification workflows.

## Purpose

Use this app when you need to assemble transcriptomes from RNA-seq reads, or when you want to run QC and quantification against an existing transcript assembly.

## Key Features

- Supports full runs, QC-only runs, and runs that skip assembly when an existing transcript FASTA is available.
- Exposes FastQC/fastp, ribosomal RNA removal, assembly, BUSCO, rnaQUAST, TransRate, and quantification settings.
- Supports optional resume and Seqera Platform / Tower monitoring.
- Offers scheduler-profile or local-in-allocation execution.

## Key Form Sections

- Partial run options
- Input/output options
- FastQC/fastp options
- SortMeRNA options
- Assembly options
- BUSCO options
- rnaQUAST options
- TransRate options
- Salmon options
- Reference genome options

## Installation

1. Install the app in your Open OnDemand system app directory.
2. Review form widgets and defaults for your local filesystems and references.
3. Update the launch script and submission template for your module stack and scheduler profile.

## Configuration

This app currently assumes:

- `module load nf-core`
- a site-local `nf-core-denovotranscript` 1.2.1 pipeline path
- a shared Singularity cache path
- a `tufts` Nextflow scheduler profile
- notification emails ending in `@tufts.edu`

Behavior to document for users:

- `qc_only` runs QC without assembly or quantification.
- `skip_assembly` requires `transcript_fasta`.
- `workdir` is the app staging directory; `outdir` is the final results location.

## Usage

1. Select executor and resource settings.
2. Choose whether to run full analysis, QC only, or skip assembly.
3. Provide the sample sheet, output directory, and any required assembly/reference inputs.
4. Submit and monitor the run from Open OnDemand or Seqera Platform.

## Important Notes and Limitations

- This is a non-interactive launcher.
- External sites will likely need to change default references, BUSCO resources, and storage paths.
- The form mirrors many pipeline options, so new users may need guidance on which sections are optional.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
