# Tufts nf-core for Open OnDemand

A monorepo of [Open OnDemand](https://openondemand.org) (OOD) apps for running [nf-core](https://nf-co.re) pipelines on Tufts HPC. It contains:

- **`dashboard/`**: a single landing page that lists every installed nf-core pipeline and its versions. It is **site-independent and ready to use at any center.**
- **`nf-core-<pipeline>-<version>/`**: Batch Connect launch apps, one per pipeline version. These are **Tufts-specific reference apps** (see below).

The repository is registered with [Appverse](https://openondemand.connectci.org/appverse-contributor-documentation) as a Monorepo via the root `appverse.yml`.

> [!IMPORTANT]
> **Do not copy the `nf-core-*` apps from this repository to your site.**
> They were generated for Tufts HPC and contain Tufts-specific paths, modules, partitions, and the `tufts` nf-core profile. They will not run correctly anywhere else.
>
> To deploy at your center:
> 1. **Generate your own apps** with [nfcore2ood](https://github.com/TuftsRT/nfcore2ood): download the nf-core pipelines you want, then convert them to OOD apps using your site's configuration.
> 2. **Install the `dashboard/` from this repository** on top of your generated apps. No changes to the dashboard are needed.

## Which parts do I use?

| Component | Where it comes from | Customize for your site? |
|---|---|---|
| `nf-core-*` pipeline apps | **Generate your own** with [nfcore2ood](https://github.com/TuftsRT/nfcore2ood) | Yes. They are generated from your site configuration. |
| `dashboard/` | **This repository** | No. Use as-is. |

## Requirements

- Open OnDemand 3.1 or newer (required by the form behavior that nfcore2ood generates)
- Admin (root/sudo) access to your OOD system apps directory, typically `/var/www/ood/apps/sys/`
- A site where Nextflow and a container engine (Apptainer/Singularity) are available to compute nodes
- Python 3 on the machine where you run nfcore2ood

<!-- TODO: add the OOD version(s) you have tested the dashboard on, e.g. "Dashboard tested on OOD x.y.z". -->

## Deploying at your center

### Step 1: Generate your pipeline apps with nfcore2ood

1. Clone [nfcore2ood](https://github.com/TuftsRT/nfcore2ood) and create your site configuration:

   ```bash
   git clone https://github.com/TuftsRT/nfcore2ood.git
   cd nfcore2ood
   cp nf2ood.env.example nf2ood.env
   ```

2. Edit `nf2ood.env` for your site. The values shipped in the example file are Tufts values. At minimum, set:

   - `NF2OOD_PIPELINE_ROOT`: where downloaded nf-core pipelines are stored
   - `NF2OOD_SINGULARITY_CACHEDIR`: your Singularity/Apptainer cache path
   - `NF2OOD_PARTITION_YML`: a partition snippet matching your scheduler
   - `NF2OOD_SLURM_PROFILE`: **your own** institutional profile from [nf-core/configs](https://nf-co.re/configs/). Do not reuse the Tufts profile.
   - `NF2OOD_CLUSTER`: your OOD cluster id

   See the [nfcore2ood configuration reference](https://github.com/TuftsRT/nfcore2ood#configuration-reference) for every option.

3. Download the pipelines you want to offer:

   ```bash
   source ./nf2ood.env
   ./download_nfcore_pipeline.sh --name rnaseq --revision 3.26.0
   ```

4. Generate the OOD apps:

   ```bash
   ./nf2ood --output /path/to/generated-apps
   ```

   Use `--pipeline` and `--version` to regenerate a single app later without rebuilding everything.

### Step 2: Install the generated apps

Copy the generated `nf-core-<pipeline>-<version>` directories into your OOD system apps directory:

```bash
sudo cp -r /path/to/generated-apps/nf-core-* /var/www/ood/apps/sys/
```

Each app should be readable by all users, and its `manifest.yml` must include a readable `name` and a `subcategory` (nfcore2ood writes both).

### Step 3: Install the dashboard from this repository

```bash
git clone https://github.com/TuftsRT/tufts-ood-nfcore.git

# Install the dashboard app
sudo mkdir -p /var/www/ood/apps/sys/nf-core
sudo cp -r tufts-ood-nfcore/dashboard/. /var/www/ood/apps/sys/nf-core/

# Link its three integration points into the OOD dashboard
sudo ln -s /var/www/ood/apps/sys/nf-core/controllers/nf_pipelines_controller.rb \
  /var/www/ood/apps/sys/dashboard/app/controllers/nf_pipelines_controller.rb

sudo mkdir -p /etc/ood/config/apps/dashboard/views/nf_pipelines
sudo ln -s /var/www/ood/apps/sys/nf-core/views/index.html.erb \
  /etc/ood/config/apps/dashboard/views/nf_pipelines/index.html.erb

sudo mkdir -p /etc/ood/config/apps/dashboard/initializers
sudo ln -s /var/www/ood/apps/sys/nf-core/initializers/nf_core_dashboard_route.rb \
  /etc/ood/config/apps/dashboard/initializers/nf_core_dashboard_route.rb
```

The symlinks are needed because the dashboard extends the stock OOD dashboard rather than replacing it. See [`dashboard/README.md`](dashboard/README.md) for what each file does.

### Step 4: Restart the web server and verify

In Open OnDemand, choose **Help → Restart Web Server** (this restarts your per-user NGINX; restarting Apache alone is not enough). Then open the nf-core dashboard page. Each pipeline you generated should appear, grouped by subcategory, with its versions listed.

## How the dashboard finds your apps

The dashboard does not use a hand-maintained catalog. It discovers child apps at runtime, so it expects them to:

- be installed in the OOD system apps directory
- have directory names like `nf-core-rnaseq-3-26-0` (`nf-core-<pipeline>-<major>-<minor>-<patch>`)
- be Batch Connect apps
- provide `name` and `subcategory` in `manifest.yml`

Apps generated by nfcore2ood follow this convention. Multiple versions of the same pipeline are collapsed into one listing.

## Troubleshooting

| Symptom | Things to check |
|---|---|
| The nf-core page returns an error or 404 | Confirm all three symlinks exist and point to real files. Restart your per-user NGINX (Help → Restart Web Server). |
| The page loads but no pipelines are listed | Confirm the apps are in `/var/www/ood/apps/sys/` and their directory names start with `nf-core-`. Check file permissions. |
| Pipelines are listed but versions are missing or wrong | Check directory names follow `nf-core-<pipeline>-<x>-<y>-<z>` and that each `manifest.yml` has `name` and `subcategory`. Regenerate the app with nfcore2ood if in doubt. |
| An app launches but the job fails | Check the app was generated with **your** `nf2ood.env` (not copied from this repo) and that its paths, modules, and nf-core profile exist on your cluster. |
| Still stuck | Check the dashboard log (`production.log`) for the user's web server and open an issue with the log excerpt and one app's `manifest.yml`. |

## Reference apps (Tufts deployment)

These apps are what nfcore2ood generates with Tufts configuration. They are provided as examples of the expected output and for Tufts deployment; **they are not portable to other sites.**

- Ampliseq v2.16.1: amplicon sequencing (16S/ITS) taxonomic profiling
- ChIP-seq v2.1.0: peak-calling and QC
- De Novo Transcript v1.2.1: de novo transcriptome assembly
- Differential Abundance v2.0.0: differential abundance / expression analysis
- FetchNGS v1.12.0: download and prepare public sequencing data (SRA/ENA/GEO)
- Funcscan v3.0.0: functional gene screening (AMR, BGCs)
- MAG v5.4.2: metagenome assembly and binning
- Methylseq v4.1.0: bisulfite sequencing / DNA methylation
- Pathogen Surveillance v1.1.0: pathogen identification, variant calling, surveillance
- Protein Families v2.4.0: protein family generation and annotation
- RNA Fusion v4.1.0: gene fusion detection from RNA-seq
- RNA-seq v3.25.0 and v3.26.0: bulk RNA-seq quantification and QC
- Sarek v3.8.1: germline and somatic variant calling (WGS/WES)
- scRNA-seq v4.1.0: single-cell RNA-seq pre-processing and quantification
- Taxprofiler v2.0.0: taxonomic profiling of metagenomic samples

## Repository layout

```
.
├── appverse.yml                  # Appverse monorepo catalog config
├── dashboard/                    # nf-core landing page (site-independent, use as-is)
└── nf-core-<pipeline>-<version>/ # Tufts reference apps (generate your own for other sites)
```

## Related tools

- [nfcore2ood](https://github.com/TuftsRT/nfcore2ood): downloads nf-core pipelines and converts them into Open OnDemand apps
- [tufts_ood_cache_reset](https://github.com/TuftsRT/tufts_ood_cache_reset): utility for cache reset

## Contributing and support

Questions or problems? Please [open an issue](https://github.com/TuftsRT/tufts-ood-nfcore/issues). For app-generation problems, include the output of `./nf2ood -V` and the relevant part of your `nf2ood.env` (without sensitive paths).

## Maintainer

Tufts Research Technology: <https://it.tufts.edu/researchtechnology.tufts.edu>

## License

MIT. See [LICENSE](LICENSE).
