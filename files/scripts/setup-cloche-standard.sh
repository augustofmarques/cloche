#!/bin/bash
plymouth-set-default-theme spinner
#
rm -f /usr/share/backgrounds/default.png
rm -f /usr/share/backgrounds/default-dark.png
rm -f /usr/share/backgrounds/default.jxl
rm -f /usr/share/backgrounds/default-dark.jxl
#
ln -sf /usr/share/backgrounds/towers-light.png /usr/share/backgrounds/default.png
ln -sf /usr/share/backgrounds/towers-dark.png /usr/share/backgrounds/default-dark.png
