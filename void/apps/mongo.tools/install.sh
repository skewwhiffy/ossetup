#!/bin/sh
echo Ensuring dependencies exist
sudo xbps-install go libpcap-devel git

echo Cloning code from github
mkdir -p ~/go/src/github.com/mongodb
cd ~/go/src/github.com/mongodb
rm -rf mongo-tools
git clone https://github.com/mongodb/mongo-tools

echo Building tools
cd mongo-tools
./build.sh

echo Making tools available globally
cd bin
sudo cp * /usr/local/bin
