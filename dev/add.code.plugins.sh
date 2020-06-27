#!/usr/bin/env bash
if type -P code &> /dev/null; then
  codeCommand=code
fi

if type -P codium &> /dev/null; then
  codeCommand=codium
fi

if [ "$codeCommand" == "" ]; then
  echo Code not installed.
  exit 1
fi

eval "$codeCommand --install-extension dcortes92.FreeMarker"
eval "$codeCommand --install-extension GabrielBB.vscode-lombok"
eval "$codeCommand --install-extension redhat.java"
eval "$codeCommand --install-extension VisualStudioExptTeam.vscodeintellicode"
eval "$codeCommand --install-extension vscjava.vscode-java-debug"
eval "$codeCommand --install-extension vscjava.vscode-java-dependency"
eval "$codeCommand --install-extension vscjava.vscode-java-pack"
eval "$codeCommand --install-extension vscjava.vscode-maven"
eval "$codeCommand --install-extension vscodevim.vim"
eval "$codeCommand --install-extension golang.go"
