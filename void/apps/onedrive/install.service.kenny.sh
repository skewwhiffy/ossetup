#!/bin/sh
echo I might need a sudo password
sudo rm -f /var/service/onedrive
sudo rm -rf /etc/sv/onedrive
sudo mkdir /etc/sv/onedrive
sudo cp -r ./service/** /etc/sv/onedrive
sudo chmod 0755 -R /etc/sv/onedrive
sudo ln -s /etc/sv/onedrive /var/service
