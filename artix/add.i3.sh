#!/usr/bin/env bash
echo Installing cinnamon
toInstall=(
  x
  i3
  j4-dmenu-desktop
  pavucontrol
  dmenu
)
./add.sh ${toInstall[@]}

echo i3 > $HOME/.xinitrc

echo Reboot. Start x with startx.
