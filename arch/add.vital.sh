#!/usr/bin/env bash
echo Installing the first few so that you can get on with other stuff.
toInstall=(
  yadm
  zsh
  antibody
  openssh
  tmux
  neovim
  python-pip
)
./add.sh ${toInstall[@]}
