#!/usr/bin/env bash
disk=$(grep -Po "(?<=^disk=).+" config)
if [ $disk == SYSTEM_DISK ]
then
  echo "***** ERROR *****"
  echo "You need to set the system disk in config"
  fdisk -l
  exit 1
fi

echo Formatting and mounting $disk
totalk=$(awk '/^MemTotal:/{print $2}' /proc/meminfo)
totalm=$(($totalk / 1024))
totalg=$(($totalm / 1024))
swap=$(($totalg + 1))
echo Creating "$swap"GiB of swap

pacman -Sy --noconfirm parted
swapoff -a

wipefs --all --force $disk
parted -a optimal -s $disk -- mklabel gpt
parted -a optimal -s $disk -- mkpart primary 512MiB -"$swap"GiB
parted -a optimal -s $disk -- mkpart primary linux-swap -"$swap"GiB 100%
parted -a optimal -s $disk -- mkpart ESP fat32 1MiB 512MiB
parted -a optimal -s $disk -- set 3 boot on

mkfs.ext4 -L artix ${disk}1
mkswap -L swap ${disk}2
mkfs.fat -F 32 -n boot ${disk}3

mount /dev/disk/by-label/artix /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot
swapon ${disk}2

echo Disk formatted. Calling install.
./install.sh
