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
        <h3>Imutável</h3>
        <p>Baseado na tecnologia ostree. Seu sistema nunca quebra em atualizações.</p>
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

## Instalação

For clean install download and flash image files (.iso) onto flash driver

or

If you're on Fedora Atomic or any Universal Blue OS you can **rebase** or *switch bootc* without losing any data:

```bash
# Abra seu terminal e rode:
rpm-ostree rebase ostree-unverified-registry:ghcr.io/wolframium/gnx-workstation:latest
