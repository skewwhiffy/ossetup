echo Installing yay
mkdir -p ~/code/aur
cd ~/code/aur
if [[ ! -d yay ]]; then
    git clone https://aur.archlinux.org/yay.git
fi
cd yay
makepkg -si --noconfirm

echo Installing essentials
yay -Syu --noconfirm yadm dropbox rhythmbox firefox wmctrl neovim xclip zsh keepassxc

echo Installing common utilities from AUR
yay -Syu --noconfirm docker ttf-iosevka aic94xx-firmware wd719x-firmware jetbrains-toolbox \
  rtl88xxau-aircrack-dkms-git spotblock-git wkhtmltopdf-static \
  spotify dbeaver zoom postman

echo Installing common utilities
sudo pacman -Syu --noconfirm tk inetutils gnome-disk-utility openssh chromium usbutils \
  code mame maven curl wget conky the_silver_searcher \
  noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra fzf

sudo groupadd docker
sudo usermod -aG docker kenny
systemctl --user enable spotblock

echo Reboot. You should have quite a lot of your stuff setup now. See dev folder to set up dev tools.
