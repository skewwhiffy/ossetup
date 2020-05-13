#!/usr/bin/env bash
./pre.flight.checks.sh
./add.sh yay
echo DONE

echo Installing common stuff
toInstall=(
  aic94xx-firmware
  authy
  bison
  chromium
  code
  conky
  curl
  dbeaver
  emacs
  fcitx-libpinyin
  fcitx-configtool
  fzf
  gnome-disk-utility
  gnome-system-monitor
  gnome-screenshot
  gst-libav
  hplip
  ifconfig
  inetutils
  jetbrains-toolbox
  libreoffice-still-uk
  lsb-release
  mame
  maven
  mongodb-compass
  mongodb-shell-bin
  mongodb-tools-bin
  net-tools
  networkmanager-openvpn
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  ocs-url
  okular
  okular
  onedrive-abraunegg
  openvpn
  pinta
  postman-bin
  python2-pip
  rtl88xxau-aircrack-dkms-git
  ruby
  sane
  simple-scan
  the_silver_searcher
  tk
  traceroute
  ttf-iosevka
  unzip
  usbutils
  vlc
  wd719x-firmware
  wget
  wkhtmltopdf-static
  wmctrl
  xclip
  xdotool
  zoom
)

./add.sh ${toInstall[@]}
exit 0
yay -Syu --noconfirm --needed cups
yay -Syu --noconfirm --needed cups-${init}
sudo ln -s /etc/runit/sv/cupss /run/runit/service
yay -Syu --noconfirm --needed docker
yay -Syu --noconfirm --needed docker-${init}
sudo ln -s /etc/runit/sv/docker /run/runit/service
exit 0

yay -Syu --noconfirm --needed aic94xx-firmware
yay -Syu --noconfirm --needed authy
yay -Syu --noconfirm --needed bison
yay -Syu --noconfirm --needed chromium
yay -Syu --noconfirm --needed code
yay -Syu --noconfirm --needed conky
yay -Syu --noconfirm --needed cups
yay -Syu --noconfirm --needed cups-${init}
sudo ln -s /etc/runit/sv/cupss /run/runit/service
yay -Syu --noconfirm --needed curl
yay -Syu --noconfirm --needed dbeaver
yay -Syu --noconfirm --needed docker
yay -Syu --noconfirm --needed docker-${init}
sudo ln -s /etc/runit/sv/docker /run/runit/service
yay -Syu --noconfirm --needed emacs
yay -Syu --noconfirm --needed fcitx-libpinyin
yay -Syu --noconfirm --needed fcitx-configtool
yay -Syu --noconfirm --needed fzf
yay -Syu --noconfirm --needed gnome-disk-utility
yay -Syu --noconfirm --needed gnome-system-monitor
yay -Syu --noconfirm --needed gnome-screenshot
yay -Syu --noconfirm --needed gst-libav
yay -Syu --noconfirm --needed hplip
yay -Syu --noconfirm --needed ifconfig
yay -Syu --noconfirm --needed inetutils
yay -Syu --noconfirm --needed jetbrains-toolbox
yay -Syu --noconfirm --needed libreoffice-still-uk
yay -Syu --noconfirm --needed lsb-release
yay -Syu --noconfirm --needed mame
yay -Syu --noconfirm --needed maven
yay -Syu --noconfirm --needed mongodb-compass
yay -Syu --noconfirm --needed mongodb-shell-bin
yay -Syu --noconfirm --needed mongodb-tools-bin
yay -Syu --noconfirm --needed net-tools
yay -Syu --noconfirm --needed networkmanager-openvpn
yay -Syu --noconfirm --needed noto-fonts
yay -Syu --noconfirm --needed noto-fonts-cjk
yay -Syu --noconfirm --needed noto-fonts-emoji
yay -Syu --noconfirm --needed noto-fonts-extra
yay -Syu --noconfirm --needed ocs-url
yay -Syu --noconfirm --needed okular
yay -Syu --noconfirm --needed okular
yay -Syu --noconfirm --needed onedrive-abraunegg
yay -Syu --noconfirm --needed openvpn
yay -Syu --noconfirm --needed pinta
yay -Syu --noconfirm --needed postman-bin
yay -Syu --noconfirm --needed python2-pip
yay -Syu --noconfirm --needed rtl88xxau-aircrack-dkms-git
yay -Syu --noconfirm --needed ruby
yay -Syu --noconfirm --needed sane
yay -Syu --noconfirm --needed simple-scan
yay -Syu --noconfirm --needed the_silver_searcher
yay -Syu --noconfirm --needed tk
yay -Syu --noconfirm --needed traceroute
yay -Syu --noconfirm --needed ttf-iosevka
yay -Syu --noconfirm --needed unzip
yay -Syu --noconfirm --needed usbutils
yay -Syu --noconfirm --needed vlc
yay -Syu --noconfirm --needed wd719x-firmware
yay -Syu --noconfirm --needed wget
yay -Syu --noconfirm --needed wkhtmltopdf-static
yay -Syu --noconfirm --needed wmctrl
yay -Syu --noconfirm --needed xclip
yay -Syu --noconfirm --needed xdotool
yay -Syu --noconfirm --needed zoom

echo Reboot. You should have quite a lot of your stuff setup now. See dev folder to set up dev tools.
