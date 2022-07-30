# Homebrew

`xcode-select --install`
`install.homebrew.sh`

# Terminal

```
brew install --cask iterm2
brew install --cask dropbox
brew install --cask firefox
brew install --cask keepassxc
```

# DisplayLink

https://synaptics.com/products/displaylink-graphics/downloads/macos

# Set up terminal

* Log into Firefox
* Change default browser
    
```
ssh-keygen
```

* Add to GH
* Add this config to `~/.ssh/config`

```
Host github.com
  Hostname ssh.github.com
  Port 443
```

* Then

```
brew install neovim
brew install tmux
brew install fish
```

* Make `fish` the default shell by editing `/etc/shells`
* Reboot

```
brew install yadm
yadm clone git@github.com:skewwhiffy/yadm
fisher update
node --version
npm i -g nodemon
```

# CLI applications

```
brew install mysql-client
```

# Desktop applications

```
brew install --cask dropbox
brew install --cask firefox
brew install --cask google-chrome
brew install --cask docker
brew install --cask dbeaver-community
brew install --cask karabiner-elements
brew install --cask neovide
brew install --cask nordvpn
brew install --cask rectangle
brew install --cask slack
brew install --cask visual-studio-code
brew install --cask zoom
```