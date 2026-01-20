#!/bin/bash

# NUT-Kiosk-Browser Installer
echo "🚀 Starting installation of NUT-Kiosk-Browser..."

# 1. Check for Dependencies
echo "📦 Checking for Python dependencies..."
sudo apt update && sudo apt install -y python3-pyqt6 python3-pyqt6.qtwebengine

# 2. Define Paths
APP_DIR="$HOME/.local/share/nut-kiosk"
ICON_DIR="$HOME/.local/share/icons/hicolor/scalable/apps"
DESKTOP_DIR="$HOME/.local/share/applications"

# 3. Create Directories
mkdir -p "$APP_DIR"
mkdir -p "$ICON_DIR"
mkdir -p "$DESKTOP_DIR"

# 4. Copy Files
echo "📂 Moving files to local directories..."
cp ups-browser.py "$APP_DIR/"
cp ups-monitor.svg "$ICON_DIR/"

# 5. Generate .desktop file with absolute paths
echo "🖥️ Integrating with GNOME Desktop..."
cat <<EOF > "$DESKTOP_DIR/ups-monitor.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Name=UPS Status Monitor
Exec=python3 $APP_DIR/ups-browser.py
Icon=$ICON_DIR/ups-monitor.svg
Categories=System;Monitor;
StartupNotify=true
EOF

# 6. Update System Databases
echo "🔄 Refreshing system caches..."
chmod +x "$DESKTOP_DIR/ups-monitor.desktop"
gtk-update-icon-cache -f -t "$HOME/.local/share/icons/hicolor/"
update-desktop-database "$DESKTOP_DIR"

echo "✅ Installation complete! You can now find 'UPS Status Monitor' in your app drawer."
