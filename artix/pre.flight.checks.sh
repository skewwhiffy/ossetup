#!/usr/bin/env bash
echo Checking for config
if [ ! -f config ]
then
  touch config
fi

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
fi
echo System disk is $disk
exit

echo Getting init system
export init=$(grep -Po "(?<=^init=).+" config)
if [ $init == INIT ]
then
  echo "***** ERROR *****"
  echo "You need to set the init system in config"
  echo "You can use the following init systems: runit, s6, openrc"
  exit 1
fi

echo Getting user name
export user=$(grep -Po "(?<=^user=).+" config)
if [ $user == USER ]
then
  echo "***** ERROR *****"
  echo "You need to set the user name in config"
  exit 1
fi

echo user name is $user
