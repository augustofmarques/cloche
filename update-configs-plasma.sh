#!/bin/bash

# Target directories
SKEL_DIR="files/kde/etc/skel"

echo "📁 Creating folders..."
mkdir -p $SKEL_DIR/.config/
mkdir -p $SKEL_DIR/.local/share/konsole/
mkdir -p $SKEL_DIR/.local/share/kxmlgui6/konsole/

echo "🖼️ Copying Plasma global setup to Skel..."
cp -fv $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc $SKEL_DIR/.config/
cp -fv $HOME/.config/kdeglobals $SKEL_DIR/.config/
cp -fv $HOME/.config/kwinrc $SKEL_DIR/.config/
cp -fv $HOME/.config/kscreenlockerrc $SKEL_DIR/.config/
cp -fv $HOME/.config/kglobalshortcutsrc $SKEL_DIR/.config/

echo "⌨️ Copying Konsole defaults..."
cp -fv $HOME/.config/konsolerc $SKEL_DIR/.config/
cp -fv $HOME/.local/share/konsole/*.profile $SKEL_DIR/.local/share/konsole/
cp -fv $HOME/.local/share/kxmlgui6/konsole/sessionui.rc $SKEL_DIR/.local/share/kxmlgui6/konsole/ 2>/dev/null || true
cp -fv $HOME/.local/share/kxmlgui6/konsole/konsoleui.rc $SKEL_DIR/.local/share/kxmlgui6/konsole/ 2>/dev/null || true

echo "---------------------------------------------------"
echo "🧼 Sanitizing absolute local paths in appletsrc..."

# This removes the local path prefix from the icon (still looks at 'files/common')
sed -i 's|/var/home/augusto/Documents/GitHub/gnx/files/common||g' $SKEL_DIR/.config/plasma-org.kde.plasma.desktop-appletsrc
sed -i 's|/home/augusto/Documents/GitHub/gnx/files/common||g' $SKEL_DIR/.config/plasma-org.kde.plasma.desktop-appletsrc

# This removes the local path prefix from the wallpaper (updated to look at 'files/kde')
sed -i 's|/var/home/augusto/Documents/GitHub/gnx/files/kde||g' $SKEL_DIR/.config/plasma-org.kde.plasma.desktop-appletsrc
sed -i 's|/home/augusto/Documents/GitHub/gnx/files/kde||g' $SKEL_DIR/.config/plasma-org.kde.plasma.desktop-appletsrc

# Verify if sanitization worked
if grep -q "home/augusto" $SKEL_DIR/.config/plasma-org.kde.plasma.desktop-appletsrc; then
    echo "⚠️ WARNING: Some local paths might still be present. Please check manually!"
else
    echo "✅ Absolute paths successfully replaced with global /usr/share paths!"
fi

echo "---------------------------------------------------"
echo "🚀 Capture complete! Review the files and run git add/commit/push."
