#!/usr/bin/env bash
echo Installing yay
mkdir -p ~/code/aur
cd ~/code/aur
if [[ ! -d yay ]]; then
    git clone https://aur.archlinux.org/yay.git
fi
cd yay
makepkg -si --noconfirm --needed
