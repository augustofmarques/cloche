#!/bin/bash

# Set boot animation
plymouth-set-default-theme spinner

# Nuke Fedora Silverblue defaults
echo "Nuking default GNOME wallpapers..."
rm -f /usr/share/backgrounds/f40/default/f40-01-day.png
rm -f /usr/share/backgrounds/f40/default/f40-01-night.png
rm -f /usr/share/backgrounds/default.png
rm -f /usr/share/backgrounds/default-dark.png

# Set Cloche global symlinks
echo "Setting Cloche symlinks..."
ln -sf /usr/share/backgrounds/towers-light.png /usr/share/backgrounds/default.png
ln -sf /usr/share/backgrounds/towers-dark.png /usr/share/backgrounds/default-dark.png
