#!/usr/bin/env bash
./pre.flight.checks.sh

echo Installing common stuff
toInstall=(
  aic94xx-firmware
  authy
  bison
  chromium
  code
  conky
  cups
  curl
  dbeaver
  docker
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

echo Reboot. You should have quite a lot of your stuff setup now. See dev folder to set up dev tools.
