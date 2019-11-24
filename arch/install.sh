pacman -Sy --noconfirm pacman-contrib
timedatectl set-ntp true
loadkeys uk

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
cat /etc/pacman.d/mirrorlist.backup \
  | grep -A 1 "United Kingdom" \
  | grep "[^\-]" > /etc/pacman.d/mirrorlist.uk
rankmirrors /etc/pacman.d/mirrorlist.uk > /etc/pacman.d/mirrorlist

pacstrap /mnt base linux linux-firmware base-devel dhcpcd git neovim grub efibootmgr

genfstab -U /mnt >> /mnt/etc/fstab

echo Installed a base system. Clone this repo in your new system and run setup.sh
echo This repo is at:
git remote -v

arch-chroot /mnt
