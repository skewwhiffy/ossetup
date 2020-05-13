#!/usr/bin/env bash
set -e

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
echo installing $program
