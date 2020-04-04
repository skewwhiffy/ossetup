#!/usr/bin/env bash
source pre.flight.checks.sh
source add.yay.sh

yay -Syu --noconfirm
yay -Syu --noconfirm xorg linux-headers nvidia-dkms
yay -Syu --noconfirm lightdm lightdm-gtk-greeter lightdm-${init}
yay -Syu --noconfirm mate mate-extra
yay -Syu --noconfirm brisk-menu

if [ $init == runit ]
then
  echo Linking up DM service
  sudo ln -s /etc/runit/sv/lightdm /run/runit/service
else
  echo You have to link up the lightdm service for $init
fi

echo Reboot. You should get a greeter. Login. Run add.common.sh to install common apps.
