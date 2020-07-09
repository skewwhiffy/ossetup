#!/usr/bin/env bash
yay -Syu --noconfirm --needed onedrive-abraunegg
if [ "$distribution" == "artix" ]; then
  originalDirectory=$(pwd)
  cd ./pkg/onedrive-abraunegg-runit
  makepkg -is --noconfirm --needed
  cd $originalDirectory
fi
if [ "$distribution" == "arch" ]; then
  sudo systemctl enable --now onedrive
fi
