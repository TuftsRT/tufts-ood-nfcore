# tufts-ood-nfcore

This repository contains Tufts University's deployed Open OnDemand (OOD) applications for running [nf-core](https://nf-co.re/) workflows on HPC. It includes:

- a parent `nf-core` dashboard app that provides a single entry point for users
- individual `nf-core-xxx` pipeline apps used to configure and launch specific workflows and versions

This repository is shared as a public reference implementation of a working OOD nf-core deployment.

## Important Note for Other Sites

If you are external to Tufts and want to build your own nf-core Open OnDemand deployment, you will probably want to start with [TuftsRT/nfcore2ood](https://github.com/TuftsRT/nfcore2ood), which is the generator and framework used to create site-specific nf-core OOD apps.

This repository is the deployed output of Tufts's use of that tooling. You are welcome to study it, adapt ideas from it, or use parts of it as a starting point, but most sites will be better served by generating their own deployment and customizing it for their scheduler, file system, module stack, and local policies.

## What This Repository Provides

This repository demonstrates a practical nf-core deployment pattern for Open OnDemand:

- one parent dashboard app for nf-core workflow discovery
- grouped workflow presentation so users browse pipelines by purpose instead of scanning many individual app tiles
- version-aware launching from the dashboard into child pipeline apps
- individual pipeline forms with conditional parameter visibility
- JavaScript-based form enhancements for clearer visual cues
- hiding child nf-core apps from top-level navigation while still making them available through the nf-core dashboard

This design is especially useful for HPC users who want to run bioinformatics workflows but are not comfortable building long Nextflow command lines by hand.

## User Interface Overview

### nf-core Dashboard

The parent app provides a single dashboard entry point where users can browse available nf-core workflows and launch specific versions.

![nf-core dashboard](docs/nf-core-dashboard.png)

### Individual Pipeline App Form

Each child app presents a pipeline-specific Open OnDemand form for configuring workflow inputs, resources, and optional parameters.

![nf-core app form](docs/nf-core-app.png)

## Repository Structure

The exact contents may change over time, but the repository generally contains:

- a parent app, typically named `nf-core`, which provides the central dashboard page
- many child apps named like `nf-core-<pipeline>-<version>`
- each child app includes its own OOD form files, submission templates, and app metadata
- shared deployment patterns used at Tufts for organizing nf-core apps in OOD

## Deployment Model

At Tufts, the parent dashboard app and child nf-core apps are installed as OOD system apps. The parent app is integrated into the existing Open OnDemand dashboard by linking a small set of files into `/etc/ood/config/apps/dashboard`, typically including:

- a route initializer
- a controller
- a view template

This lets the nf-core dashboard appear as part of the normal OOD interface without maintaining a full fork of the dashboard.

The child apps are typically hidden from top-level navigation by using empty or site-specific hidden categories in their `manifest.yml` files. They remain launchable through the parent nf-core dashboard.

## Why This Design Is Useful

This deployment pattern has several practical benefits for HPC centers:

- Users get one clear entry point for nf-core workflows instead of many separate menu items.
- Bioinformatics workflows do not clutter the shared OOD navigation for non-bioinformatics users.
- Pipeline versions stay available, but are organized under the relevant workflow.
- Existing child apps remain reusable, so the parent dashboard is mainly an organizational layer.
- The OOD dashboard integration is easier to maintain than carrying a full dashboard fork.
- Other centers can reproduce the same model with their own local configuration.

## Requirements

A site using this repository or adapting its design should already have:

- Open OnDemand installed and working
- a supported batch scheduler configured in OOD
- nf-core workflows packaged as OOD apps or generated from a compatible pipeline-app generator
- local decisions for software delivery, such as modules, Conda, Apptainer/Singularity, or other runtime methods
- shared storage paths and permissions suitable for user-submitted workflows

## Suggested Deployment Steps

The exact steps depend on your site, but a typical process is:

1. Install the parent `nf-core` app and the child `nf-core-xxx` apps under your OOD system app directory.
2. Review and customize each child app for your scheduler, partitions/queues, file system paths, modules, and local policies.
3. Link the parent dashboard route, controller, and view into `/etc/ood/config/apps/dashboard`.
4. Configure child app visibility in `manifest.yml` so users access them through the parent dashboard rather than top-level navigation.
5. Restart or refresh the OOD dashboard environment.
6. Test the parent dashboard, several child app forms, and at least one real workflow submission.
7. Plan for routine cache maintenance if your deployment uses shared Open OnDemand app cache or staged app metadata. At Tufts, cache cleanup is handled with a companion utility repository.

## Site Customization Areas

Other HPC centers should expect to modify at least the following:

- scheduler and queue/partition settings
- CPU, memory, and walltime defaults
- file system paths and favorites in OOD form widgets
- module/container/runtime configuration
- local branding and descriptive text
- which nf-core workflows and versions are exposed
- category and subcategory metadata used for dashboard grouping

## Notes on Form Behavior

Many nf-core pipelines support multiple analysis routes, optional tools, and advanced parameters. To keep forms usable, child apps in this deployment use progressive disclosure patterns such as OOD `data-hide-*` attributes in `form.yml.erb`. This means users only see some advanced parameters after enabling the related option.

Some child apps also use `form.js` to add icons and clearer visual emphasis to important controls.

## Reference Implementation, Not a Universal Package

This repository reflects Tufts-specific deployment choices. It should be treated as:

- a working example of how nf-core can be deployed in OOD
- a reference for architecture and integration patterns
- a source of practical ideas for form design and dashboard organization

It should not be assumed to be directly portable to another site without local adaptation.

## Related Repositories

- [TuftsRT/nfcore2ood](https://github.com/TuftsRT/nfcore2ood): generator/framework for building site-specific nf-core Open OnDemand app
- [TuftsRT/tufts_ood_cache_reset](https://github.com/TuftsRT/tufts_ood_cache_reset): utility for clearing cached Open OnDemand app state when deployment changes are not reflected immediately

## Citation

If this repository or its design helps your site, please consider citing the related publication:

- Y. Zhang et al., _nf-core on Open OnDemand: community-curated bioinformatics pipelines for everyone_, PEARC '24. DOI: https://doi.org/10.1145/3626203.3670559

## Contributors

<table>
  <tr>
    <td align="center" valign="top" width="50%">
      <img src="https://github.com/zhan4429.png" alt="Yucheng Zhang" width="120"><br><br>
      <strong>Yucheng Zhang</strong><br>
      Senior Bioinformatics Engineer<br>
      Research Technology, Tufts Technology Services<br>
      Tufts University<br>
      yucheng.zhang@tufts.edu
    </td>
    <td align="center" valign="top" width="50%">
      <img src="https://github.com/mcglow2.png" alt="Jay McGlothlin" width="120"><br><br>
      <strong>Jay McGlothlin</strong><br>
      Associate Director Research Computing<br>
      Research Technology, Tufts Technology Services<br>
      Tufts University<br>
      Jay.McGlothlin@tufts.edu
    </td>
  </tr>
</table>

## Contact

If you are interested in the approach and want to discuss deployment details, please open an issue in this repository or contact the Tufts Research Technology team.
