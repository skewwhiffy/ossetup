#!/usr/bin/env bash
echo Installing Deepin
toInstall=(
  x
  deepin
)
./add.sh ${toInstall[@]}

echo exec startdde > $HOME/.xinitrc

echo Reboot. Start deepin with startx.
