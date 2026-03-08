#!/bin/bash

# Set boot animation
plymouth-set-default-theme spinner

# Nuke Fedora defaults
echo "Nuking default wallpapers..."
rm -f /usr/share/backgrounds/default.png
rm -f /usr/share/backgrounds/default-dark.png
rm -f /usr/share/backgrounds/default.jxl
rm -f /usr/share/backgrounds/default-dark.jxl

# Set Cloche global symlinks
echo "Setting Cloche symlinks..."
ln -sf /usr/share/backgrounds/towers-light.png /usr/share/backgrounds/default.png
ln -sf /usr/share/backgrounds/towers-dark.png /usr/share/backgrounds/default-dark.png
