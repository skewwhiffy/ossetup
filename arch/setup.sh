ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc

cp /etc/locale.gen /etc/locale.gen.backup
echo en_GB.UTF-8 UTF-8 > /etc/locale.gen
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
echo KEYMAP=uk > /etc/vconsole.conf
echo kenny-linux > /etc/hostname
echo 127.0.0.1 localhost >> /etc/hosts
echo ::1 localhost >> /etc/hosts
echo 127.0.1.1 kenny-linux.localdomain kenny-linux >> /etc/hosts

systemctl enable dhcpcd

mkinitcpio -P
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

echo Adding user kenny
useradd -m kenny
groupadd sudo
usermod -aG sudo kenny
echo Set password for kenny
passwd kenny

echo Set root password
passwd

echo Reboot. You should get a working system. Run add.cinnamon.sh to install a Cinnamon desktop.
