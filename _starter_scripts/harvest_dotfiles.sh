#!/usr/bin/env bash
set -eo pipefail

echo '##################    Harvesting files...    ##################'

echo "Harvest .config directory."
cat ~/.config/mimeapps.list >${PWD%/*}"/.config/mimeapps.list"
cat ~/.config/starship.toml >${PWD%/*}"/.config/starship.toml"
rsync -avhr ~/.config/Kvantum ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/alacritty ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/bat ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/btop ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/dunst ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/fd ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/gtk-3.0 ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/i3 ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/lf ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/mpDris2 ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/mpd ${PWD%/*}"/.config/" --exclude 'log' --exclude 'state' --delete
rsync -avhr ~/.config/mpv ${PWD%/*}"/.config/" --exclude watch_later --delete
rsync -avhr ~/.config/ncmpcpp ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/nitrogen ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/nvim ${PWD%/*}"/.config/" --exclude plugin --delete
rsync -avhr ~/.config/picom ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/polybar ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/qt5ct ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/rofi ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/volumeicon ${PWD%/*}"/.config/" --delete
rsync -avhr ~/.config/zathura ${PWD%/*}"/.config/" --delete

echo 'Harvest .bash files.'
cat ~/.bash_profile >${PWD%/*}"/.bash_profile"
cat ~/.bashrc >${PWD%/*}"/.bashrc"
cat ~/.profile >${PWD%/*}"/.profile"

echo 'Harvest git config files.'
cat ~/.gitconfig >${PWD%/*}"/.gitconfig"
cat ~/.gitignore >${PWD%/*}"/.gitignore_global"

echo 'Harvest gtkrc-2.0 file.'
cat ~/.gtkrc-2.0 >${PWD%/*}"/gtkrc-2.0"

echo 'Harvest npmrc file.'
cat ~/.npmrc >${PWD%/*}"/.npmrc"

echo 'Harvest .direnvrc file.'
cat ~/.direnvrc >${PWD%/*}"/.direnvrc"

echo "Harvest fonts."
rsync -avhr /usr/share/fonts/DaddyTimeMono ${PWD%/*}"/.icons/DaddyTimeMono" --delete
rsync -avhr /usr/share/fonts/Feather ${PWD%/*}"/.icons/Feather" --delete
rsync -avhr /usr/share/fonts/fontawesome ${PWD%/*}"/.icons/fontawesome" --delete

echo "Harvest icons."
rsync -avhr ~/.icons/ ${PWD%/*}"/.icons" --delete

echo "Harvest custom themes."
rsync -avhr ~/.themes/ ${PWD%/*}"/.themes" --delete

echo "Harvest .scripts directory."
rsync -avhr ~/.scripts/ ${PWD%/*}"/.scripts" --delete

echo "Harvest custom scritps from .local/bin directory."
cp ~/.local/bin/blurlock ${PWD%/*}"/.local/bin/blurlock"
cp ~/.local/bin/changebrightness ${PWD%/*}"/.local/bin/changebrightness"
cp ~/.local/bin/changevolume ${PWD%/*}"/.local/bin/changevolume"
cp ~/.local/bin/lfrun ${PWD%/*}"/.local/bin/lfrun"
cp ~/.local/bin/papirus-folders ${PWD%/*}"/.local/bin/papirus-folders"
cp ~/.local/bin/screenshot ${PWD%/*}"/.local/bin/screenshot"
cp ~/.local/bin/vpn_wrapper ${PWD%/*}"/.local/bin/vpn_wrapper"
cp ~/.local/bin/wifimenu ${PWD%/*}"/.local/bin/wifimenu"
