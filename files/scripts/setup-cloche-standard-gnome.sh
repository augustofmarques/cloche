#!/bin/bash

# Set boot animation
plymouth-set-default-theme spinner

# Nuke Fedora Silverblue defaults
echo "Nuking default GNOME wallpapers..."
rm -f /usr/share/backgrounds/f40/default/f40-01-day.png
rm -f /usr/share/backgrounds/f40/default/f40-01-night.png
rm -f /usr/share/backgrounds/default.png
rm -f /usr/share/backgrounds/default-dark.png

# Set Cloche global symlinks for Wallpapers
echo "Setting Cloche Wallpaper symlinks..."
ln -sf /usr/share/backgrounds/towers-light.png /usr/share/backgrounds/default.png
ln -sf /usr/share/backgrounds/towers-dark.png /usr/share/backgrounds/default-dark.png

# Nuke and Replace Fedora GDM/System Logos with Plymouth Watermark
echo "Replacing Fedora GDM and System Logos..."
rm -f /usr/share/pixmaps/fedora-gdm-logo.png
rm -f /usr/share/pixmaps/system-logo-white.png

ln -sf /usr/share/plymouth/themes/spinner/watermark.png /usr/share/pixmaps/fedora-gdm-logo.png
ln -sf /usr/share/plymouth/themes/spinner/watermark.png /usr/share/pixmaps/system-logo-white.png

# Nuke Fedora GDM and System Logos
echo "Replacing Fedora GDM and System Logos..."
rm -f /usr/share/pixmaps/fedora-gdm-logo.png
rm -f /usr/share/pixmaps/system-logo-white.png

ln -sf /usr/share/plymouth/themes/spinner/watermark.png /usr/share/pixmaps/fedora-gdm-logo.png
ln -sf /usr/share/plymouth/themes/spinner/watermark.png /usr/share/pixmaps/system-logo-white.png

# --- 1. THE "ABOUT" LOGO FIX ---
echo "Registering Cloche logo for GNOME Control Center..."
# Create the standard hicolor icon directory
mkdir -p /usr/share/icons/hicolor/256x256/apps/
# Copy the Plymouth watermark as the official system logo
cp -f /usr/share/plymouth/themes/spinner/watermark.png /usr/share/icons/hicolor/256x256/apps/cloche-logo.png
cp -f /usr/share/plymouth/themes/spinner/watermark.png /usr/share/pixmaps/cloche-logo.png
# Refresh the icon cache so GNOME finds it instantly
gtk-update-icon-cache /usr/share/icons/hicolor || true

# --- 2. THE GDM ACCENT COLOR FIX (Bazzite Exorcism) ---
echo "Neutralizing Bazzite GDM accent colors..."
# Nuke any Bazzite specific GDM overrides
rm -f /etc/dconf/db/gdm.d/*bazzite*

# Create a clean Cloche override for the login screen
mkdir -p /etc/dconf/db/gdm.d
cat << 'EOF' > /etc/dconf/db/gdm.d/99-cloche-gdm
[org/gnome/desktop/interface]
color-scheme='prefer-dark'
accent-color='blue'
EOF

echo "Nuking upstream skel dconf (The Skel Trap)..."
rm -rf /etc/skel/.config/dconf

# Compile the GNOME global database from our captured files
echo "Compiling GNOME dconf database..."
dconf update
