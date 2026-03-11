#!/bin/bash

# Target directories for GNOME overrides
GNOME_DIR="files/gnome/etc/dconf"
LOCAL_DB="$GNOME_DIR/db/local.d"
PROFILE_DIR="$GNOME_DIR/profile"
SKEL_DIR="files/gnome/etc/skel"

echo "📁 Creating GNOME folder structures..."
mkdir -p $LOCAL_DB
mkdir -p $PROFILE_DIR

# 1. Create the dconf profile
# This tells GNOME: "Read the user settings first, but if empty, read the 'local' Cloche database"
echo "📝 Setting up dconf profile..."
echo -e "user-db:user\nsystem-db:local" > $PROFILE_DIR/user

# 2. Dump the GNOME database
# We capture everything under /org/gnome/ (Extensions, WM, Mutter, Interface, Favorites)
echo "⚙️ Capturing GNOME settings (dconf dump)..."
dconf dump /org/gnome/ > $LOCAL_DB/00-cloche-gnome

# 3. The "New Document" Trick (Templates)
echo "📄 Setting up 'New Document' templates..."
mkdir -p "$SKEL_DIR/Modelos"
mkdir -p "$SKEL_DIR/Templates"
touch "$SKEL_DIR/Templates/New Document.txt"
touch "$SKEL_DIR/Modelos/Novo Documento.txt" # Creates both EN and PT-BR fallback

echo "---------------------------------------------------"
echo "✅ GNOME settings captured successfully!"
echo "📄 File generated at: $LOCAL_DB/00-cloche-gnome"
echo "🚀 Review the file and run git add/commit/push."
