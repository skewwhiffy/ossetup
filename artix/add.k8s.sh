#!/usr/bin/env bash
echo Installing K8s tools
toInstall=(
  eksctl-bin
  kubectl-bin
  kubectx
  stern-bin
)
./add.sh ${toInstall[@]}

echo Done...
