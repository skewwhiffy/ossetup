#!/usr/bin/env bash
toInstall=(
  x
  pulseaudio
  pulseaudio-alsa
  pa-applet-git
  network-manager-applet
  networkmanager-openvpn
  jwm synapse
)
./add.sh ${toInstall[@]}

echo jwm > $HOME/.xinitrc

echo Reboot. Start x with startx.
