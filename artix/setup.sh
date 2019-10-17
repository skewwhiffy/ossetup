ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
rc-update add NetworkManager default

cp /etc/locale.gen /etc/locale.gen.backup
echo en_GB.UTF-8 UTF-8 > /etc/locale.gen
locale-gen
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

echo Set CLOCK to UTC in /etc/conf.d/hwclock
echo Then reboot. You should get a working system.
