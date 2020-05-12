#!/usr/bin/env bash
sudo pacman -Syu --noconfirm --needed
sudo pacman -Syu --noconfirm --needed xorg xorg-xinit linux-headers nvidia-dkms terminator
sudo pacman -Syu --noconfirm --needed xfce4
echo startxfce4 > $HOME/.xinitrc

echo Reboot. Start x with startx.
