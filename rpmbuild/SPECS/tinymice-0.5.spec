Name: TinyMice
Version: 0.5
Release: 1
License: GPLv3
URL: https://github.com/TheLastCayen/tinymice
Packager: TheLastCayen <tinymice.github@gmail.com>
Requires: libsqlite3x-devel
BuildArch: x86_64
BuildRoot: /media/Public/git/tinymicepackages/rpmbuild

Summary: Simple and Light Auto Clicker


%description
Simple and Light Auto Clicker developed with Lazarus and released under GPL V3 License.

%prep
TARDIR="/media/Public/git/tinymicepackages/tar"

echo "TARDIR: = $TARDIR" 
echo "BUILDROOT = %{buildroot}"

mkdir -p %{buildroot}/usr/share/
mkdir -p %{buildroot}/usr/share/icons/hicolor/128x128/apps
mkdir -p %{buildroot}/usr/share/applications

cp -R $TARDIR/tinymice/usr/share/tinymice %{buildroot}/usr/share/
cp $TARDIR/tinymice/usr/share/icons/hicolor/128x128/apps/tinymice.png %{buildroot}/usr/share/icons/hicolor/128x128/apps/tinymice.png
cp $TARDIR/tinymice/usr/share/applications/TinyMouse.desktop %{buildroot}/usr/share/applications/TinyMouse.desktop 



exit

%files
%attr(0644, root, root) /usr/share/tinymice/languages/*
%attr(0744, root, root) /usr/share/tinymice/tinymice
%attr(0644, root, root) /usr/share/icons/hicolor/128x128/apps/tinymice.png
%attr(0755, root, root) /usr/share/applications/TinyMouse.desktop

%pre

%post
chown -R root:root /usr/share/tinymice
chmod -R 644 /usr/share/tinymice/languages/*
chmod 755 /usr/share/tinymice/tinymice

chown root:root /usr/share/icons/hicolor/128x128/apps/tinymice.png
chmod 644 /usr/share/icons/hicolor/128x128/apps/tinymice.png

ln -s /usr/share/icons/hicolor/128x128/apps/tinymice.png /usr/share/pixmaps/tinymice.png
ln -s /usr/share/tinymice/tinymice /usr/bin/tinymice
chown root:root /usr/share/pixmaps/inymice.png
chown root:root /usr/bin/tinymice 

chown root:root /usr/share/applications/TinyMouse.desktop
chmod 755 /usr/share/applications/TinyMouse.desktop

%postun
rm -f /usr/share/applications/TinyMouse.desktop
rm -f /usr/share/pixmaps/tinymice.png
rm -f /usr/bin/tinymice
rm -f /usr/share/icons/hicolor/128x128/apps/tinymice.png
rm -Rf /usr/share/tinymice

%clean

%build

%changelog

