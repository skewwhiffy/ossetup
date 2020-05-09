#!/usr/bin/env bash
sudo pacman -Syu --noconfirm --needed
sudo pacman -Syu --noconfirm --needed xorg xorg-xinit linux-headers nvidia-dkms terminator
sudo pacman -Syu --noconfirm --needed cinnamon
yay -Syu --noconfirm --needed mint-themes redmond-themes-git
echo cinnamon-session > $HOME/.xinitrc

echo Reboot. Start cinnamon with startx.
