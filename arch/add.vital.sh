#!/usr/bin/env bash
echo Installing the first few so that you can get on with other stuff.
toInstall=(
  yadm
  fish
  openssh
  tmux
  neovim
  python-pip
  dropbox
  firefox
  keepassxc
  rhythmbox
)
./add.sh ${toInstall[@]}
