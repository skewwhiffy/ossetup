#!/usr/bin/env bash
source add.yay.sh

echo Installing the first few so that you can get on with other stuff.
yay -Syu --noconfirm --needed yadm
yay -Syu --noconfirm --needed openssh
yay -Syu --noconfirm --needed zsh
yay -Syu --noconfirm --needed neovim
yay -Syu --noconfirm --needed dropbox
yay -Syu --noconfirm --needed firefox
yay -Syu --noconfirm --needed keepassxc
yay -Syu --noconfirm --needed rhythmbox