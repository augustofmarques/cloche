#!/bin/bash
# Script para atualizar os defaults do Plasma no Repositório

# 1. Garante que as pastas existem no repo
mkdir -p files/system/etc/skel/.config/

# 2. Copia suas configurações atuais (force overwrite)
echo "Copiando configurações do Plasma..."
cp -fv $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc files/system/etc/skel/.config/
cp -fv $HOME/.config/kdeglobals files/system/etc/skel/.config/
cp -fv $HOME/.config/kwinrc files/system/etc/skel/.config/
cp -fv $HOME/.config/kscreenlockerrc files/system/etc/skel/.config/

# 3. (Opcional) Copia atalhos de teclado personalizados
cp -fv $HOME/.config/kglobalshortcutsrc files/system/etc/skel/.config/

echo "Pronto! Agora faça o git add/commit/push."
