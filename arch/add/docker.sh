#!/usr/bin/env bash
yay -Syu --noconfirm --needed docker
if [ "$distribution" == "artix" ]; then
  yay -Syu --noconfirm --needed docker-runit
  sudo ln -s /etc/runit/sv/docker /run/runit/service/
fi
if [ "$distribution" == "arch" ]; then
  systemctl enable --now docker
fi

