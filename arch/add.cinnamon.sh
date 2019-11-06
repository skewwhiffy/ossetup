sudo pacman -Syu --noconfirm
sudo pacman -Syu --noconfirm linux-headers nvidia terminator
sudo pacman -Syu --noconfirm lightdm lightdm-gtk-greeter
sudo pacman -Syu --noconfirm cinnamon
sudo systemctl enable lightdm

echo Reboot. You should get a greeter. Login. Run add.common.sh to install common apps.
