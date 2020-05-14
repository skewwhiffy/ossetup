#!/usr/bin/env bash
echo Installing openbox
toInstall=(
  x
  pulseaudio
  pulseaudio-alsa
  pa-applet-git
  network-manager-applet
  networkmanager-openvpn
  ksuperkey
  tint2
  synapse
  openbox
)
./add.sh ${toInstall[@]}

echo openbox > $HOME/.xinitrc

echo Reboot. Start x with startx.
