# nf-core/ampliseq 2.16.1 for Open OnDemand

This app wraps `nf-core/ampliseq` 2.16.1 in an Open OnDemand form so users can launch amplicon-sequencing analyses without writing a long Nextflow command manually.

## Purpose

Use this app to run nf-core/ampliseq for microbiome or other marker-gene workflows that require primer-aware preprocessing, ASV generation, taxonomic assignment, and optional downstream diversity analysis.

## Key Features

- Supports sample sheet, FASTA, and input-folder driven runs.
- Exposes primer, read-quality, ASV, taxonomy, and downstream-analysis settings.
- Supports optional resume and Seqera Platform / Tower monitoring.
- Lets users launch through either a site Nextflow scheduler profile or a single-allocation local mode.

## Key Form Sections

- Main arguments
- Sequencing input
- Primer removal
- Read trimming and quality filtering
- Amplicon Sequence Variants (ASV) calculation
- ASV post processing
- Taxonomic assignment
- Multi-region taxonomic database
- ASV filtering
- Downstream analysis
- Differential abundance analysis
- Pipeline summary report

## Installation

1. Copy this directory into your Open OnDemand system app path.
2. Keep or change the empty `category` in `manifest.yml` depending on whether you want the app hidden from top-level navigation.
3. Review `submit.yml.erb`, `form.yml.erb`, and `template/script.sh.erb` for local scheduler, filesystem, and module-stack changes.

## Configuration

This app currently includes Tufts-specific runtime assumptions that most external sites will need to change:

- `module load nf-core`
- pipeline path under `/cluster/tufts/apps/container/biocontainers/nf-core/pipelines/...`
- Singularity cache path under `/cluster/tufts/apps/container/biocontainers/nf-core/singularity-images`
- scheduler profile `-profile tufts`
- email notifications sent to `USER@tufts.edu`

Important behavior:

- `workdir` is the job staging directory used by the app.
- `outdir` is passed to the pipeline as the results directory.
- `executor=slurm` runs the pipeline with the site Nextflow profile.
- `executor=local` still submits a scheduler job, but Nextflow runs inside that allocation with a generated `custom.config`.

## Usage

1. Choose walltime, executor, partition, CPU, memory, and a working directory.
2. Provide the required amplicon inputs such as sample sheet, primers, and output directory.
3. Enable only the analysis sections needed for the study design.
4. Submit the job and monitor it through Open OnDemand, the working-directory link, or Seqera Platform if a token is provided.

## Important Notes and Limitations

- This is a non-interactive launcher; the running app page only links to the working directory.
- The form exposes many advanced nf-core parameters, but not every upstream option.
- Sites should validate that the selected defaults make sense for their reference data and taxonomic databases.
- The current implementation is tuned for a local pipeline install rather than fetching the workflow at launch time.

## Files

- `manifest.yml`: app metadata
- `form.yml.erb`: main user form
- `form.js`: form UI enhancements
- `submit.yml.erb`: scheduler submission template
- `template/nf-params.json.erb`: generated pipeline parameters
- `template/script.sh.erb`: launch script
- `view.html.erb`: post-launch working-directory link
