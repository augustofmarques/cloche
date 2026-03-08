#!/bin/bash

# Set boot animation and rebuild initramfs
plymouth-set-default-theme spinner
dracut -f --regenerate-all

# Nuke Bazzite wallpaper defaults
echo "Nuking Bazzite default wallpapers..."
rm -f /usr/share/backgrounds/convergence.png
rm -f /usr/share/backgrounds/convergence.jxl
rm -f /usr/share/backgrounds/default.png
rm -f /usr/share/backgrounds/default-dark.png
rm -f /usr/share/backgrounds/default.jxl

# Set Cloche global symlinks
echo "Setting Cloche symlinks..."
ln -sf /usr/share/backgrounds/towers-light.png /usr/share/backgrounds/default.png
ln -sf /usr/share/backgrounds/towers-dark.png /usr/share/backgrounds/default-dark.png

# Disable Bazzite terminal MOTD/banner globally
echo "Disabling Bazzite terminal banner..."
touch /etc/bazzite-no-banner

# The Trojan Horse: Overwrite Bazzite's fastfetch config with Cloche's
echo "Hijacking Bazzite's Fastfetch..."
mkdir -p /usr/share/ublue-os/bazzite/
cp -fv /etc/fastfetch/config.jsonc /usr/share/ublue-os/bazzite/fastfetch.jsonc
