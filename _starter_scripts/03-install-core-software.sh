#!/usr/bin/env bash
set -eo pipefail

#software from 'normal' repositories
sudo pacman -S --noconfirm --needed arandr cmake curl downgrade dbus dunst dunstify evince filezilla gimp git htop
sudo pacman -S --noconfirm --needed imagemagick meld nitrogen papirus-icon-theme scrot screenfetch vlc wget

# installation of zippers and unzippers
sudo pacman -S --noconfirm --needed unrar zip unzip

alias yay="yay --devel --timeupdate --sudoloop --answerclean All --answeredit None --answerdiff None --useask"

yay -S alacritty
yay -S ripgrep
yay -S aritim-dark-gtk-git
yay -S picom-git
yay -S i3-gaps

yay -S nautilus nautilus-open-any-terminal
echo "Set alacritty as a nautilus context menager."
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true

yay -S lxappearance-gtk3
yay -S polybar
yay -S rofi
yay -S neovim python-pynvim neovim-symlinks
yay -S brave-browser-beta
yay -S chromium
yay -S google-chrome-beta
yay -S neofetch
yay -S notepadqq
yay -S openssh
yay -S teams
yay -S unixodbc
yay -S manjaro-pipewire
yay -S sof-firmware
yay -S nodejs
yay -S npm
yay -S yarn
yay -S fd
yay -S prettier
yay -S stylua

echo "Install lf with gadgets."
yay -S lf ffmpegthumbnailer imagemagick poppler gnome-epub-thumbnailer wkhtmltopdf bat chafa catdoc docx2txt odt2txt gnumeric perl-image-exiftool transmission-gtk transmission-cli

yay -S volumeicon
yay -S python-pip playerctl python-pylint flake8 python-pycodestyle highlight python-black
yay -S the_silver_searcher
yay -S docker-compose
yay -S libcurl-gnutls
yay -S spotify
yay -S qt5ct
yay -S sshpass

yay -S bluez bluez-utils
modprobe btusb
sudo systemctl start --now bluetooth.service
sudo systemctl enable bluetooth.service
sudo cat << END > /etc/bluetooth/main.conf
AutoEnable=True
END

yay -S polybar-spotify

echo 'Install and set virtualenv.'
python -m pip install --user virtualenv

echo 'Install pipenv.'
sudo -H pip install -U pipenv

echo 'Install pyenv.'
curl https://pyenv.run | bash
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
exec $SHELL

echo 'Install vim required packages.'
pip install pynvim
pip install --user doq
pip install --user pyright
pip install 'python-lsp-server[all]'
sudo npm i -g neovim
sudo npm i -g bash-language-server

echo 'Install fzf.'
[ -d ~/.fzf ] || ( git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install )

echo "##################    Core software installed.    ##################"

