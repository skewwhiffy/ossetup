sudo pacman -Syu
sudo pacman -Syu linux-headers nvidia
sudo pacman -Syu lightdm lightdm-gtk-greeter
sudo pacman -Syu cinnamon
sudo systemctl enable lightdm

echo Reboot. You should get a greeter. Login. Run add.common.sh to install common apps.
