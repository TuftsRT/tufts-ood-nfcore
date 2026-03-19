# nf-core/proteinfamilies 1.3.1 for Open OnDemand

This app wraps `nf-core/proteinfamilies` 1.3.1 in Open OnDemand for clustering and aligning protein sequences into families.

## Purpose

Use this app to identify related protein groups from sequence collections and run the clustering, alignment, and redundancy-removal steps exposed by the upstream pipeline.

## Key Features

- Simple form for input/output setup and core protein-family settings.
- Exposes clustering, alignment, and redundancy-removal parameters.
- Supports optional resume and Seqera Platform / Tower monitoring.

## Key Form Sections

- Input/output options
- Clustering parameters
- Alignment parameters
- Redundancy removal parameters

## Installation

1. Install the app in the Open OnDemand system app directory.
2. Review local scheduler and filesystem settings.
3. Update the module, pipeline path, and cache assumptions in the templates before reuse.

## Configuration

This app currently assumes:

- `module load nf-core`
- a hardcoded local install path for `nf-core-proteinfamilies` 1.3.1
- a shared Singularity cache path
- `-profile tufts`
- `@tufts.edu` email notifications

## Usage

1. Select executor and requested resources.
2. Provide required sequence inputs and output location.
3. Adjust clustering, alignment, and redundancy settings.
4. Submit the job and use the Open OnDemand working-directory link to review results.

## Important Notes and Limitations

- This is a non-interactive launcher.
- The current README should eventually include example supported protein input formats for outside users.
- Reviewers may also expect clarification on the intended scale of input datasets.

## Files

- `manifest.yml`
- `form.yml.erb`
- `form.js`
- `submit.yml.erb`
- `template/nf-params.json.erb`
- `template/script.sh.erb`
- `view.html.erb`
