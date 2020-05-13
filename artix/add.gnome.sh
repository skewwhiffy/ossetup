#!/usr/bin/env bash
echo Installing gnome
toInstall=(
  x
  gdm
  gdm-runit
)
./add.sh ${toInstall[@]}

sudo ln -s /etc/runit/sv/gdm /run/runit/service

echo Reboot. You should get a greeter. Login. Run add.common.sh to install common apps.
