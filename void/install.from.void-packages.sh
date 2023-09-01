#!/usr/bin/env bash

void_packages_directory="$HOME/code/third.party/void-packages"

if [ ! -d  "$void_packages_directory" ]; then
  echo Ensure add.void-packages has been installed
  exit 1
fi

echo $1
echo Building $2 package
cd "$void_packages_directory"
./xbps-src pkg $1

echo Installing $2
sudo xbps-install -Syy --repository "./hostdir/binpkgs$3/$1"
