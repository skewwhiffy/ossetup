#!/usr/bin/env bash

echo Adding fish repository from opensuse build service
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list

echo Adding fish GPG key
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null

echo Updating package cache
sudo apt update

echo Installing fish
sudo apt install -y fish

echo Adding fish to shells
which fish | sudo tee -a /etc/shells > /dev/null
