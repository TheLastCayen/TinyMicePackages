#!/bin/bash

# Message
echo "Thank you for using TinyMice"
echo "Please make sure libsqlite3 development package is installed before running tinymice"

# Install software
mkdir -p /usr/share/tinymice
cp -R usr/share/tinymice  /usr/share/tinymice
chown -R root:root /usr/share/tinymice
chmod -R 644 /usr/share/tinymice/languages/*
chmod 755 /usr/share/tinymice/tinymice

# Install hicolor icon
mkdir -p /usr/share/icons/hicolor/128x128/apps
cp  usr/share/icons/hicolor/128x128/apps/tinymice.png /usr/share/icons/hicolor/128x128/apps/tinymice.png
chown root:root /usr/share/icons/hicolor/128x128/apps/tinymice.png
chmod 644 /usr/share/icons/hicolor/128x128/apps/tinymice.png

# Create symbolic lync
ln -s /usr/share/icons/hicolor/128x128/apps/tinymice.png /usr/share/pixmaps/inymice.png 
ln -s /usr/share/tinymice/tinymice /usr/bin/tinymice
chown root:root /usr/share/pixmaps/inymice.png
chown root:root /usr/bin/tinymice 

# Install Launcher
mkdir -p usr/share/applications
cp usr/share/applications/TinyMouse.desktop /usr/share/applications/TinyMouse.desktop
chown root:root /usr/share/applications/TinyMouse.desktop
chmod 755 /usr/share/applications/TinyMouse.desktop

