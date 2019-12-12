echo Installing yay
mkdir -p ~/code/aur
cd ~/code/aur
if [[ ! -d yay ]]; then
    git clone https://aur.archlinux.org/yay.git
fi
cd yay
makepkg -si

echo Installing common utilities
sudo pacman -Syu --noconfirm tk inetutils gnome-disk-utility openssh firefox neovim wmctrl chromium usbutils
sudo pacman -Syu --noconfirm xclip code zsh keepassxc mame maven curl wget conky the_silver_searcher
sudo pacman -Syu --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra fzf

echo Installing common utilities from AUR
yay -Syu --noconfirm yadm docker ttf-iosevka aic94xx-firmware wd719x-firmware jetbrains-toolbox 
yay -Syu --noconfirm dropbox rtl88xxau-aircrack-dkms-git wkhtmltopdf-static docker-runit
# Spotify Zoom DBeaver Postman

echo Reboot. You should have quite a lot of your stuff setup now. See dev folder to set up dev tools.
