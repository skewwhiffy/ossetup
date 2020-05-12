#!/usr/bin/env bash
source add.yay.sh

echo Installing NVIDIA and x
sudo pacman -Syu --noconfirm --needed
sudo pacman -Syu --noconfirm --needed xorg xorg-xinit linux-headers nvidia-dkms terminator

echo Installing systray programs for pulse and network manager
yay -Syu --noconfirm --needed pulseaudio pulseaudio-alsa pa-applet-git network-manager-applet \
  networkmanager-openvpn

echo Installing openbox and launcher
sudo pacman -Syu --noconfirm --needed openbox tint2 synapse
echo jwm > $HOME/.xinitrc

echo Reboot. Start x with startx.
