#!/bin/bash

# Define target directories in the repository
XDG_DIR="files/system/etc/xdg"
SKEL_DIR="files/system/etc/skel"

# 1. Create directory structures
echo "📁 Creating folders if they do not exist..."
mkdir -p $XDG_DIR
mkdir -p $SKEL_DIR/.local/share/konsole/
mkdir -p $SKEL_DIR/.local/share/kxmlgui5/konsole/

# 2. Copy Plasma setup to XDG (Global Defaults)
echo "🖼️ Copying Plasma global setup to XDG..."
cp -fv $HOME/.config/plasma-org.kde.plasma.desktop-appletsrc $XDG_DIR/
cp -fv $HOME/.config/kdeglobals $XDG_DIR/
cp -fv $HOME/.config/kwinrc $XDG_DIR/
cp -fv $HOME/.config/kscreenlockerrc $XDG_DIR/
cp -fv $HOME/.config/kglobalshortcutsrc $XDG_DIR/

# 3. Copy Konsole defaults (Mix of XDG and Skel)
echo "⌨️ Copying Konsole defaults..."
# The main config goes to XDG
cp -fv $HOME/.config/konsolerc $XDG_DIR/

# Profiles and UI layouts go to Skel (App Data)
cp -fv $HOME/.local/share/konsole/*.profile $SKEL_DIR/.local/share/konsole/
cp -fv $HOME/.local/share/kxmlgui5/konsole/sessionui.rc $SKEL_DIR/.local/share/kxmlgui5/konsole/
cp -fv $HOME/.local/share/kxmlgui5/konsole/konsoleui.rc $SKEL_DIR/.local/share/kxmlgui5/konsole/

echo "---------------------------------------------------"

# 4. Be mindful of absolute paths (Wallpaper and Icons)
echo "🔍 Verifying local paths on appletsrc..."
if grep -q "file://$HOME" $XDG_DIR/plasma-org.kde.plasma.desktop-appletsrc; then
    echo "⚠️ WARNING: The panel/wallpaper layout file contains absolute local paths!"
    echo "Please open the file below and replace your local home path with the global Cloche path:"
    echo "📄 File: $XDG_DIR/plasma-org.kde.plasma.desktop-appletsrc"
    echo "🔄 Change to: file:///usr/share/backgrounds/cloche-light.png (or your chosen path)"
else
    echo "✅ No '/home' paths found. All clean!"
fi

echo "---------------------------------------------------"
echo "🚀 Capture complete."
