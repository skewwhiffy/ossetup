pacman -Sy pacman-contrib
timedatectl set-ntp true
loadkeys uk

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
cat /etc/pacman.d/mirrorlist.backup | grep -A 1 "United Kingdom" | grep "[^\-]" > /etc/pacman.d/mirrorlist.uk
rankmirrors /etc/pacman.d/mirrorlist.uk > /etc/pacman.d/mirrorlist

pacstrap /mnt base linux linux-firmware base-devel git neovim grub efibootmgr openrc networkmanager networkmanager-openrc network-manager-applet

fstabgen -L /mnt >> /mnt/etc/fstab

artools-chroot /mnt
