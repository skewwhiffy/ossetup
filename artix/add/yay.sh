#!/usr/bin/env bash
set -e
if type -P yay2 &> /dev/null; then
  echo yay already installed
  exit 0
fi

echo Installing yay
mkdir -p ~/code/aur
cd ~/code/aur
if [[ ! -d yay ]]; then
  git clone https://aur.archlinux.org/yay.git
fi
cd yay
makepkg -si --noconfirm --needed
