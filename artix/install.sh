#!/usr/bin/env bash
source pre.flight.checks.sh

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
pacman -Sy --noconfirm pacman-contrib
timedatectl set-ntp true
loadkeys uk

basestrap /mnt base linux linux-firmware base-devel git neovim grub efibootmgr runit \
  networkmanager networkmanager-runit network-manager-applet elogind-runit

fstabgen -L /mnt >> /mnt/etc/fstab

echo Copying setup files
cp -r ../../ossetup/ /mnt/ossetup

echo Installed a base system. Calling setup on your new system.
artools-chroot /mnt /bin/bash -c ./ossetup/artix/setup.sh
