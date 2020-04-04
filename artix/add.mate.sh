#!/usr/bin/env bash
source ./pre.flight.checks.sh
sudo pacman -Syu --noconfirm
sudo pacman -Syu --noconfirm xorg linux-headers nvidia-dkms terminator
sudo pacman -Syu --noconfirm lightdm lightdm-gtk-greeter lightdm-${init}
sudo pacman -Syu --noconfirm mate

if [ $init == runit ]
then
  echo Linking up DM service
  sudo ln -s /etc/runit/sv/lightdm /run/runit/service
else
  echo You have to link up the lightdm service for $init
fi

echo Reboot. You should get a greeter. Login. Run add.common.sh to install common apps.
