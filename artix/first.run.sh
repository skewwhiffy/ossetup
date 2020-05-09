#!/usr/bin/env bash
echo Mounting DOCS drive
sudo echo "LABEL=DOCS /media/Docs ext4 rw,relatime 0 1" >> /etc/fstab
sudo mkdir -p /media/Docs
sudo mount -L DOCS /media/Docs
cp -r /media/Docs/backup/.ssh $HOME
cp -r /media/Docs/backup/.aws $HOME

echo Checking out ossetup repo
mkdir -r $HOME/code/personal
cd $HOME/code/personal
git clone git@github.com:skewwhiffy/ossetup.git
cp /ossetup/artix/config ossetup/artix
sudo rm -rf /ossetup
cd ossetup/artix


echo Installing vital and common
./add.vital.sh && ./add.common.sh

