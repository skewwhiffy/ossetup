#!/usr/bin/env bash
echo Installing icewm
toInstall=(
  x
  icewm
  synapse
)
./add.sh ${toInstall[@]}
echo icewm-session > $HOME/.xinitrc

echo Reboot. Start x with startx.
