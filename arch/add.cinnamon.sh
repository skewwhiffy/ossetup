#!/usr/bin/env bash
echo Installing cinnamon
toInstall=(
  x
  cinnamon
  # mint-themes
  # redmond-themes-git
  # mint-x-icons
)
./add.sh ${toInstall[@]}

echo cinnamon-session > $HOME/.xinitrc

echo Reboot. Start cinnamon with startx.
