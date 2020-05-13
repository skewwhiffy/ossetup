#!/usr/bin/env bash
if [ $# -eq 0 ]; then
  echo Nothing to install
  exit 0
fi

if [ $# -gt 1 ]; then
  for arg in "$@"
  do
    source ./add.sh $arg
  done
  exit 0
fi

program=$1
if [ -f ./add/$program.sh ]; then
  echo Calling custom install script $program.sh
  source ./add/$program.sh
else
  echo Installing $program
  yay -Syu --noconfirm --needed $program
fi
