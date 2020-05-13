#!/usr/bin/env bash
yay -Syu --noconfirm --needed cups cups-runit
sudo ln -s /etc/runit/sv/cupsd /run/runit/service/

