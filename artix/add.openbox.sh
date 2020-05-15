#!/usr/bin/env bash
echo Installing openbox
toInstall=(
  x
  pulseaudio
  pulseaudio-alsa
  pa-applet-git
  pavucontrol
  network-manager-applet
  networkmanager-openvpn
  ksuperkey
  tint2
  synapse
  openbox
)
./add.sh ${toInstall[@]}

echo openbox-session > $HOME/.xinitrc

echo Reboot. Start x with startx.
