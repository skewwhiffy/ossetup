#!/usr/bin/env bash
source ./pre.flight.checks.sh

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

if [ "$distribution" == "artix" ]; then
  if [ -L /run/runit/service/NetworkManager ]; then
    echo NetworkManager already running
  else
    sudo ln -s /etc/runit/sv/NetworkManager /run/runit/service/
    while ! ping -c 1 -W 1 google.com; do
      echo No response from google. Trying again.
      sleep 1
    done
    echo Network is up
  fi
fi

if [ -d $HOME/code/personal/ossetup ]; then
  echo ossetup already checked out
else
  echo Checking out ossetup repo
  mkdir -p $HOME/code/personal
  cd $HOME/code/personal
  git clone git@github.com:skewwhiffy/ossetup.git
  cp /ossetup/arch/config ossetup/arch
  sudo rm -rf /ossetup
  cd ossetup/arch
fi

echo Installing vital
./add.vital.sh

echo Changing shell for root
sudo chsh $user -s /usr/bin/zsh
sudo chsh -s /usr/bin/zsh
