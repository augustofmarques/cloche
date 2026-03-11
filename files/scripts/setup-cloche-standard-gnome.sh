#!/bin/bash

# Set boot animation
#plymouth-set-default-theme spinner

# Nuke Fedora Silverblue defaults
#echo "Nuking default GNOME wallpapers..."
#rm -f /usr/share/backgrounds/f40/default/f40-01-day.png
#rm -f /usr/share/backgrounds/f40/default/f40-01-night.png
#rm -f /usr/share/backgrounds/default.png
#rm -f /usr/share/backgrounds/default-dark.png

# Nuke Fedora GDM Logo
#echo "Replacing Fedora GDM Login Logo..."
#rm -f /usr/share/pixmaps/fedora-gdm-logo.png

# Set Cloche GDM Logo (Using your SVG)
#ln -sf /usr/share/icons/breeze/places/cloche-symbolic-current.svg /usr/share/pixmaps/system-logo-white.png
#it appears gnome supports svg files, be sure to look into it later on.

# Nuke Fedora GDM Logo
#echo "Replacing Fedora GDM Login Logo..."
#rm -f /usr/share/pixmaps/fedora-gdm-logo.png
#rm -f /usr/share/pixmaps/system-logo-white.png

# Set Cloche GDM & System Logos (Using your PNG)
#ln -sf /usr/share/pixmaps/cloche-logo.png /usr/share/pixmaps/fedora-gdm-logo.png
#ln -sf /usr/share/pixmaps/cloche-logo.png /usr/share/pixmaps/system-logo-white.png

# Set Cloche global symlinks
#echo "Setting Cloche symlinks..."
#ln -sf /usr/share/backgrounds/towers-light.png /usr/share/backgrounds/default.png
#ln -sf /usr/share/backgrounds/towers-dark.png /usr/share/backgrounds/default-dark.png
# Compile the GNOME global database from our captured files
#echo "Compiling GNOME dconf database..."
#dconf update

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

echo "Nuking upstream skel dconf (The Skel Trap)..."
rm -rf /etc/skel/.config/dconf

# Compile the GNOME global database from our captured files
echo "Compiling GNOME dconf database..."
dconf update
