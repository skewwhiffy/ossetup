#!/usr/bin/env bash
yay --noconfirm --needed -Syu
yay --noconfirm --needed -Syu linux-headers nvidia terminator \
  xorg gnome gnome-extra chrome-gnome-shell
yay -Syu --noconfirm --needed lightdm lightdm-gtk-greeter lightdm-runit
sudo ln -s /etc/runit/sv/lightdm /run/runit/service

echo Reboot. You should get a greeter. Login. Run add.common.sh to install common apps.
