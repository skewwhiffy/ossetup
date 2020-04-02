#!/usr/bin/env bash
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

echo Getting init system
export init=$(grep -Po "(?<=^init=).+" config)
if [ $init == INIT ]
then
  echo "***** ERROR *****"
  echo "You need to set the init system in config"
  echo "You can use the following init systems: runit, s6, openrc"
  exit 1
fi
echo Init system is $init
