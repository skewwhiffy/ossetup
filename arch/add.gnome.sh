#!/usr/bin/env bash
echo Installing gnome
toInstall=(
  x
  gdm
  gdm-runit
  gnome-shell
  gnome-control-center
  gnome-tweaks
  chrome-gnome-shell
)
./add.sh ${toInstall[@]}

if [ "$distribution" == "artix" ]; then
  sudo ln -s /etc/runit/sv/gdm /run/runit/service
  sudo sv stop gdm
else
  sudo systemctl enable gdm
fi

echo Reboot. You should get a greeter. Login. Run add.common.sh to install common apps.
