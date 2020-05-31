#!/usr/bin/env bash
echo Installing KDE Plasma
toInstall=(
  x
  plasma-pa
  plasma-desktop
)
./add.sh ${toInstall[@]}

echo exec startplasma-x11 > $HOME/.xinitrc

echo Reboot. Start KDE with startx.
