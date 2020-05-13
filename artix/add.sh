#!/usr/bin/env bash
if [ $# -eq 0 ]; then
  echo Nothing to install
  return
fi

if [ $# -gt 1 ]; then
  for arg in "$@"
  do
    source ./add.sh $arg
  done
  return
fi

program=$1

if [ -f add/$program.sh ]; then
  source add/$program.sh
  return
fi
echo installing $program
