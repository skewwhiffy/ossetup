#!/usr/bin/env bash
source pre.flight.checks.sh
./add/yay.sh

if [ $# -eq 0 ]; then
  exit 0
fi

if [ $# -gt 1 ]; then
  for arg in "$@"
  do
    ./add.sh $arg
  done
  exit 0
fi

program=$1
if [ -f ./add/$program.sh ]; then
  echo Calling custom install script $program.sh
  ./add/$program.sh
elif pacman -Qi $program > /dev/null ; then
  echo $program already installed
else
  echo Installing $program
  yay -Syu --noconfirm --needed $program
fi
