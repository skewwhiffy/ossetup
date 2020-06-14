#!/usr/bin/env bash
source ./pre.flight.checks.sh

toInstall=(
  yadm
  fish
  antibody
  openssh
  tmux
  neovim
  python-pip
)
./add.sh ${toInstall[@]}

sudo chsh -s /usr/bin/fish
sudo chsh $user -s /usr/bin/fish

rm -rf ~/.config/fish/*
yadm init
yadm remote add origin git@github.com:skewwhiffy/yadm.git
yadm fetch
yadm checkout master
