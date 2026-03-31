#!/usr/bin/env bash
set -eoux pipefail

rpm-ostree install -y \
    docker \
    plymouth-theme-spinner \
    fastfetch