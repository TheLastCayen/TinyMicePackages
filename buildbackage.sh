#!/bin/bash
SV="0.5" 	# Software Version
PV="1"		# Package Version
# Build tar.gz
rm -f ./bin/tinymice_$SV-$PV.tar.gz
tar -czvf ./bin/tinymice_$SV-$PV.tar.gz -C ./tar/tinymice/ . 

# Buid Debian
rm -f tinymice_$SV-$PV.deb
dpkg-deb --root-owner-group --build ./deb/tinymice_$SV-$PV ./bin/tinymice_$SV-$PV.deb
