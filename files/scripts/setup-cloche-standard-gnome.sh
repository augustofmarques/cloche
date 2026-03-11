#!/bin/bash

# Set boot animation
plymouth-set-default-theme spinner

# Nuke Fedora Silverblue defaults
echo "Nuking default GNOME wallpapers..."
rm -f /usr/share/backgrounds/f40/default/f40-01-day.png
rm -f /usr/share/backgrounds/f40/default/f40-01-night.png
rm -f /usr/share/backgrounds/default.png
rm -f /usr/share/backgrounds/default-dark.png

# Nuke Fedora GDM Logo
echo "Replacing Fedora GDM Login Logo..."
rm -f /usr/share/pixmaps/fedora-gdm-logo.png

# Set Cloche GDM Logo (Using your SVG)
ln -sf /usr/share/icons/breeze/places/cloche-symbolic-current.svg /usr/share/pixmaps/system-logo-white.png
#it appears gnome supports svg files, be sure to look into it later on.

# Set Cloche global symlinks
echo "Setting Cloche symlinks..."
ln -sf /usr/share/backgrounds/towers-light.png /usr/share/backgrounds/default.png
ln -sf /usr/share/backgrounds/towers-dark.png /usr/share/backgrounds/default-dark.png
