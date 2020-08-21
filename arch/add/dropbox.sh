#!/usr/bin/env bash
yay -Syu --noconfirm wget
wget https://linux.dropbox.com/fedora/rpm-public-key.asc
gpg --import rpm-public-key.asc
rm rpm-public-key.asc
yay -Syu --noconfirm --needed dropbox
