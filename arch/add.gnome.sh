echo This currently doesn't work. Why? Who knows?

sudo pacman -Syu
sudo pacman -Syu linux-headers nvidia terminator \
  xorg gnome gnome-extra
sudo systemctl enable gdm

echo Reboot. You should get a greeter. Login. Run add.common.sh to install common apps.
