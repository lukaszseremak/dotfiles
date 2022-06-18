#!/usr/bin/env bash
set -eo pipefail

echo "Install packages using yay."
yay -S --needed \
	alacritty \
	arandr \
	aritim-dark-gtk-git \
	bind \
	brave-browser-beta \
	chromium \
	cmake \
	curl \
	direnv \
	dbus \
	docker-compose \
	downgrade \
	dunst \
	dunstify \
	evince \
	fd \
	filezilla \
	flake8 \
	fzf \
	ipython \
	gimp \
	git \
	google-chrome-beta \
	highlight \
	htop \
	i3-gaps \
	imagemagick \
	imagewriter \
	jq \
	lazygit \
	libcurl-gnutls \
	lxappearance-gtk3 \
	manjaro-pipewire \
	meld \
	msodbcsql \
	neofetch \
	neovim \
	neovim-symlinks \
	nitrogen \
	nodejs \
	notepadqq \
	npm \
	openssh \
	papirus-icon-theme \
	picom-git \
	playerctl \
	polybar \
	prettier \
	python-black \
	python-pip \
	python-pycodestyle \
	python-pyodbc \
	python-pylint \
	python-pynvim \
	qt5ct \
	ripgrep \
	rofi \
	screenfetch \
	scrot \
	shfmt \
	sof-firmware \
	sshpass \
	stylua \
	teams \
	the_silver_searcher \
	unixodbc \
	unrar \
	unzip \
	vlc \
	volumeicon \
	wget \
	yarn \
	zip \
	starship

echo "Install nautilus with gadgets."
yay -S nautilus nautilus-open-any-terminal
echo "Set alacritty as a nautilus context menager."
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true

echo "Install lf with gadgets."
yay -S --needed \
	bat \
	catdoc \
	chafa \
	docx2txt \
	ffmpegthumbnailer \
	gnome-epub-thumbnailer \
	gnumeric \
	imagemagick \
	lf \
	odt2txt \
	perl-image-exiftool \
	poppler \
	transmission-cli \
	transmission-gtk \
	wkhtmltopdf

echo "Install and config bluetooth."
yay -S bluez bluez-utils
modprobe btusb
sudo systemctl start --now bluetooth.service
sudo systemctl enable bluetooth.service
if grep -Fxq "AutoEnable=true" /etc/bluetooth/main.conf; then
	echo "bluetooth is auto enabled."
else
	echo "auto enabling bluetooth."
	echo 'AutoEnable=true' | sudo tee -a /etc/bluetooth/main.conf
fi

echo 'Install pipenv.'
sudo -H pip install -U pipenv

echo 'Install pyenv.'
curl https://pyenv.run | bash

echo 'Install pipx.'
pip install --user pipx
pipx ensurepath

echo 'Install nvim required packages.'
pip install --user djhtml
pip install --user doq
pip install --user pynvim
pip install --user pyright
pip install 'python-lsp-server[all]'
sudo npm i -g bash-language-server
sudo npm i -g neovim

echo "##################    Core software installed.    ##################"
