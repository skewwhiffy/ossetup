#!/bin/sh
fileName=$(curl https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/ | grep amd64 | grep deb | sort -r | head -n 1 | grep -oP ">.*<" | sed "s/>//" | sed "s/<//")
url=https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/$fileName
rm -f nordvpn.deb
wget -O nordvpn.deb $url
rm -rf workspace
mkdir ./workspace
bsdtar -O -xf *.deb data.tar.xz | bsdtar -C ./workspace -xJf -
sudo cp -r ./workspace/var/* /var
sudo cp -r ./workspace/usr/* /usr
