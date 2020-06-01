#!/usr/bin/env bash
echo Installing Budgie
toInstall=(
  x
  budgie-desktop
  budgie-extras
)
./add.sh ${toInstall[@]}

echo export XDG_CURRENT_DESKTOP=Budgie:GNOME > $HOME/.xinitrc
echo exec budgie-desktop >> $HOME/.xinitrc

echo Reboot. Start cinnamon with startx.
