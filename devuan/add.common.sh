#!/usr/bin/env bash
echo Installing vital stuff
sudo apt -y install \
  tmux \
  yadm \
  fish \
  curl \
  wget

sudo apt -y install \
  terminator \
  nautilus-dropbox \
  keepassxc \
  gnome-disk-utility \
  python3-pip \

echo Installing common stuff
sudo apt -y install \
  dkms \
  docker.io \
  make \
  libx11-dev \
  libxtst-dev \
  pkg-config \
  cmake \
  automake \
  libtool \
  libtool-bin \
  gettext \
  xclip \
  fcitx-libpinyin \
  fcitx-config-gtk \
  silversearcher-ag \
  gnome-system-monitor \
  gnome-screenshot \
  rhythmbox \
  maven \
  emacs \
  gitk \
  bison \
  gcc \
  mame \
  xdotool \
  wmctrl \
  network-manager

sudo usermod -aG docker $(whoami)

echo Installing third party software
mkdir -p ~/code/third.party

if ! type -P nvim &> /dev/null; then
  echo Installing nvim
  cd ~/code/third.party
  rm -rf neovim
  git clone https://github.com/neovim/neovim
  cd neovim
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  sudo update-alternatives --install /etc/alternatives/nvim editor /usr/local/bin/nvim 30
fi

if ! type -P ksuperkey &> /dev/null; then
  echo Installing ksuperkey
  cd ~/code/third.party
  git clone https://github.com/hanschen/ksuperkey
  cd ksuperkey
  make
  sudo make install
fi

if [ ! -d ~/code/third.party/rtl8812au ]; then
  echo Installing RTL 8812 AU driver
  cd ~/code/third.party
  git clone https://github.com/gnab/rtl8812au.git
  cd rtl8812au
  make
  sudo cp 8812au.ko /lib/modules/$(uname -r)/kernel/drivers/net/wireless
  sudo depmod
fi

if ! type -P codium &> /dev/null; then
  echo Installing Codium
  wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
  echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
  sudo apt update && sudo apt -y install codium
fi

#yay -Syu --noconfirm --needed code https://github.com/VSCodium/vscodium/releases
#yay -Syu --noconfirm --needed dbeaver https://dbeaver.io/download/
#yay -Syu --noconfirm --needed mongodb-compass
#yay -Syu --noconfirm --needed mongodb-shell-bin
#yay -Syu --noconfirm --needed mongodb-tools-bin
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
