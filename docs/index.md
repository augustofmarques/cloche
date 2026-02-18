---
layout: default
title: Home
---

<div class="hero">
    <h1>GNX</h1>
    <p>OCI image based on Ublue, built with blue build.</p>
    <a href="#install" class="btn">Start Now</a>
</div>

## Why GNX?

<div class="grid">
    <div class="card">
        <h3>Immutable</h3>
        <p>Based on os-tree. Your system not only won't break during update and even so it allows you to rollback to previous versions.</p>
    </div>
    <div class="card">
        <h3>Latest desktop experience</h3>
        <p>Up to date KDE Plasma.</p>
    </div>
    <div class="card">
        <h3>Convenience at install</h3>
        <p>Comes ready with editors and tooling, and more to come.</p>
    </div>
</div>

---

<div id="install"></div>

## Instalation

For clean install download and flash image files (.iso) onto flash drive

or

If you're on Fedora Atomic or any Universal Blue OS you can **rebase** or *switch bootc* without losing any data:

```bash
# run on your terminal:
rpm-ostree rebase ostree-unverified-registry:ghcr.io/wolframium/gnx-workstation:latest
