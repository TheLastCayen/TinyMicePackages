Name: tinymice
Version: _SVersion
Release: _PVersion
License: GPLv3
URL: https://github.com/TheLastCayen/tinymice
Packager: TheLastCayen <tinymice.github@gmail.com>
Requires: libsqlite3x-devel
BuildArch: x86_64

Summary: Simple and Light Auto Clicker

%description
Simple and Light Auto Clicker developed with Lazarus and released under GPL V3 License.

%prep
mkdir -p %{buildroot}/usr/share/
mkdir -p %{buildroot}/usr/share/icons/hicolor/128x128/apps
mkdir -p %{buildroot}/usr/share/applications

cp -R %{_sourcedir}/usr/share/tinymice %{buildroot}/usr/share/
cp %{_sourcedir}/usr/share/icons/hicolor/128x128/apps/tinymice.png %{buildroot}/usr/share/icons/hicolor/128x128/apps/tinymice.png

exit

%files
%attr(0644, root, root) %{_datadir}/tinymice/languages/*
%attr(0744, root, root) %{_datadir}/tinymice/tinymice
%attr(0644, root, root) %{_datadir}/icons/hicolor/128x128/apps/tinymice.png

%pre
rm -f %{_datadir}/applications/TinyMouse.desktop
rm -f %{_datadir}/pixmaps/tinymice.png
rm -f %{_bindir}/tinymice
rm -f %{_datadir}/icons/hicolor/128x128/apps/tinymice.png
rm -Rf %{_datadir}/tinymice

%post
chown -R root:root %{_datadir}/tinymice
chmod -R 644 %{_datadir}/tinymice/languages/*
chmod 755 %{_datadir}/tinymice/tinymice

chown root:root %{_datadir}/icons/hicolor/128x128/apps/tinymice.png
chmod 644 %{_datadir}/icons/hicolor/128x128/apps/tinymice.png

ln -s %{_datadir}/icons/hicolor/128x128/apps/tinymice.png %{_datadir}/pixmaps/tinymice.png
ln -s %{_datadir}/tinymice/tinymice %{_bindir}/tinymice
chown root:root %{_datadir}/pixmaps/tinymice.png
chown root:root %{_bindir}/tinymice

echo "[Desktop Entry]" 		>  %{_datadir}/applications/TinyMouse.desktop
echo "Name=TinyMice" 		>> %{_datadir}/applications/TinyMouse.desktop
echo "Comment=Auto Clicker" 	>> %{_datadir}/applications/TinyMouse.desktop
echo "Exec=tinymice" 		>> %{_datadir}/applications/TinyMouse.desktop
echo "Icon=tinymice" 		>> %{_datadir}/applications/TinyMouse.desktop
echo "Terminal=false" 		>> %{_datadir}/applications/TinyMouse.desktop
echo "Type=Application" 	>> %{_datadir}/applications/TinyMouse.desktop
echo "Categories=Utility;" 	>> %{_datadir}/applications/TinyMouse.desktop
echo "StartupNotify=true" 	>> %{_datadir}/applications/TinyMouse.desktop
echo "Keywords=Auto;Clicker;AutoClicker;Auto Clicker;Mouse;" >> %{_datadir}/applications/TinyMouse.desktop
chown root:root %{_datadir}/applications/TinyMouse.desktop
chmod 755 %{_datadir}/applications/TinyMouse.desktop

%postun
rm -f %{_datadir}/applications/TinyMouse.desktop
rm -f %{_datadir}/pixmaps/tinymice.png
rm -f %{_bindir}/tinymice
rm -f %{_datadir}/icons/hicolor/128x128/apps/tinymice.png
rm -Rf %{_datadir}/tinymice

%clean

%build

%changelog

