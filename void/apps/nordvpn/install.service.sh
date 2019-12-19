#!/bin/sh
echo I might need a sudo password
sudo rm -f /var/service/nordvpn
sudo rm -rf /etc/sv/nordvpn
sudo mkdir /etc/sv/nordvpn
sudo cp -rp ./service/** /etc/sv/nordvpn
sudo chmod 0755 -R /etc/sv/nordvpn
sudo ln -s /etc/sv/nordvpn /var/service
