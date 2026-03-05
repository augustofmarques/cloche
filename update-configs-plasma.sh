#!/bin/bash

#
SKEL_DIR="files/system/etc/skel"

# 1.
echo "📁 Creating folders if they do not exist."
mkdir -p $SKEL_DIR/.config/
mkdir -p $SKEL_DIR/.local/share/konsole/

# 2.
echo "🖼️ Copying Plasma setup"
cp -fv $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc $SKEL_DIR/.config/
cp -fv $HOME/.config/kdeglobals $SKEL_DIR/.config/
cp -fv $HOME/.config/kwinrc $SKEL_DIR/.config/
cp -fv $HOME/.config/kscreenlockerrc $SKEL_DIR/.config/
cp -fv $HOME/.config/kglobalshortcutsrc $SKEL_DIR/.config/

# 3. Konsole defaults
echo "⌨️ Copying Konsole defaults"
cp -fv $HOME/.config/konsolerc $SKEL_DIR/.config/
cp -fv $HOME/.local/share/konsole/*.profile $SKEL_DIR/.local/share/konsole/
# Captura o estado da Interface do Konsole (onde fica a config de esconder a Toolbar)
mkdir -p files/system/etc/skel/.local/share/kxmlgui5/konsole/
cp -fv $HOME/.local/share/kxmlgui5/konsole/sessionui.rc files/system/etc/skel/.local/share/kxmlgui5/konsole/
cp -fv $HOME/.local/share/kxmlgui5/konsole/konsoleui.rc files/system/etc/skel/.local/share/kxmlgui5/konsole/

echo "---------------------------------------------------"

# 4. Be mindfull of absolute paths (Wallpaper)
echo "🔍 Verifying local paths on appletsrc..."
if grep -q "file://$HOME" $SKEL_DIR/.config/plasma-org.kde.plasma.desktop-appletsrc; then
    echo "⚠️ AVISO IMPORTANTE: O arquivo de layout do painel/wallpaper está apontando para a sua pasta local!"
    echo "Abra o arquivo abaixo e substitua o caminho da sua imagem para o caminho global do Cloche:"
    echo "📄 Arquivo: $SKEL_DIR/.config/plasma-org.kde.plasma.desktop-appletsrc"
    echo "🔄 Mude para: file:///usr/share/wallpapers/Cloche/contents/images/light.png (ou dark.png)"
else
    echo "✅ Nenhum caminho '/home' encontrado. Tudo limpo!"
fi

echo "---------------------------------------------------"
echo "🚀 Captura concluída! Revise os arquivos e faça o git add/commit/push."
