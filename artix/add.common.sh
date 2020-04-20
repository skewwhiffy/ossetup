#!/usr/bin/env bash
source pre.flight.checks.sh
source add.yay.sh

echo Installing common stuff
yay -Syu --noconfirm --needed aic94xx-firmware
yay -Syu --noconfirm --needed authy
yay -Syu --noconfirm --needed bison
yay -Syu --noconfirm --needed chromium
yay -Syu --noconfirm --needed code
yay -Syu --noconfirm --needed conky
yay -Syu --noconfirm --needed cups
yay -Syu --noconfirm --needed cups-${init}
yay -Syu --noconfirm --needed curl
yay -Syu --noconfirm --needed curl
yay -Syu --noconfirm --needed dbeaver
yay -Syu --noconfirm --needed docker
yay -Syu --noconfirm --needed docker-${init}
yay -Syu --noconfirm --needed emacs
yay -Syu --noconfirm --needed fzf
yay -Syu --noconfirm --needed gnome-disk-utility
yay -Syu --noconfirm --needed gnome-system-monitor
yay -Syu --noconfirm --needed gnome-screenshot
yay -Syu --noconfirm --needed gst-libav
yay -Syu --noconfirm --needed hplip
yay -Syu --noconfirm --needed inetutils
yay -Syu --noconfirm --needed jetbrains-toolbox
yay -Syu --noconfirm --needed libreoffice-still-uk
yay -Syu --noconfirm --needed lsb-release
yay -Syu --noconfirm --needed mame
yay -Syu --noconfirm --needed maven
yay -Syu --noconfirm --needed mint-x-icons
yay -Syu --noconfirm --needed mint-y-icons
yay -Syu --noconfirm --needed mongodb-compass-community-bin
yay -Syu --noconfirm --needed mongodb-shell-bin
yay -Syu --noconfirm --needed mongodb-tools-bin
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
yay -Syu --noconfirm --needed python-pip
yay -Syu --noconfirm --needed python2-pip
yay -Syu --noconfirm --needed redmond-themes-git
yay -Syu --noconfirm --needed rtl88xxau-aircrack-dkms-git
yay -Syu --noconfirm --needed ruby
yay -Syu --noconfirm --needed sane
yay -Syu --noconfirm --needed simple-scan
yay -Syu --noconfirm --needed the_silver_searcher
yay -Syu --noconfirm --needed tk
yay -Syu --noconfirm --needed tmux
yay -Syu --noconfirm --needed ttf-iosevka
yay -Syu --noconfirm --needed unzip
yay -Syu --noconfirm --needed usbutils
yay -Syu --noconfirm --needed vlc
yay -Syu --noconfirm --needed wd719x-firmware
yay -Syu --noconfirm --needed wget
yay -Syu --noconfirm --needed wkhtmltopdf-static
yay -Syu --noconfirm --needed wmctrl
yay -Syu --noconfirm --needed xclip
yay -Syu --noconfirm --needed zoom

echo Reboot. You should have quite a lot of your stuff setup now. See dev folder to set up dev tools.
