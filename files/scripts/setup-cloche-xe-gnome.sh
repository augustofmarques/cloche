#!/bin/bash

# Set boot animation and rebuild initramfs (Bazzite requirement)
plymouth-set-default-theme spinner
dracut -f --regenerate-all

# Nuke Bazzite and Fedora GNOME wallpaper defaults
echo "Nuking Bazzite/Fedora default wallpapers..."
rm -f /usr/share/backgrounds/convergence.png
rm -f /usr/share/backgrounds/convergence.jxl
rm -f /usr/share/backgrounds/default.png
rm -f /usr/share/backgrounds/default-dark.png
rm -f /usr/share/backgrounds/f40/default/f40-01-day.png
rm -f /usr/share/backgrounds/f40/default/f40-01-night.png

# Set Cloche global symlinks
echo "Setting Cloche symlinks..."
ln -sf /usr/share/backgrounds/towers-light.png /usr/share/backgrounds/default.png
ln -sf /usr/share/backgrounds/towers-dark.png /usr/share/backgrounds/default-dark.png

# Nuke and Replace Fedora GDM/System Logos with Plymouth Watermark (GNOME Fix)
echo "Replacing Fedora GDM and System Logos..."
rm -f /usr/share/pixmaps/fedora-gdm-logo.png
rm -f /usr/share/pixmaps/system-logo-white.png
ln -sf /usr/share/plymouth/themes/spinner/watermark.png /usr/share/pixmaps/fedora-gdm-logo.png
ln -sf /usr/share/plymouth/themes/spinner/watermark.png /usr/share/pixmaps/system-logo-white.png

# Disable Bazzite terminal MOTD/banner globally
echo "Disabling Bazzite terminal banner..."
touch /etc/bazzite-no-banner

# The Trojan Horse: Overwrite Bazzite's fastfetch config with Cloche's
echo "Hijacking Bazzite's Fastfetch..."
mkdir -p /usr/share/ublue-os/bazzite/
cp -fv /etc/fastfetch/config.jsonc /usr/share/ublue-os/bazzite/fastfetch.jsonc

# --- GNOME DATABASE COMPILATION ---
echo "Nuking upstream skel dconf (The Skel Trap)..."
rm -rf /etc/skel/.config/dconf

echo "Compiling GNOME dconf database..."
dconf update
