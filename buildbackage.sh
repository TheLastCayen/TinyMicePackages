# Build tar.gz#!/bin/bash
SV="0.5" 	# Software Version
PV="1"		# Package Version

#Install dependency
#sudo apt-get install build-essential dpkg rpm
 
#compile
rm ../tinymice/bin/tinymice

lazbuild ../tinymice/ptinymice.lpi
upx --best ../tinymice/bin/tinymice

rm -Rf ../tinymice/lib
rm -Rf ../tinymice/libs/Cross.Codebot-master/source/lib
rm -Rf ../tinymice/libs/mouseandkeyinput/lib


# Build tar.gz
rm -f ./bin/tinymice_$SV-$PV.tar.gz
rm -f ./tar/tinymice_$SV-$PV

mkdir -p ./tar/tinymice_$SV-$PV/usr/share/tinymice/languages
mkdir -p ./tar/tinymice_$SV-$PV/usr/share/icons/hicolor/128x128/apps
mkdir -p ./tar/tinymice_$SV-$PV/usr/share/applications

mv ../tinymice/bin/tinymice ./tar/tinymice_$SV-$PV/usr/share/tinymice/tinymice
cp ../tinymice/languages/* ./tar/tinymice_$SV-$PV/usr/share/tinymice/languages/ -R
cp ../tinymice/pictures/tinymice.png ./tar/tinymice_$SV-$PV/usr/share/icons/hicolor/128x128/apps/tinymice.png

cp ./tar/resources/TinyMouse.desktop ./tar/tinymice_$SV-$PV/usr/share/applications/TinyMouse.desktop
cp ./tar/resources/install.sh ./tar/tinymice_$SV-$PV/install.sh
cp ./tar/resources/uninstall.sh ./tar/tinymice_$SV-$PV/uninstall.sh

tar -czvf ./bin/tinymice_$SV-$PV.tar.gz -C ./tar/tinymice_$SV-$PV/ .


# Buid Debian
rm -f ./bin/tinymice_$SV-$PV.deb
rm -f ./deb/tinymice_$SV-$PV

mkdir -p ./deb/tinymice_$SV-$PV/usr/share/tinymice/languages
mkdir -p ./deb/tinymice_$SV-$PV/usr/share/icons/hicolor/128x128/apps
mkdir -p ./deb/tinymice_$SV-$PV/usr/share/applications
mkdir -p ./deb/tinymice_$SV-$PV/usr/share/pixmaps/
mkdir -p ./deb/tinymice_$SV-$PV/usr/bin/

cp ./tar/tinymice_$SV-$PV/usr/share/tinymice/tinymice ./deb/tinymice_$SV-$PV/usr/share/tinymice/tinymice
cp ./tar/tinymice_$SV-$PV/usr/share/tinymice/languages/* ./deb/tinymice_$SV-$PV/usr/share/tinymice/languages/ -R
cp ./tar/tinymice_$SV-$PV/usr/share/icons/hicolor/128x128/apps/tinymice.png ./deb/tinymice_$SV-$PV/usr/share/icons/hicolor/128x128/apps/tinymice.png
cp ./tar/tinymice_$SV-$PV/usr/share/applications/TinyMouse.desktop ./deb/tinymice_$SV-$PV/usr/share/applications/TinyMouse.desktop

ln -s /usr/share/icons/hicolor/128x128/apps/tinymice.png ./deb/tinymice_$SV-$PV/usr/share/pixmaps/tinymice.png
ln -s /usr/share/tinymice/tinymice ./deb/tinymice_$SV-$PV/usr/bin/tinymice

dpkg-deb --root-owner-group --build ./deb/tinymice_$SV-$PV ./bin/tinymice_$SV-$PV.deb

# Build rpm
rm -f ./bin/tinymice-$SV-$PV.x86_64.rpm
rm -f ./rpm/tinymice_$SV-$PV

mkdir -p ./rpm/tinymice_$SV-$PV/SOURCES/usr/share/tinymice/languages
mkdir -p ./rpm/tinymice_$SV-$PV/SOURCES/usr/share/icons/hicolor/128x128/apps
mkdir -p ./rpm/tinymice_$SV-$PV/SOURCES/usr/share/applications
mkdir -p ./rpm/tinymice_$SV-$PV/SOURCES/usr/share/pixmaps
mkdir -p ./rpm/tinymice_$SV-$PV/SOURCES/usr/bin
mkdir -p ./rpm/tinymice_$SV-$PV/SPECS

cp ./rpm/resources/tinymice.spec ./rpm/tinymice_$SV-$PV/SPECS/tinymice-$SV.spec
cp ./tar/tinymice_$SV-$PV/usr/share/tinymice/tinymice ./rpm/tinymice_$SV-$PV/SOURCES/usr/share/tinymice/tinymice
cp ./tar/tinymice_$SV-$PV/usr/share/tinymice/languages/* ./rpm/tinymice_$SV-$PV/SOURCES/usr/share/tinymice/languages/ -R
cp ./tar/tinymice_$SV-$PV/usr/share/icons/hicolor/128x128/apps/tinymice.png ./rpm/tinymice_$SV-$PV/SOURCES/usr/share/icons/hicolor/128x128/apps/tinymice.png
cp ./tar/tinymice_$SV-$PV/usr/share/applications/TinyMouse.desktop ./rpm/tinymice_$SV-$PV/SOURCES/usr/share/applications/TinyMouse.desktop


rpmbuild --define "_topdir `pwd`/rpm/tinymice_$SV-$PV/" -bb ./rpm/tinymice_$SV-$PV/SPECS/tinymice-$SV.spec
mv ./rpm/tinymice_$SV-$PV/RPMS/x86_64/*.rpm ./bin/
rm -Rf ./rpm/tinymice_$SV-$PV/BUILDROOT
