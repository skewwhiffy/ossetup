#!/usr/bin/env bash
echo Installing xfce
toInstall=(
  x
  network-manager-applet
  pavucontrol
  xfce4-pulseaudio-plugin
  xfce4
  ksuperkey
)
./add.sh ${toInstall[@]}

echo startxfce4 > $HOME/.xinitrc

echo Reboot. Start x with startx.
