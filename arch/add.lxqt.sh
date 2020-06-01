#!/usr/bin/env bash
echo Installing LXQT
toInstall=(
  x
  lxqt
)
./add.sh ${toInstall[@]}

echo exec startlxqt > $HOME/.xinitrc

echo Reboot. Start LXQT with startx.
