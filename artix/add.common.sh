echo Installing yay
mkdir -p ~/code/aur
cd ~/code/aur
if [[ ! -d yay ]]; then
    git clone https://aur.archlinux.org/yay.git
fi
cd yay
makepkg -si --noconfirm --needed

echo Installing the first few so that you can get on with other stuff.
yay -Syu --noconfirm --needed yadm dropbox firefox neovim zsh keepassxc rhythmbox

echo Installing common stuff
yay -Syu --noconfirm --needed tk inetutils gnome-disk-utility openssh wmctrl chromium usbutils
yay -Syu --noconfirm --needed xclip code mame maven curl wget conky the_silver_searcher
yay -Syu --noconfirm --needed noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra fzf
yay -Syu --noconfirm --needed docker ttf-iosevka aic94xx-firmware wd719x-firmware jetbrains-toolbox
yay -Syu --noconfirm --needed rtl88xxau-aircrack-dkms-git wkhtmltopdf-static docker-runit
yay -Syu --noconfirm --needed zoom dbeaver postman wget curl chromium onedrive-abraunegg

echo Reboot. You should have quite a lot of your stuff setup now. See dev folder to set up dev tools.
