sudo pacman -Syu --noconfirm
sudo pacman -Syu --noconfirm linux-headers nvidia terminator
sudo pacman -Syu --noconfirm lightdm lightdm-gtk-greeter lightdm-runit
sudo pacman -Syu --noconfirm i3 j4-dmenu-desktop pavucontrol
sudo ln -s /etc/runit/sv/lightdm /run/runit/service

echo Reboot. You should get a greeter. Login. Run add.common.sh to install common apps.
