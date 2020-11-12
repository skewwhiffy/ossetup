#!/usr/bin/env bash
echo Installing common stuff
toInstall=(
  aic94xx-firmware
  authy
  bison
  chromium
  code
  cups
  curl
  dbeaver
  docker
  fcitx-libpinyin
  fcitx-configtool
  fzf
  gnome-disk-utility
  gnome-mahjongg
  gnome-system-monitor
  gnome-screenshot
  gst-libav
  hplip
  ifconfig
  inetutils
  jetbrains-toolbox
  lsb-release
  maven
  mongodb-compass
  mongodb-shell-bin
  mongodb-tools-bin
  nerd-fonts-iosevka
  net-tools
  networkmanager-openvpn
  nordvpn
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-extra
  ocs-url
  okular
  onedrive
  openvpn
  postman-bin
  rtl88xxau-aircrack-dkms-git
  ruby
  sane
  simple-scan
  the_silver_searcher
  tk
  traceroute
  unzip
  usbutils
  vlc
  wd719x-firmware
  wget
  wmctrl
  xclip
  xdotool
  zoom
)

./add.sh ${toInstall[@]}

echo Reboot. You should have quite a lot of your stuff setup now. See dev folder to set up dev tools.
