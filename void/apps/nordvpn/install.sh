#!/bin/sh
echo Getting latest version of nordvpn
fileName=$(curl https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/ | grep amd64 | grep deb | sort -r | head -n 1 | grep -oP ">.*<" | sed "s/>//" | sed "s/<//")
url=https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/$fileName

echo Downloading latest version of nordvpn
rm -f nordvpn.deb
wget -O nordvpn.deb $url

echo Installing bsdtar
sudo xbps-install -Sy bsdtar

echo Extracting package
rm -rf workspace
mkdir ./workspace
bsdtar -O -xf *.deb data.tar.xz | bsdtar -C ./workspace -xJf -

echo Installing nordvpn. I might need your password.
sudo cp -rp ./workspace/var/* /var
sudo cp -rp ./workspace/usr/bin/* /usr/local/bin
sudo cp -rp ./workspace/usr/sbin/* /usr/local/bin/

echo Done.
echo To run as a daemon: sudo nordvpnd
echo nordvpn should be installed.
