#!/usr/bin/env bash
if ! (cat /etc/pam.d/chsh | grep auth | grep sufficient | grep pam_wheel.so | grep trust | grep -q group\=chsh) ; then
  echo "auth sufficient pam_wheel.so trust group=chsh" | sudo tee -a /etc/pam.d/chsh
fi

source pre.flight.checks.sh

ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc

echo LANG=en_GB.UTF-8 > /etc/locale.conf
echo KEYMAP=uk > /etc/vconsole.conf
echo kenny-linux > /etc/hostname
echo 127.0.0.1 localhost >> /etc/hosts
echo ::1 localhost >> /etc/hosts
echo 127.0.1.1 kenny-linux.localdomain kenny-linux >> /etc/hosts
mkinitcpio -P

if [ "$distribution" == "arch" ]; then
  systemctl enable dhcpcd
fi

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

mv /etc/locale.gen /etc/locale.orig.gen
sed s/#en_GB.UTF-8/en_GB.UTF-8/ /etc/locale.orig.gen >/etc/locale.gen
locale-gen

mv /etc/sudoers /etc/sudoers.orig
sed "s/# %wheel ALL=(ALL) NOPASSWD/%wheel ALL=(ALL) NOPASSWD/" /etc/sudoers.orig >/etc/sudoers

echo Adding new user $user
useradd -m $user -s /usr/bin/zsh
usermod -aG wheel $user
groupadd docker
usermod -aG docker $user
groupadd chsh
usermod -aG chsh $user

echo Reboot: system will install vital software
