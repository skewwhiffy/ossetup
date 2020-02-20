#!/usr/bin/env bash
echo Installing K8s tools
yay -Syu --noconfirm --needed eksctl-bin
yay -Syu --noconfirm --needed kubectl-bin
yay -Syu --noconfirm --needed kubectx
yay -Syu --noconfirm --needed stern-bin

echo Done...
