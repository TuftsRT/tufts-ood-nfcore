# nf-core/chipseq 2.1.0 for Open OnDemand

This app wraps `nf-core/chipseq` 2.1.0 in Open OnDemand so users can configure and submit ChIP-seq analyses from a web form.

## Purpose

Use this app to run ChIP-seq workflows for alignment, peak calling, QC, and downstream reporting with the pipeline version packaged by your site.

## Key Features

- Collects experiment metadata and input sample-sheet paths.
- Exposes reference-genome, trimming, alignment, peak-calling, and QC controls.
- Supports optional resume and Seqera Platform / Tower monitoring.
- Supports a site scheduler profile or single-allocation local execution mode.

## Key Form Sections

- Input/output options
- Reference genome options
- Adapter trimming options
- Alignment options
- Peak calling options
- Process skipping options

## Installation

1. Install the app in your Open OnDemand system app directory.
2. Review `manifest.yml` visibility settings for your navigation model.
3. Customize the scheduler, filesystem, module, and pipeline path assumptions before public deployment.

## Configuration

Site-specific items that should be reviewed before reuse:

- `module load nf-core`
- hardcoded pipeline path for `nf-core-chipseq` 2.1.0
- hardcoded Singularity cache directory
- `-profile tufts` for scheduler-backed execution
- `USER@tufts.edu` notification email format

Operational behavior:

- `workdir` stores the generated `nf-params.json` and job-side working files.
- `outdir` is the pipeline results directory.
- `executor=slurm` uses the site Nextflow profile.
- `executor=local` uses `-profile singularity -c custom.config` within one scheduler allocation.

## Usage

1. Set resource values and choose an execution mode.
2. Provide the sample sheet and output directory.
3. Configure references, aligner, peak-calling parameters, and any QC skips.
4. Submit the workflow and follow the results link from the running-job page.

## Important Notes and Limitations

- This app does not provide an interactive interface after submission.
- Reference assets must match the selected aligner and analysis path.
- Review the form defaults carefully if your site uses different genome resources or blacklists.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
