#!/usr/bin/env bash

cd ~/code/third.party
if [ ! -d compass ]; then
  git clone https://github.com/mongodb-js/compass
fi

cd compass
npm install

if [ "$GOPATH" == "" ]; then
  echo GO not properly setup, there is no GOPATH
  exit 1
fi

mkdir -p $GOPATH/src/github.com/mongodb
cd $GOPATH/src/github.com/mongodb
if [ ! -d mongo-tools ]; then
  git clone https://github.com/mongodb/mongo-tools
  cd mongo-tools
  ./build.sh
  cd bin
  cp * $GOPATH/bin
fi
