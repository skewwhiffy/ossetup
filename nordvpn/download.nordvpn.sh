#!/bin/sh
fileName=$(curl https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/ | grep amd64 | grep deb | sort -r | head -n 1 | grep -oP ">.*<" | sed "s/>//" | sed "s/<//")
url=https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/$fileName
wget -O nordvpn.deb $url
