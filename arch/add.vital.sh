#!/usr/bin/env bash
echo Installing the first few so that you can get on with other stuff.
source ./pre.flight.checks.sh

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

sudo chsh -s /usr/bin/zsh
sudo chsh $user -s /usr/bin/zsh

