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

if [ "$distribution" == "artix" ]; then
  basestrap /mnt base linux linux-firmware base-devel git neovim grub efibootmgr runit \
    networkmanager networkmanager-runit network-manager-applet elogind-runit openssh tmux \
    python-pip openssh fish
  fstabgen -L /mnt >> /mnt/etc/fstab
fi
if [ "$distribution" == "arch" ]; then
  pacstrap /mnt base linux linux-firmware base-devel dhcpcd git neovim grub efibootmgr \
    networkmanager network-manager-applet openssh fish python-pip
  genfstab -U /mnt >> /mnt/etc/fstab
fi

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
mkdir -p /mnt/home/$user/.config/fish
touch /mnt/home/$user/.config/fish/config.fish
echo 'bash /etc/profile.d/temp.sh' >> /mnt/home/$user/.config/fish/config.fish
echo 'sudo rm ~/.config/fish/config.fish' >> /mnt/home/$user/.config/fish/config.fish

echo Installed a base system. Calling setup on your new system.
if [ "$distribution" == "artix" ]; then
  artools-chroot /mnt /bin/bash -c ./ossetup/arch/setup.sh
  artools-chroot /mnt /bin/bash -c ./changePassword.sh
fi
if [ "$distribution" == "arch" ]; then
  arch-chroot /mnt /bin/bash -c ./ossetup/arch/setup.sh
  arch-chroot /mnt /bin/bash -c ./changePassword.sh
fi
rm /mnt/changePassword.sh

echo Rebooting. Login, I will install more stuff for you.
reboot
