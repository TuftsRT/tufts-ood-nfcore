# nf-core/sarek 3.8.1 for Open OnDemand

This app wraps `nf-core/sarek` 3.8.1 in Open OnDemand for germline and somatic variant-calling workflows.

## Purpose

Use this app to run Sarek for FASTQ- or alignment-based DNA variant analysis with configurable preprocessing, UMI handling, variant calling, annotation, and reference settings.

## Key Features

- Supports input/output setup plus core workflow-mode configuration.
- Exposes preprocessing, UMI, variant-calling, post-calling, annotation, and reference sections.
- Includes a custom running page that can show the tail of `output.log`.
- Supports optional resume and Seqera Platform / Tower monitoring.

## Key Form Sections

- Input/output options
- Main options
- FASTQ preprocessing
- Unique Molecular Identifiers
- Preprocessing
- Variant calling
- Post variant calling
- Annotation
- General reference genome options
- Reference genome options

## Installation

1. Install the app in the Open OnDemand system app directory.
2. Review resource defaults, scheduler flags, references, and storage assumptions.
3. Update `template/script.sh.erb` and `submit.yml.erb` for your site before public deployment.

## Configuration

Current site-specific assumptions:

- `module load nf-core`
- hardcoded local install path for `nf-core-sarek` 3.8.1
- shared Singularity cache path
- `-profile tufts`
- `@tufts.edu` email notifications

Additional app-specific behavior:

- The running page links to the working directory and can display the tail of `output.log`.
- `submit.yml.erb` adds `output_log_path` as a connection parameter.
- Slurm-mode submission currently requests a fixed memory value in the job wrapper.

## Usage

1. Select executor and resource values.
2. Provide the required input sheet and output directory.
3. Configure the sections relevant to your use case, such as preprocessing, variant callers, and annotation.
4. Submit the run and monitor progress using the working-directory link or `output.log`.

## Important Notes and Limitations

- This app is still non-interactive; the running page is a status and file-access view only.
- Outside users will expect explicit guidance on supported sample-sheet formats and germline versus somatic modes.
- Reference and caller prerequisites should be documented clearly before Appverse submission.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
