ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
ln -s /etc/runit/sv/NetworkManager /run/runit/service

echo LANG=en_GB.UTF-8 > /etc/locale.conf
echo KEYMAP=uk > /etc/vconsole.conf
echo kenny-linux > /etc/hostname
echo 127.0.0.1 localhost >> /etc/hosts
echo ::1 localhost >> /etc/hosts
echo 127.0.1.1 kenny-linux.localdomain kenny-linux >> /etc/hosts
mkinitcpio -P

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

echo Set root password
passwd

echo Uncomment the en_GB.UTF-8 UTF-8 in /etc/locale.gen
echo run locale-gen
echo Then reboot. You should get a working system.
