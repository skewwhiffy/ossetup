#!/usr/bin/env bash

_snapid="H8ZpNgIoPyvmkgxOWw5MSzsXK1wRZiHn"
_snaprev="5"
source="https://api.snapcraft.io/api/v1/snaps/download/${_snapid}_${_snaprev}.snap"

if ! command -v unsquashfs &> /dev/null; then
  echo Please install squashfs-tools
  exit
fi

if [ ! -f authy.snap ]; then
  wget -O authy.snap $source
fi

unsquashfs -f -d authy authy.snap

cp ./authy.desktop ~/.local/share/applications/
