#!/usr/bin/env bash
echo Might need your password
sudo mkdir -p /etc/X11/xorg.conf.d
sudo cp $HOME/code/personal/ossetup/xorg/00-keyboard.conf /etc/X11/xorg.conf.d/
