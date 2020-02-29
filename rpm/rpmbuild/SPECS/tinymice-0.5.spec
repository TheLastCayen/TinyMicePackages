Name: TinyMice
Version: 0.5
Release: 1
License: GPLv3
BuildRoot: /media/Public/packages/rpm/rpmbuild
Summary: Simple and Light Auto Clicker


%description
Simple and Light Auto Clicker developed with Lazarus and released under GPL V3 License.

%prep
mkdir -p $RPM_BUILD_ROOT/usr/local/share/
mkdir -p $RPM_BUILD_ROOT/usr/local/share/icons/hicolor/128x128/apps
mkdir -p $RPM_BUILD_ROOT/usr/local/share/applications

cp -R /media/Public/packages/tar/tinymice/usr/share/tinymice $RPM_BUILD_ROOT/usr/local/share/
cp /media/Public/packages/tar/tinymice/usr/share/icons/hicolor/128x128/apps/tinymice.png $RPM_BUILD_ROOT/usr/local/share/icons/hicolor/128x128/apps/tinymice.png
cp /media/Public/packages/tar/tinymice/usr/share/applications/TinyMouse.desktop $RPM_BUILD_ROOT/usr/share/applications/TinyMouse.desktop 

exit

%files
%attr(0744, root, root) /usr/local/bin/*
%attr(0644, root, root) /usr/local/share/utils/*

%build

%install


%changelog
