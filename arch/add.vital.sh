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
sudo rm ~/.zshrc*

yadm init
yadm remote add origin git@github.com:skewwhiffy/yadm.git
yadm fetch
yadm checkout master
