#!/bin/sh
echo Getting latest version of nordvpn
fileName=$(curl https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/ | grep amd64 | grep deb | sort -r | head -n 1 | grep -oP ">.*<" | sed "s/>//" | sed "s/<//")
url=https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/$fileName

echo Downloading latest version of nordvpn
rm -f nordvpn.deb
wget -O nordvpn.deb $url

echo Extracting package
rm -rf workspace
mkdir ./workspace
bsdtar -O -xf *.deb data.tar.xz | bsdtar -C ./workspace -xJf -

echo Installing nordvpn. I might need your password.
sudo cp -r ./workspace/var/* /var
sudo cp -r ./workspace/usr/bin /usr/bin
sudo cp -r ./workspace/usr/sbin/* /usr/sbin/
sudo cp -r ./workspace/usr/lib /usr/sbin
sudo chmod 0755 /usr/bin/nordvpn

echo Done.
echo To run as a daemon: sudo nordvpnd
echo nordvpn should be installed.
