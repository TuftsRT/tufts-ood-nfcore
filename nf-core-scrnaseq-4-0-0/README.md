# nf-core/scrnaseq 4.0.0 for Open OnDemand

This app wraps `nf-core/scrnaseq` 4.0.0 in Open OnDemand for single-cell RNA-seq analysis workflows.

## Purpose

Use this app to launch single-cell RNA-seq runs with configurable technology-specific toolchains and reference options.

## Key Features

- Supports multiple single-cell processing back ends, including Simpleaf, STARsolo, Kallisto/BUS, Cell Ranger, Cell Ranger ARC, and Cell Ranger multi modes.
- Exposes required inputs, skip-tool options, and technology-specific advanced sections.
- Supports optional resume and Seqera Platform / Tower monitoring.

## Key Form Sections

- Input/output options
- Mandatory arguments
- Skip tools
- Reference genome options
- Simpleaf options
- STARsolo options
- Kallisto/BUS options
- Cellranger options
- Cellranger ARC options
- Cellranger Multi options

## Installation

1. Install the app in your Open OnDemand system app path.
2. Review form defaults and technology-specific assumptions for your local environment.
3. Update scheduler, module, pipeline-path, and filesystem settings before sharing publicly.

## Configuration

This app currently assumes:

- `module load nf-core`
- a local install path for `nf-core-scrnaseq` 4.0.0
- a shared Singularity cache path
- `-profile tufts`
- `@tufts.edu` email notifications

## Usage

1. Choose executor, resources, working directory, and output directory.
2. Provide the required single-cell inputs and select the relevant analysis toolchain.
3. Configure only the technology-specific section that matches the run.
4. Submit and monitor the workflow through Open OnDemand or Seqera Platform.

## Important Notes and Limitations

- This app is non-interactive after submission.
- Because the upstream pipeline supports many technologies, public documentation should include example use cases and expected input layouts.
- Sites should document which toolchains are fully supported in their environment.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
