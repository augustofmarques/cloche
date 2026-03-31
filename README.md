*[Leia em Português](README.pt-BR.md)*

# Cloche OS

**Personal immutable desktop image based on Fedora Atomic.**

Cloche is a custom OCI image built using the BlueBuild framework. It is designed to be a reliable "daily driver" that follows a declarative configuration model, allowing for a reproducible, stable workstation environment and fast deployments.

## Technical Architecture

  - **Base:** Fedora / Universal Blue (ublue-os).

  - **Atomic/Immutable:** rpm-ostree for atomic updates and rollbacks.

  - **Build System:** GitHub Actions for automated image layering.

  - **Configuration:** Managed via YAML recipes, defining system packages, flatpaks, and custom scripts.

## Key Features

  - **Declarative Setup:** The entire system state is defined in this repository.

  - **CI/CD Integration:** Automated builds triggered by configuration changes.

  - **Hybrid Package Management:** Core system layers via rpm-ostree and application sandboxing via Flatpak.

  - **Optimized Defaults:** Pre-configured tools for infrastructure management and development.

  - **Batteries included:** As is the case with ublue images

  - **Containerized workflows:** Includes Distrobox and Docker out-of-box.

## Available Images

This project maintains multiple image flavors to support different hardware configurations and desktop environments (KDE Plasma and GNOME).

| Image Name | Desktop Environment | Target / Use Case |
| :--- | :--- | :--- |
| **cloche-standard** | KDE Plasma | General purpose workstation |
| **cloche-standard-gnome** | GNOME | General purpose workstation |
| **cloche-xe** | KDE Plasma | Performance/Gaming-oriented / Workstation |
| **cloche-xe-gnome** | GNOME | Performance/Gaming-oriented / Workstation |
| **cloche-xe-deck** | KDE Plasma | Optimized for Steam Deck |
| **cloche-xe-deck-gnome** | GNOME | Optimized for Steam Deck |

## Branching Model

- **main/latest**: Stable builds, tested and ready for daily use.

- **beta/testing**: Testing branch for new upstream versions, testing features, and experimental recipes.

## Installation

### CAUTION!

***This is a personal configuration. Rebase at your own risk.***

To rebase an existing Fedora Atomic installation to Cloche, replace `<IMAGE_NAME>` with your preferred image from the table above, and `<TAG>` with either `latest` (main) or `testing` (beta).

Rebase to the unverified registry:

~~~bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/augustofmarques/<IMAGE_NAME>:<TAG>
~~~

Example for the KDE Standard image on the stable branch:

~~~bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/augustofmarques/cloche-standard:latest
~~~

Reboot to apply changes:
~~~bash
systemctl reboot
~~~ 

**Optional:** Verify and rebase to the signed image:
Once the public key is configured, you can switch to the signed image for increased security.

## Local ISO Generation

You can also generate a bootable ISO locally using the `bluebuild` CLI. 

Run the following command, replacing the output name and the target image/tag:

~~~bash
sudo bluebuild generate-iso --iso-name <OUTPUT_NAME>.iso image ghcr.io/augustofmarques/<IMAGE_NAME>:<TAG>
~~~

**Example:** Generating an ISO for the GNOME Steam Deck image on the beta branch:

~~~bash
sudo bluebuild generate-iso --iso-name cloche-deck-gnome.iso image ghcr.io/augustofmarques/cloche-xe-deck-gnome:testing
~~~

> ***Note:*** Check the packages section of this repository in order to also find images names and tags for each branch such as beta.<br>
If the commands to build images or ISOs is left without tag, the command will default to the latest image from the main branch.

## Project Goal

The purpose of Cloche is to eliminate manual post-install steps. By treating the workstation as an immutable asset, I ensure that my environment is consistent across different machines and easy to recover quickly in case of hardware failure.

## Disclaimer

This is a personal project developed for educational and hobbyist purposes. While I use it as my daily driver, it is provided as-is, without any warranties. Use it at your own risk.