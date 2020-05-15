#!/usr/bin/env bash
echo Installing the first few so that you can get on with other stuff.
toInstall=(
  yadm
  dropbox
  firefox
  keepassxc
  rhythmbox
)
./add.sh ${toInstall[@]}
