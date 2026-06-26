# Tufts nf-core for Open OnDemand

A single repository (monorepo) of Open OnDemand apps for running [nf-core](https://nf-co.re) pipelines on Tufts HPC. It contains one dashboard landing page plus a set of versioned `nf-core-*` Batch Connect launch apps, and is registered with [Appverse](https://openondemand.connectci.org/appverse-contributor-documentation) as a Monorepo via the root `appverse.yml`.

To convert nf-core pipelines into Open OnDemand apps, see our in-house tool [nfcore2ood](https://github.com/TuftsRT/nfcore2ood).

## Repository layout

```
.
├── appverse.yml                  # Appverse monorepo catalog config (lists every app below)
├── dashboard/                    # nf-core landing-page app (app_type: dashboards)
└── nf-core-<pipeline>-<version>/ # individual Batch Connect launch apps (app_type: batch-connect-basic)
```

The `dashboard/` app groups pipelines by `subcategory`, collapses multiple versions of the same pipeline into one listing, and links to each pipeline's launch form. Each `nf-core-*` directory is a self-contained Batch Connect app (form, submit, and launch templates) that runs one pipeline version.

## Apps in this repo

The dashboard plus the following pipeline apps:

- Ampliseq v2.16.1 — amplicon sequencing (16S/ITS) taxonomic profiling
- ChIP-seq v2.1.0 — peak-calling and QC
- De Novo Transcript v1.2.1 — de novo transcriptome assembly
- Differential Abundance v2.0.0 — differential abundance / expression analysis
- FetchNGS v1.12.0 — download and prepare public sequencing data (SRA/ENA/GEO)
- Funcscan v3.0.0 — functional gene screening (AMR, BGCs)
- MAG v5.4.2 — metagenome assembly and binning
- Methylseq v4.1.0 — bisulfite sequencing / DNA methylation
- Pathogen Surveillance v1.1.0 — pathogen identification, variant calling, surveillance
- Protein Families v2.4.0 — protein family generation and annotation
- RNA Fusion v4.1.0 — gene fusion detection from RNA-seq
- RNA-seq v3.25.0 and v3.26.0 — bulk RNA-seq quantification and QC
- Sarek v3.8.1 — germline and somatic variant calling (WGS/WES)
- scRNA-seq v4.1.0 — single-cell RNA-seq pre-processing and quantification
- Taxprofiler v2.0.0 — taxonomic profiling of metagenomic samples

## Deployment

Each `nf-core-*` app installs and runs as a normal Open OnDemand Batch Connect app. The `dashboard/` app is a dashboard integration layer (controller, route initializer, and view) rather than a standalone app — see [`dashboard/README.md`](dashboard/README.md) for the symlink-based install steps and runtime assumptions.

## Maintainer

Tufts Research Technology — https://it.tufts.edu/researchtechnology.tufts.edu
