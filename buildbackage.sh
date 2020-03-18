# Build tar.gz#!/bin/bash
SV="0.6" 		# Software Version
PV="1"			# Package Version
SOURCE="../tinymice"	# TinyMice Source Location

#Install dependency
install_dependency () {
	sudo apt-get install upx gnupg pbuilder ubuntu-dev-tools apt-file build-essential dpkg rpm wixl msitools
# ? devscripts
# ? debhelper
}

#compile
compile_software () {
	rm $SOURCE/bin/tinymice
	lazbuild $SOURCE/ptinymice.lpi
	upx --best $SOURCE/bin/tinymice
}

# Build tar.gz
create_tar_gz () {
	rm -f ./bin/tinymice_$SV-$PV.tar.gz
	rm -Rf ./tar/tinymice_$SV-$PV

	mkdir -p ./tar/tinymice_$SV-$PV/
	cp ../tinymice/* ./tar/tinymice_$SV-$PV/ -R
	rm -f ./tar/tinymice_$SV-$PV/bin/*
	cd ./tar
	tar -zcvf ../bin/tinymice_$SV-$PV.tar.gz ./tinymice_$SV-$PV 
	cd ..
}

# Buid Debian
create_deb () {
	rm -f  ./bin/tinymice_$SV-$PV.deb
	rm -Rf ./deb/tinymice_$SV-$PV

	mkdir -p ./deb/tinymice_$SV-$PV/usr/share/tinymice/languages
	mkdir -p ./deb/tinymice_$SV-$PV/usr/share/icons/hicolor/128x128/apps
	mkdir -p ./deb/tinymice_$SV-$PV/DEBIAN
	mkdir -p ./deb/tinymice_$SV-$PV/usr/share/doc/tinymice

	cp ./deb/resources/DEBIAN/* ./deb/tinymice_$SV-$PV/DEBIAN/
	sed -i -e 's/_SVersion/'$SV'/g' -e 's/_PVersion/'$PV'/g'     ./deb/tinymice_$SV-$PV/DEBIAN/control

	cp $SOURCE/bin/tinymice 		./deb/tinymice_$SV-$PV/usr/share/tinymice
	cp $SOURCE/copyright 			./deb/tinymice_$SV-$PV/usr/share/doc/tinymice/
	cp $SOURCE/languages/* 			./deb/tinymice_$SV-$PV/usr/share/tinymice/languages/ -R
	cp $SOURCE/pictures/tinymice.png 	./deb/tinymice_$SV-$PV/usr/share/icons/hicolor/128x128/apps/tinymice.png

	echo "tinymice ($PV) experimental; urgency=low"			>./deb/tinymice_$SV-$PV/usr/share/doc/tinymice/changelog.Debian
	echo ""								>>./deb/tinymice_$SV-$PV/usr/share/doc/tinymice/changelog.Debian
	echo "  * Initial release."					>>./deb/tinymice_$SV-$PV/usr/share/doc/tinymice/changelog.Debian
	echo ""								>>./deb/tinymice_$SV-$PV/usr/share/doc/tinymice/changelog.Debian
	echo ""								>>./deb/tinymice_$SV-$PV/usr/share/doc/tinymice/changelog.Debian
	echo ""								>>./deb/tinymice_$SV-$PV/usr/share/doc/tinymice/changelog.Debian
	echo ""								>>./deb/tinymice_$SV-$PV/usr/share/doc/tinymice/changelog.Debian
	echo " -- Daniel Babin <tinymice.github@gmail.com>  $(date -R)"	>>./deb/tinymice_$SV-$PV/usr/share/doc/tinymice/changelog.Debian
	gzip -n9 ./deb/tinymice_$SV-$PV/usr/share/doc/tinymice/changelog.Debian

	chmod -Rf 0755 ./deb/tinymice_$SV-$PV
	chmod 0755 ./deb/tinymice_$SV-$PV/DEBIAN/* 
	chmod 0644 ./deb/tinymice_$SV-$PV/usr/share/tinymice/languages/*
	chmod 0755 ./deb/tinymice_$SV-$PV/usr/share/tinymice/tinymice
	chmod 0644 ./deb/tinymice_$SV-$PV/usr/share/doc/tinymice/*
	chmod 0644 ./deb/tinymice_$SV-$PV/usr/share/icons/hicolor/128x128/apps/*

	dpkg-deb --root-owner-group --build ./deb/tinymice_$SV-$PV ./bin/tinymice_$SV-$PV.deb
}

# Build rpm
create_rpm () {
	rm -f ./bin/tinymice-$SV-$PV.x86_64.rpm
	rm -Rf ./rpm/tinymice_$SV-$PV

	mkdir -p ./rpm/tinymice_$SV-$PV/SOURCES/usr/share/tinymice/languages
	mkdir -p ./rpm/tinymice_$SV-$PV/SOURCES/usr/share/icons/hicolor/128x128/apps
	mkdir -p ./rpm/tinymice_$SV-$PV/SPECS

	sed -e 's/_SVersion/'$SV'/g'        ./rpm/resources/tinymice.spec > ./rpm/tinymice_$SV-$PV/SPECS/tinymice-$SV.spec
	sed -i -e 's/_PVersion/'$PV'/g'     ./rpm/tinymice_$SV-$PV/SPECS/tinymice-$SV.spec 

	cp $SOURCE/bin/tinymice 		./rpm/tinymice_$SV-$PV/SOURCES/usr/share/tinymice/
	cp $SOURCE/languages/* 			./rpm/tinymice_$SV-$PV/SOURCES/usr/share/tinymice/languages/ 
	cp $SOURCE/pictures/tinymice.png 	./rpm/tinymice_$SV-$PV/SOURCES/usr/share/icons/hicolor/128x128/apps/tinymice.png

	chmod -Rf 0755 ./rpm/tinymice_$SV-$PV
	chmod 0755 ./rpm/tinymice_$SV-$PV/SPECS/tinymice-$SV.spec
	chmod 0644 ./rpm/tinymice_$SV-$PV/SPECS/usr/share/tinymice/languages/*
	chmod 0755 ./rpm/tinymice_$SV-$PV/SPECS/usr/share/tinymice/tinymice
	chmod 0644 ./rpm/tinymice_$SV-$PV/SPECS/usr/share/doc/tinymice/*

	rpmbuild --define "_topdir `pwd`/rpm/tinymice_$SV-$PV/" -bb ./rpm/tinymice_$SV-$PV/SPECS/tinymice-$SV.spec

	mv ./rpm/tinymice_$SV-$PV/RPMS/x86_64/*.rpm ./bin/
	rm -Rf ./rpm/tinymice_$SV-$PV/BUILDROOT

}

# Clean SOURCES
clean_sources () {
	rm -Rf $SOURCE/lib
	rm -Rf $SOURCE/libs/Cross.Codebot-master/source/lib
	rm -Rf $SOURCE/libs/mouseandkeyinput/lib
	rm -f  $SOURCE/bin/*
}

clear
install_dependency
#clean_sources
#compile_software
#create_tar_gz
#create_deb
#create_rpm
#clean_sources
