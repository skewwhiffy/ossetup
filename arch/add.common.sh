echo Installing yay
mkdir -p ~/code/aur
cd ~/code/aur
if [[ ! -d yay ]]; then
    git clone https://aur.archlinux.org/yay.git
fi
cd yay
makepkg -si

echo Installing common utilities from AUR
yay -Syu yadm docker ttf-iosevka aic94xx-firmware wd719x-firmware jetbrains-toolbox 
yay -Syu dropbox rtl88xxau-aircrack-dkms-git spotblock-git wkhtmltopdf-static
sudo groupadd docker
sudo usermod -aG docker kenny
systemctl --user enable spotblock

echo Installing common utilities
sudo pacman -Syu tk inetutils gnome-disk-utility openssh firefox neovim wmctrl chromium usbutils
sudo pacman -Syu xclip code flatpak zsh keepassxc mame maven curl wget conky the_silver_searcher
sudo pacman -Syu noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra fzf

echo Installing some flatpaks
flatpak install flathub com.spotify.Client us.zoom.Zoom io.dbeaver.DBeaverCommunity com.getpostman.Postman

echo Reboot. You should have quite a lot of your stuff setup now. See dev folder to set up dev tools.
