#!/usr/bin/env bash
sudo pacman -Syu --noconfirm
sudo pacman -Syu --noconfirm xorg linux-headers nvidia-dkms terminator
sudo pacman -Syu --noconfirm lightdm lightdm-gtk-greeter lightdm-runit
sudo pacman -Syu --noconfirm cinnamon
sudo yay -Syu mint-themes redmond-themes-git
sudo ln -s /etc/runit/sv/lightdm /run/runit/service

echo Reboot. You should get a greeter. Login. Run add.common.sh to install common apps.
