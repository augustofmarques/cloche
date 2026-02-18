---
layout: default
title: Home
---

<div class="hero">
    <h1>GNX Workstation</h1>
    <p>Uma imagem OCI baseada no Fedora Atomic, focada em estabilidade, design e performance.</p>
    <a href="#instalar" class="btn">Começar Agora</a>
</div>

## Por que GNX?

<div class="grid">
    <div class="card">
        <h3>Imutável</h3>
        <p>Baseado na tecnologia ostree. Seu sistema nunca quebra em atualizações.</p>
    </div>
    <div class="card">
        <h3>Design Focado</h3>
        <p>GNOME limpo, fontes otimizadas e sem bloatware desnecessário.</p>
    </div>
    <div class="card">
        <h3>Dev Ready</h3>
        <p>Vem pronto com Docker, Podman, VSCode e ferramentas de build.</p>
    </div>
</div>

---

<div id="instalar"></div>

## Instalação

Se você já usa Fedora Silverblue, Kinoite ou qualquer imagem uBlue, basta fazer o **rebase**:

```bash
# Abra seu terminal e rode:
rpm-ostree rebase ostree-unverified-registry:ghcr.io/wolframium/gnx-workstation:latest
