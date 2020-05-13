#!/usr/bin/env bash
yay -Syu --noconfirm --needed docker docker-runit
sudo ln -s /etc/runit/sv/docker /run/runit/service/

