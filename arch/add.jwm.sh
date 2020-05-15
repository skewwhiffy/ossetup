#!/usr/bin/env bash
toInstall=(
  x
  pulseaudio
  pulseaudio-alsa
  pa-applet-git
  network-manager-applet
  networkmanager-openvpn
  ksuperkey
  synapse
  jwm
)
./add.sh ${toInstall[@]}

echo jwm > $HOME/.xinitrc

echo Reboot. Start x with startx.
