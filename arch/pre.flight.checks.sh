#!/usr/bin/env bash
if [ ! -f config ]
then
  echo No config: making file
  touch config
fi

export distribution=$(grep -Po "(?<=^distribution=).+" config)
if [ "$distribution" == "" ]
then
  artixCount=$(cat /etc/*-release | grep -c Artix)
  if (( $artixCount > 0 )) || [ -d /run/runit/service ]; then
    export distribution=artix
  fi
  archCount=$(cat /etc/*-release | grep -c Arch)
  if (( $archCount > 0 )); then
    export distribution=arch
  fi
  manjaroCount=$(cat /etc/*-release | grep -c Manjaro)
  if (( $manjaroCount > 0 )); then
    export distribution=manjaro
  fi
  if [ "$distribution" == "" ]; then
    echo "Cannot ascertain distribution"
    echo "Assuming arch"
    export distribution=arch
  fi
  echo distribution=$distribution >> config
fi

export disk=$(grep -Po "(?<=^disk=).+" config)
if [ "$disk" == "" ]
then
  while true; do
    echo "Please choose disk to install the operating system to"
    sudo fdisk -l | grep Disk | grep sectors
    export choices=$(sudo fdisk -l | grep Disk | grep sectors | sed "s/^Disk \(.*\):.*/\1/" )
    i=1
    for choice in $choices; do
      echo [$i]: $choice
      i=$((i+1))
    done
    read -p 'Your choice: ' choiceIndex
    echo "You chose $choiceIndex"
    i=1
    for choice in $choices; do
      if [ "$choiceIndex" == $i ] || [ "$choiceIndex" == "$choice" ]; then
        disk=$choice
      fi
      i=$((i+1))
    done
    if [ "$disk" != "" ]; then
      break
    fi
    echo Your choice was not valid.
    echo Please choose again.
    echo
  done
  echo disk=$disk >> config
  echo Installing to disk $disk
fi

export user=$(grep -Po "(?<=^user=).+" config)
if [ "$user" == "" ]
then
  while true; do
    echo Please enter a the primary user name
    read -p 'Username: ' user
    if [ "$user" != "" ]; then
      break
    fi
    echo No username entered. Please try again.
    echo
  done
  echo user=$user >> config
  echo Username is $user
fi
