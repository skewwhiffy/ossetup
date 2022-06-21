#!/usr/bin/env bash

echo Installing dependencies
sudo xbps-install -Syyu curl \
    freetype-devel fontconfig-devel 

../software/add.neovide
