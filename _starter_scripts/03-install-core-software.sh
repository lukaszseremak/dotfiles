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
	dbus \
	direnv \
	docker-compose \
	downgrade \
	dunst \
	dunstify \
	evince \
	fd \
	filezilla \
	fzf \
	gimp \
	git \
	google-chrome-beta \
	highlight \
	htop \
	i3-gaps \
	imagemagick \
	imagewriter \
	ipython \
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
	python-pip \
	python-pynvim \
	python-pyodbc \
	qt5ct \
	ripgrep \
	rofi \
	screenfetch \
	scrot \
	shfmt \
	sof-firmware \
	sshpass \
	starship \
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
	zip

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

echo 'Upgrade pip version.'
pip install --upgrade pip

echo 'Install pyenv.'
curl https://pyenv.run | bash

echo 'Install pipx.'
pip install --user pipx
pipx ensurepath

echo 'Upgrade pipx version.'
python -m pip install --user -U pipx

echo 'Install python required packages using pipx.'
pipx install --force 'python-lsp-server[all]'
pipx install --force black
pipx install --force completions
pipx install --force djhtml
pipx install --force doq
pipx install --force flake8
pipx install --force pipenv
pipx install --force poetry
pipx install --force pycodestyle
pipx install --force pylint
pipx install --force pyright
pipx install --force tox

echo 'Install nvim required packages.'
pip install --user pynvim
sudo npm i -g bash-language-server
sudo npm i -g neovim

echo "##################    Core software installed.    ##################"
