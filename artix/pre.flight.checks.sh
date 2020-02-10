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

echo Getting user password
export password=$(grep -Po "(?<=^password=).+" config)
if [ $password == USER_PASSWORD ]
then
  echo "***** ERROR *****"
  echo "You need to set the user password in config"
  exit 1
fi
echo User password is set

echo Getting root password
export root_password=$(grep -Po "(?<=^root_password=).+" config)
if [ $root_password == ROOT_PASSWORD ]
then
  echo "***** ERROR *****"
  echo "You need to set the root password in config"
  exit 1
fi
echo Root password is set
