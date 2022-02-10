#!/usr/bin/env bash
set -eo pipefail

#software from 'normal' repositories
sudo pacman -S --noconfirm --needed \
	arandr \
	cmake \
	curl \
	dbus \
	downgrade \
	dunst \
	dunstify \
	evince \
	filezilla \
	gimp \
	git \
	htop \
	imagemagick \
	meld \
	nitrogen \
	papirus-icon-theme \
	screenfetch \
	scrot \
	unrar \
	unzip \
	vlc \
	wget \
	zip

echo "Install packages using yay."
yay -S --needed \
	alacritty \
	aritim-dark-gtk-git \
	brave-browser-beta \
	chromium \
	docker-compose \
	fd \
	flake8 \
	fzf \
	google-chrome-beta \
	highlight \
	i3-gaps \
	libcurl-gnutls \
	lxappearance-gtk3 \
	manjaro-pipewire \
	neofetch \
	neovim \
	neovim-symlinks \
	nodejs \
	notepadqq \
	npm \
	openssh \
	picom-git \
	playerctl \
	polybar \
	prettier \
	python-black \
	python-pip \
	python-pycodestyle \
	python-pylint \
	python-pynvim \
	qt5ct \
	ripgrep \
	rofi \
	shfmt \
	sof-firmware \
	sshpass \
	stylua \
	teams \
	the_silver_searcher \
	unixodbc \
	volumeicon \
	yarn

echo "Install nautilus with gadgets."
yay -S nautilus nautilus-open-any-terminal
echo "Set alacritty as a nautilus context menager."
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true

echo "Install lf with gadgets."
yay -S lf ffmpegthumbnailer imagemagick poppler gnome-epub-thumbnailer wkhtmltopdf bat chafa catdoc docx2txt odt2txt gnumeric perl-image-exiftool transmission-gtk transmission-cli

echo "Install and config bluetooth."
yay -S bluez bluez-utils
modprobe btusb
sudo systemctl start --now bluetooth.service
sudo systemctl enable bluetooth.service
sudo cat <<END >/etc/bluetooth/main.conf
AutoEnable=True
END

echo 'Install and set virtualenv.'
python -m pip install --user virtualenv

echo 'Install pipenv.'
sudo -H pip install -U pipenv

echo 'Install pyenv.'
curl https://pyenv.run | bash

echo 'Install nvim required packages.'
pip install --user pynvim
pip install --user doq
pip install --user pyright
pip install --user djhtml
pip install 'python-lsp-server[all]'
sudo npm i -g neovim
sudo npm i -g bash-language-server

echo "##################    Core software installed.    ##################"
