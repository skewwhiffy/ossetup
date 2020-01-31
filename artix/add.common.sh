echo Installing yay
mkdir -p ~/code/aur
cd ~/code/aur
if [[ ! -d yay ]]; then
    git clone https://aur.archlinux.org/yay.git
fi
cd yay
makepkg -si --noconfirm

echo Installing the first few so that you can get on with other stuff.
yay -Syu --noconfirm yadm dropbox firefox neovim zsh keepassxc rhythmbox

echo Installing common stuff
yay -Syu --noconfirm tk inetutils gnome-disk-utility openssh wmctrl chromium usbutils \
	xclip code mame maven curl wget conky the_silver_searcher \
	noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra fzf \
	docker ttf-iosevka aic94xx-firmware wd719x-firmware jetbrains-toolbox \
	rtl88xxau-aircrack-dkms-git wkhtmltopdf-static docker-runit \
	spotify blockify zoom dbeaver postman wget curl chromium onedrive-abraunegg

echo Reboot. You should have quite a lot of your stuff setup now. See dev folder to set up dev tools.
