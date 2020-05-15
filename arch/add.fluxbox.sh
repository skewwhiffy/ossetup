#!/usr/bin/env bash
echo Installing fluxbox
toInstall=(
  x
  pulseaudio
  pulseaudio-alsa
  pa-applet-git
  pavucontrol
  network-manager-applet
  networkmanager-openvpn
  ksuperkey
  synapse
  fluxbox
)
./add.sh ${toInstall[@]}

echo startfluxbox > $HOME/.xinitrc

echo Reboot. Start x with startx.
