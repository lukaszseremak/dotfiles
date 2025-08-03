#!/usr/bin/env bash
set -eo pipefail

echo "Install packages using yay."
yay -S --needed \
	bat \
	imagemagick \
	acpi \
	acpid \
	alacritty \
	arandr \
	bind \
	brave-beta-bin \
	bridge-utils \
	brillo \
	btop \
	catppuccin-gtk-theme-mocha \
	chromium \
	cowsay \
	cmake \
	curl \
	dbus \
	diff-so-fancy \
	direnv \
	docker-compose \
	docker-ls \
	downgrade \
	dunst \
	exa \
	fd \
	filezilla \
	fzf \
	gimp \
	git \
    go \
    go-md2man \
	google-chrome \
	gtk3 \
	gtk4 \
	highlight \
	i3exit \
	imagemagick \
	imagewriter \
	ipython \
	jq \
	lazygit \
	libxcrypt-compat \
	lxappearance-gtk3 \
	lxinput-gtk3 \
	manjaro-pipewire \
	mariadb \
	meld \
	mpc \
	mpd \
	mpdris2 \
	mpv \
	msodbcsql17 \
	neofetch \
	ncmpcpp \
	neovim \
	neovim-symlinks \
	nitrogen \
	nodejs \
	noto-fonts-emoji \
	npm \
	ntfs-3g \
	netctl \
	openconnect \
	openresolv \
	openssh \
	openssl \
	pamixer \
	papirus-icon-theme \
	pavucontrol \
	picom-git \
	playerctl \
	polybar \
	postgresql \
	prettier \
	python-pip \
	python-pynvim \
	python-pyodbc \
	qt5ct \
	qt5-styleplugins \
	ripgrep \
	rofi \
	rsync \
	rust \
	screenfetch \
	scrot \
	shfmt \
	sof-firmware \
	sshpass \
	starship \
	stylua \
	subliminal \
	terraform \
	the_silver_searcher \
	ttf-dejavu \
	unixodbc \
	unrar \
	unzip \
	wget \
	wireless-regdb \
	wireless_tools \
	xclip \
	xdg-dbus-proxy \
	xfce4-power-manager \
	yad \
	yarn \
	zathura \
	zathura-cb \
	zathura-djvu \
	zathura-pdf-mupdf \
	zathura-ps \
	zip

echo 'Setting papirus-folders!'
yay -S papirus-folders-catppuccin-git
papirus-folders -C cat-mocha-blue --theme Papirus-Dark

echo 'Setting  Catppuccin for Cursors!'
yay -S catppuccin-cursors-mocha

echo 'Enable MPD service.'
systemctl --user enable --now mpd.service
systemctl --user enable --now mpDris2.service

echo "Install nautilus with gadgets."
yay -S nautilus nautilus-open-any-terminal
echo "Set alacritty as a nautilus context menager."
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true

echo 'Upgrade pip version.'
yay -S python-pip

echo 'Install pyenv.'
curl https://pyenv.run | bash

echo 'Install pipx.'
python -m pip install --user pipx
python -m pipx ensurepath

echo 'Upgrade pipx version.'
yay -S python-pipx

echo 'Install python required packages using pipx.'
python -m pipx install --force 'python-lsp-server[all]'
python -m pipx install --force Django
python -m pipx install --force autoflake
python -m pipx install --force black
python -m pipx install --force completions
python -m pipx install --force djhtml
python -m pipx install --force doq
python -m pipx install --force flake8
python -m pipx install --force httpie
python -m pipx install --force invoke
python -m pipx install --force isort
python -m pipx install --force pipenv
python -m pipx install --force poetry
python -m pipx install --force pycodestyle
python -m pipx install --force pylint
python -m pipx install --force pyright
python -m pipx install --force tldr
python -m pipx install --force tox
python -m pipx install --force yapf

echo 'Install nvim required packages.'
yay -S python-pynvim
npm config set prefix '~/.local/'
npm i -g bash-language-server
npm i -g neovim

echo 'Add user to video group.'
sudo usermod -aG video $USER

echo 'Remove redundant files'
sudo rm -f /usr/bin/blurlock

echo 'Fetching background.'
[ -d $HOME"/.backgrounds" ] || mkdir -p $HOME"/.backgrounds"
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=129WQiUWVXEGdS_cwiTl79XycG7xFUP1O' -O $HOME"/.backgrounds/wallhaven-0wppgx.png"

echo "##################    Core software installed.    ##################"

