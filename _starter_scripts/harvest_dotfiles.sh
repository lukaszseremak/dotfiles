#!/usr/bin/env bash
set -eo pipefail

echo '##################    Harvesting files...    ##################'

echo "Harvest .config directory."
cat ~/.config/mimeapps.list > ${PWD%/*}"/.config/mimeapps.list"
cp -r ~/.config/alacritty ${PWD%/*}"/.config/"
cp -r ~/.config/dunst ${PWD%/*}"/.config/"
cp -r ~/.config/fd ${PWD%/*}"/.config/"
cp -r ~/.config/gtk-3.0 ${PWD%/*}"/.config/"
cp -r ~/.config/gtk-4.0 ${PWD%/*}"/.config/"
cp -r ~/.config/lf ${PWD%/*}"/.config/"
cp -r ~/.config/picom ${PWD%/*}"/.config/"
cp -r ~/.config/polybar ${PWD%/*}"/.config/"
cp -r ~/.config/qt5ct ${PWD%/*}"/.config/"
cp -r ~/.config/rofi ${PWD%/*}"/.config/"
cp -r ~/.config/volumeicon ${PWD%/*}"/.config/"
rsync -a ~/.config/nvim ${PWD%/*}"/.config/" --exclude plugin

echo "Harvest .i3 directory."
cp -r ~/.i3  ${PWD%/*}"/"

echo 'Harvest .bash files.'
cat ~/.bash_profile > ${PWD%/*}"/.bash_profile"
cat ~/.bash_prompt > ${PWD%/*}"/.bash_prompt"
cat ~/.bashrc > ${PWD%/*}"/.bashrc"
cat ~/.dir_colors > ${PWD%/*}"/.dir_colors"
cat ~/.profile > ${PWD%/*}"/.profile"

echo 'Harvest git config files.'
cat ~/.gitconfig > ${PWD%/*}"/.gitconfig"
cat ~/.gitignore > ${PWD%/*}"/.gitignore_global"

echo 'Harvest gtkrc-2.0 file.'
cat ~/.gtkrc-2.0 > ${PWD%/*}"/gtkrc-2.0"

echo "Harvest fonts."
cp -r /usr/share/fonts/DaddyTimeMono ${PWD%/*}"/.fonts/"
cp -r /usr/share/fonts/Feather ${PWD%/*}"/.fonts/"
cp -r /usr/share/fonts/fontawesome ${PWD%/*}"/.fonts/"

echo "Harvest icons."
cp -r /usr/share/icons/fontawesome ${PWD%/*}"/.icons/"

echo "Harvest custom themes."
cp -r ~/.themes/ ${PWD%/*}"/"

echo "Harvest .scripts directory."
cp -r ~/.scripts ${PWD%/*}"/"

echo "Harvest custom scritps from .local/bin directory."
cp ~/.local/bin/blurlock ${PWD%/*}"/.local/bin/blurlock"
cp ~/.local/bin/changevolume ${PWD%/*}"/.local/bin/changevolume"
cp ~/.local/bin/lfrun ${PWD%/*}"/.local/bin/lfrun"
cp ~/.local/bin/screenshot ${PWD%/*}"/.local/bin/screenshot"
