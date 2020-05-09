#!/usr/bin/env bash
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc

echo LANG=en_GB.UTF-8 > /etc/locale.conf
echo KEYMAP=uk > /etc/vconsole.conf
echo kenny-linux > /etc/hostname
echo 127.0.0.1 localhost >> /etc/hosts
echo ::1 localhost >> /etc/hosts
echo 127.0.1.1 kenny-linux.localdomain kenny-linux >> /etc/hosts
mkinitcpio -P

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

mv /etc/locale.gen /etc/locale.orig.gen
sed s/#en_GB.UTF-8/en_GB.UTF-8/ /etc/locale.orig.gen >/etc/locale.gen
locale-gen

mv /etc/sudoers /etc/sudoers.orig
sed "s/# %wheel ALL=(ALL) NOPASSWD/%wheel ALL=(ALL) NOPASSWD/" /etc/sudoers.orig >/etc/sudoers

echo Set root password
until passwd
do
  echo That did not work. Try again, please.
done

echo Adding new user $user
useradd -m $user
usermod -aG wheel $user
groupadd docker
usermod -aG docker $user
until passwd $user
do
  echo That did not work. Try again, please.
done

echo You have to link up the network service for $init after a reboot

echo Now reboot and login as $user. You should get a working system.
