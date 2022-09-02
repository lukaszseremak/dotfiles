#!/usr/bin/env bash
set -eo pipefail

echo "Install packages using yay."
yay -S --needed \
	acpi \
	acpid \
	alacritty \
	arandr \
	bind \
	brave-beta-bin \
	bridge-utils \
	brillo \
	chromium \
	cmake \
	curl \
	dbus \
	diff-so-fancy \
	direnv \
	docker-ls \
	downgrade \
	dunst \
	evince \
	exa \
	fd \
	filezilla \
	fzf \
	gimp \
	git \
	go-md2man \
	google-chrome \
	gssproxy \
	gtk3 \
	gtk4 \
	highlight \
	htop \
	i3exit \
	imagemagick \
	imagewriter \
	ipython \
	jq \
	lazygit \
	libcurl-gnutls \
	libproxy \
	lxappearance-gtk3 \
	lxinput-gtk3 \
	meld \
	msodbcsql17 \
	manjaro-pipewire \
	mpv \
	neofetch \
	neovim \
	neovim-symlinks \
	nitrogen \
	nodejs \
	notepadqq \
	noto-fonts-emoji \
	npm \
	ntfs-3g \
	openssh \
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
	xclip \
	xdotool \
	xdg-dbus-proxy \
	xfce4-power-manager \
	yad \
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
	ueberzug \
	wkhtmltopdf

echo 'Upgrade pip version.'
pip install --upgrade pip

echo 'Install pyenv.'
curl https://pyenv.run | bash

echo 'Install pipx.'
python -m pip install --user pipx
python -m pipx ensurepath

echo 'Upgrade pipx version.'
python -m pip install --user -U pipx

echo 'Install python required packages using pipx.'
python -m pipx install --force 'python-lsp-server[all]'
python -m pipx install --force Django
python -m pipx install --force autoflake
python -m pipx install --force black
python -m pipx install --force completions
python -m pipx install --force djhtml
python -m pipx install --force docker-compose
python -m pipx install --force doq
python -m pipx install --force flake8
python -m pipx install --force httpie
python -m pipx install --force isort
python -m pipx install --force pipenv
python -m pipx install --force poetry
python -m pipx install --force pycodestyle
python -m pipx install --force pylint
python -m pipx install --force pyright
python -m pipx install --force tox
python -m pipx install --force tldr
python -m pipx install --force yapf

echo 'Install nvim required packages.'
pip install --user pynvim
npm config set prefix '~/.local/'
npm i -g bash-language-server
npm i -g neovim

echo 'Add user to video group.'
sudo usermod -aG video $USER

echo 'Remove redundant files'
sudo rm -f /usr/bin/blurlock

echo "##################    Core software installed.    ##################"
