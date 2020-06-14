#!/usr/bin/env bash
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

yadm init
yadm remote add git@github.com:skewwhiffy/yadm.git
rm ~/.zshrc*
yadm fetch
yadm checkout master
