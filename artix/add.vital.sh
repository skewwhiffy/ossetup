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
