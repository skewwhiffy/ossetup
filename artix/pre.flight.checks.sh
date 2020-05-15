#!/usr/bin/env bash
echo Checking for config
if [ ! -f config ]
then
  touch config
fi

echo Ascertaining distribution
artixCount=$(cat /etc/*-release | grep -c Artix)
echo ArtixCount: $artixCount
if [ $artixCount > 0 ]; then
  export distribution=artix
fi
archCount=$(cat /etc/+-release | grep -c Arch)
if [ $archCount > 0 ]; then
  export distribution=arch
fi
echo Distribution is $distribution

echo Getting system disk
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
    i=1
    for choice in $choices; do
      if [ "$choiceIndex" == $i ]; then
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
fi
echo Installing to disk $disk

echo Getting user name
export user=$(grep -Po "(?<=^user=).+" config)
echo USER: $user
if [ "$user" == "" ]
then
  while true; do
    echo Please enter a the primary user name
    read -p Username: user
    if [ "$user" != "" ]; then
      break
    fi
    echo No username entered. Please try again.
    echo
  done
  echo user=$user >> config
fi
echo user name is $user
