#!/usr/bin/env bash

echo Installing common stuff
sudo apt -y install neovim \
  xclip \
  fish \
  yadm \
  curl \
  wget \
  chromium \
  fcitx-libpinyin fcitx-config-gtk \
  silversearcher-ag \
  gnome-disk-utility \
  gnome-system-monitor \
  gnome-screenshot \
  rhythmbox \
  maven python python-pip python2 python2-pip \
  emacs gitk \
  bison golang \
  mame \
  # cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf - FOR DROPBOX
# Enable: https://devuan.org/os/etc/apt/sources.list backports
# jetbrains toolbox
# curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

#yay -Syu --noconfirm --needed authy https://aur.archlinux.org/packages/authy/
#yay -Syu --noconfirm --needed code https://github.com/VSCodium/vscodium/releases
#yay -Syu --noconfirm --needed dbeaver https://dbeaver.io/download/
#yay -Syu --noconfirm --needed docker
#yay -Syu --noconfirm --needed docker-${init}
#yay -Syu --noconfirm --needed hplip
#yay -Syu --noconfirm --needed ifconfig
#yay -Syu --noconfirm --needed inetutils
#yay -Syu --noconfirm --needed jetbrains-toolbox
#yay -Syu --noconfirm --needed mongodb-compass
#yay -Syu --noconfirm --needed mongodb-shell-bin
#yay -Syu --noconfirm --needed mongodb-tools-bin
#yay -Syu --noconfirm --needed net-tools
#yay -Syu --noconfirm --needed noto-fonts
#yay -Syu --noconfirm --needed noto-fonts-cjk
#yay -Syu --noconfirm --needed noto-fonts-emoji
#yay -Syu --noconfirm --needed noto-fonts-extra
#yay -Syu --noconfirm --needed ocs-url
#yay -Syu --noconfirm --needed okular
#yay -Syu --noconfirm --needed okular
#yay -Syu --noconfirm --needed onedrive-abraunegg
#yay -Syu --noconfirm --needed openvpn
#yay -Syu --noconfirm --needed pinta
#yay -Syu --noconfirm --needed postman-bin
#yay -Syu --noconfirm --needed python-pip
#yay -Syu --noconfirm --needed python2-pip
#yay -Syu --noconfirm --needed redmond-themes-git
#yay -Syu --noconfirm --needed rtl88xxau-aircrack-dkms-git
#yay -Syu --noconfirm --needed ruby
#yay -Syu --noconfirm --needed sane
#yay -Syu --noconfirm --needed simple-scan
#yay -Syu --noconfirm --needed tk
#yay -Syu --noconfirm --needed traceroute
#yay -Syu --noconfirm --needed ttf-iosevka
#yay -Syu --noconfirm --needed unzip
#yay -Syu --noconfirm --needed usbutils
#yay -Syu --noconfirm --needed wkhtmltopdf-static
#yay -Syu --noconfirm --needed zoom

echo Reboot. You should have quite a lot of your stuff setup now. See dev folder to set up dev tools.
