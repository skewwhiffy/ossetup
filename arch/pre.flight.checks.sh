#!/usr/bin/env bash
echo Checking for config
if [ ! -f config ]
then
  echo "***** ERROR *****"
  echo "No config file"
  echo "Do you need to copy config.template over?"
  exit 1
fi

echo Getting system disk
export disk=$(grep -Po "(?<=^disk=).+" config)
if [ $disk == SYSTEM_DISK ]
then
  echo "***** ERROR *****"
  echo "You need to set the system disk in config"
  fdisk -l
  exit 1
fi
echo System disk is $disk

echo Getting user name
export user=$(grep -Po "(?<=^user=).+" config)
if [ $user == USER ]
then
  echo "***** ERROR *****"
  echo "You need to set the user name in config"
  exit 1
fi

echo user name is $user