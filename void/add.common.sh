#!/usr/bin/env bash

sudo xbps-install -Syyu 
sudo xbps-install -Syu \
  gnome-disk-utility \
  docker \
  ksuperkey \
  keepassxc \
  nautilus-dropbox \
  xfce4-whiskermenu-plugin xfce4-screensaver \
  xdpyinfo xdotool wmctrl xwininfo \
  apache-maven python3-pip \
  rhythmbox pulseaudio xfce4-pulseaudio-plugin \
  chromium \
  vscode \
  hplip \
  fcitx fcitx-libpinyin fcitx-configtool \
  dbeaver \
  rtl8812au-dkms \
  mit-krb5-devel
