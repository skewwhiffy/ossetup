#!/usr/bin/env bash
while ! ping -c 1 -W 1 google.com; do
  echo No response from google. Trying again.
  sleep 1
done

echo Network is up
exit 0
if [ -d /media/Docs ]; then
  echo DOCS drive already mounted
else
  echo Mounting DOCS drive
  echo "LABEL=DOCS /media/Docs ext4 rw,relatime 0 1" | sudo tee -a /etc/fstab
  sudo mkdir -p /media/Docs
  sudo mount -L DOCS /media/Docs
  cp -r /media/Docs/backup/.ssh $HOME
  cp -r /media/Docs/backup/.aws $HOME
fi

echo Checking out ossetup repo
mkdir -p $HOME/code/personal
cd $HOME/code/personal
git clone git@github.com:skewwhiffy/ossetup.git
cp /ossetup/artix/config ossetup/artix
sudo rm -rf /ossetup
cd ossetup/artix

echo Installing vital
./add.vital.sh

