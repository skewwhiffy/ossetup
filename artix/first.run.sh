#!/usr/bin/env bash
echo Enabling network
sudo ln -s /etc/runit/sv/NetworkManager /run/runit/service

echo Mounting DOCS drive
echo "LABEL=DOCS /media/Docs ext4 rw,relatime 0 1" | sudo tee -a /etc/fstab
sudo mkdir -p /media/Docs
sudo mount -L DOCS /media/Docs
cp -r /media/Docs/backup/.ssh $HOME
cp -r /media/Docs/backup/.aws $HOME

echo Checking out ossetup repo
mkdir -p $HOME/code/personal
cd $HOME/code/personal
git clone git@github.com:skewwhiffy/ossetup.git
cp /ossetup/artix/config ossetup/artix
sudo rm -rf /ossetup
cd ossetup/artix


echo Installing vital and common
./add.vital.sh && ./add.common.sh

