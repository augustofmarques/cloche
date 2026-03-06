#!/bin/bash
plymouth-set-default-theme spinner
dracut -f --regenerate-all
ujust toggle-user-motd
rm -f /usr/share/backgrounds/convergence.png
rm -f /usr/share/backgrounds/default-dark.png
rm -f /usr/share/backgrounds/default.jxl
rm -f /usr/share/backgrounds/convergence.jxl
ln -sf /usr/share/backgrounds/towers-light.png /usr/share/backgrounds/default.png
ln -sf /usr/share/backgrounds/towers-dark.png /usr/share/backgrounds/default-dark.png
# attempts to remove some of bazzites touches
rm -f /etc/profile.d/bazzite-fetch.sh
rm -f /etc/profile.d/ublue-os-bazzite-fetch.sh
rm -f /etc/profile.d/bazzite-arch.sh
#
touch /etc/bazzite-no-banner
#attempting to touch up some fastfetch config
rm -f /etc/profile.d/bazzite-fetch.sh
rm -f /etc/profile.d/ublue-os-bazzite-fetch.sh
rm -f /usr/bin/bazzite-fetch
