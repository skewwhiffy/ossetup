yay --noconfirm --needed -Syu
yay --noconfirm --needed -Syu linux-headers nvidia terminator \
  xorg gnome gnome-extra chrome-gnome-shell
sudo systemctl enable gdm

echo Reboot. You should get a greeter. Login. Run add.common.sh to install common apps.
