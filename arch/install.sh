#!/usr/bin/env bash
source pre.flight.checks.sh

while true; do
  echo Please choose a password to use for root and $user
  read -s password
  echo Enter that password again to confirm
  read -s confirmPassword
  if [ "$password" == "$confirmPassword" ]; then
    break
  fi
  echo Your passwords didn\'t match. Let\'s try again.
done

echo Formatting and mounting $disk
pacman -Sy --noconfirm parted
swapoff -a

wipefs --all --force $disk
parted -a optimal -s $disk -- mklabel gpt
parted -a optimal -s $disk -- mkpart primary 512MiB 100%
parted -a optimal -s $disk -- mkpart ESP fat32 1MiB 512MiB
parted -a optimal -s $disk -- set 2 boot on

mkfs.ext4 -L $distribution ${disk}1
mkfs.fat -F 32 -n boot ${disk}2

mount /dev/disk/by-label/$distribution /mnt
mkdir -p /mnt/boot
mount /dev/disk/by-label/boot /mnt/boot

echo Disk formatted. Calling install.
pacman -Sy --noconfirm pacman-contrib
timedatectl set-ntp true
loadkeys uk

strapCommand=basestrap
if [ "$distribution" == "arch" ]; then
  strapCommand=pacstrap
fi
strapCommand+=" /mnt base linux linux-firmware base-devel git neovim grub efibootmgr networkmanager "
strapCommand+="network-manager-applet openssh"
if [ "$distribution" == "artix" ]; then
  strapCommand+=" runit networkmanager-runit elogind-runit"
else
  strapCommand+=" dhcpcd"
fi
eval $strapCommand

echo Copying setup files
cp -r ../../ossetup/ /mnt/ossetup
touch /mnt/changePassword.sh
chmod +x /mnt/changePassword.sh
echo "echo \"root:$password\" | chpasswd" >> /mnt/changePassword.sh
echo "echo \"$user:$password\" | chpasswd" >> /mnt/changePassword.sh

echo Making temp first run file
touch /mnt/etc/profile.d/temp.sh
chmod +x /mnt/etc/profile.d/temp.sh
echo '#!/usr/bin/env bash' >> /mnt/etc/profile.d/temp.sh
echo 'cd /ossetup/arch' >> /mnt/etc/profile.d/temp.sh
echo 'source first.run.sh' >> /mnt/etc/profile.d/temp.sh
echo 'sudo rm /etc/profile.d/temp.sh' >> /mnt/etc/profile.d/temp.sh

echo Installed a base system. Calling setup on your new system.
chrootCommand=artools-chroot
if [ "$distribution" == "arch" ]; then
	distribution=arch-chroot
elif [ "$distribution" == "manjaro" ]; then
	distribution=manjaro-chroot
fi
chrootCommand+=" /mnt /bin/bash -c "
eval $chrootCommand ./ossetup/arch/setup.sh
eval $chrootCommand ./changePassword.sh
rm /mnt/changePassword.sh

echo Rebooting. Login, I will install more stuff for you.
reboot
