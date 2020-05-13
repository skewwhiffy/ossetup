#!/usr/bin/env bash
./add.yay.sh

sudo pacman -Syu --noconfirm --needed
sudo pacman -Syu --noconfirm --needed xorg xorg-xinit linux-headers nvidia-dkms
sudo pacman -Syu --noconfirm --needed terminator network-manager-applet pavucontrol xfce4-pulseaudio-plugin
sudo pacman -Syu --noconfirm --needed xfce4 
yay -Syu --noconfirm --needed ksuperkey
echo startxfce4 > $HOME/.xinitrc

echo Reboot. Start x with startx.
