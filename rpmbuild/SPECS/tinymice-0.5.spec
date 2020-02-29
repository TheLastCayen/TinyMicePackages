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
ln -s /usr/share/icons/hicolor/128x128/apps/tinymice.png /usr/share/pixmaps/tinymice.png
ln -s /usr/share/tinymice/tinymice /usr/bin/tinymice
chown root:root /usr/share/pixmaps/inymice.png
chown root:root /usr/bin/tinymice 

%postun
rm /usr/share/pixmaps/tinymice.png
rm /usr/bin/tinymice

%clean

%build

%changelog

