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
echo "📝 Setting up dconf profile..."
echo -e "user-db:user\nsystem-db:local" > $PROFILE_DIR/user

# 2. Dump the GNOME database
echo "⚙️ Capturing GNOME settings (dconf dump)..."
dconf dump /org/gnome/ > $LOCAL_DB/00-cloche-gnome

# --- A MÁGICA: Devolve o prefixo org/gnome para as chaves ---
sed -i 's/^\[/\[org\/gnome\//' $LOCAL_DB/00-cloche-gnome

# 3. Automagical Sanitization (Scrubbing /home/ and temporary data)
echo "🧼 Sanitizing personal data and fixing absolute paths..."

# Fix Wallpapers
sed -i "s|^picture-uri=.*|picture-uri='file:///usr/share/backgrounds/default.png'|g" $LOCAL_DB/00-cloche-gnome
sed -i "s|^picture-uri-dark=.*|picture-uri-dark='file:///usr/share/backgrounds/default-dark.png'|g" $LOCAL_DB/00-cloche-gnome

# Fix Dash to Panel Icon
sed -i "s|show-apps-icon-file=.*|show-apps-icon-file='/usr/share/icons/breeze/places/cloche-symbolic-current.svg'|g" $LOCAL_DB/00-cloche-gnome

# Delete temporary/tracking sections (now matching the org/gnome/ paths)
sed -i '/^\[org\/gnome\/control-center\]/,/^$/d' $LOCAL_DB/00-cloche-gnome
sed -i '/^\[org\/gnome\/gnome-system-monitor/,/^$/d' $LOCAL_DB/00-cloche-gnome
sed -i '/^\[org\/gnome\/nautilus\/window-state\]/,/^$/d' $LOCAL_DB/00-cloche-gnome
sed -i '/^\[org\/gnome\/nautilus\/icon-view\]/,/^$/d' $LOCAL_DB/00-cloche-gnome
sed -i '/^\[org\/gnome\/portal\/filechooser/,/^$/d' $LOCAL_DB/00-cloche-gnome
sed -i '/^\[org\/gnome\/settings-daemon\/plugins\/housekeeping\]/,/^$/d' $LOCAL_DB/00-cloche-gnome
sed -i '/^\[org\/gnome\/software\]/,/^$/d' $LOCAL_DB/00-cloche-gnome

# 4. The "New Document" Trick (Templates)
echo "📄 Setting up 'New Document' templates..."
mkdir -p "$SKEL_DIR/Modelos"
mkdir -p "$SKEL_DIR/Templates"
touch "$SKEL_DIR/Templates/New Document.txt"
touch "$SKEL_DIR/Modelos/Novo Documento.txt"

echo "---------------------------------------------------"
echo "✅ GNOME settings captured and sanitized successfully!"
echo "📄 File generated at: $LOCAL_DB/00-cloche-gnome"
echo "🚀 Review the file and run git add/commit/push."
