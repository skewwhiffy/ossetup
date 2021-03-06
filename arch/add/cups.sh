#!/usr/bin/env bash
yay -Syu --noconfirm --needed cups
if [ "$distribution" == "artix" ]; then
  yay -Syu --noconfirm --needed cups-runit
  sudo ln -s /etc/runit/sv/cupsd /run/runit/service/
fi
if [ "$distribution" == "arch" ]; then
  sudo systemctl enable --now org.cups.cupsd.service
fi
