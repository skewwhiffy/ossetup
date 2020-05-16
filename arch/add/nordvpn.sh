#!/usr/bin/env bash
yay -Syu --noconfirm --needed nordvpn-bin
if [ "$distribution" == "artix" ]; then
  originalDirectory=$(pwd)
  cd ../pkg/nordvpn-runit
  makepkg -is
  cd $originalDirectory
fi
if [ "$distribution" == "arch" ]; then
  systemctl enable --now onedrive
fi
