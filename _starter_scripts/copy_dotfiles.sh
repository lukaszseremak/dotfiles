#!/usr/bin/env bash
set -eo pipefail

echo "Copy .config directory."
cat ${PWD%/*}"/.config/mimeapps.list" >~/.config/mimeapps.list
cat ${PWD%/*}"/.config/starship.toml" >~/.config/starship.toml
cp -r ${PWD%/*}"/.config/alacritty" ~/.config/
cp -r ${PWD%/*}"/.config/dunst" ~/.config/
cp -r ${PWD%/*}"/.config/fd" ~/.config/
cp -r ${PWD%/*}"/.config/gtk-3.0" ~/.config/
cp -r ${PWD%/*}"/.config/i3" ~/.config/
cp -r ${PWD%/*}"/.config/lf" ~/.config/
cp -r ${PWD%/*}"/.config/mpv" ~/.config/
cp -r ${PWD%/*}"/.config/nitrogen" ~/.config/
cp -r ${PWD%/*}"/.config/nvim" ~/.config/
cp -r ${PWD%/*}"/.config/picom" ~/.config/
cp -r ${PWD%/*}"/.config/polybar" ~/.config/
cp -r ${PWD%/*}"/.config/qt5ct" ~/.config/
cp -r ${PWD%/*}"/.config/rofi" ~/.config/
cp -r ${PWD%/*}"/.config/volumeicon" ~/.config/

echo 'Copy .bash files.'
cat ${PWD%/*}"/.bash_profile" >~/.bash_profile
cat ${PWD%/*}"/.bash_prompt" >~/.bash_prompt
cat ${PWD%/*}"/.bashrc" >~/.bashrc
cat ${PWD%/*}"/.dir_colors" >~/.dir_colors
cat ${PWD%/*}"/.profile" >~/.profile

echo 'Copy git files.'
cat ${PWD%/*}"/.gitconfig" >~/.gitconfig
cat ${PWD%/*}"/.gitignore_global" >~/.gitignore

echo 'Copy gtkrc-2.0 file.'
cat ${PWD%/*}"/gtkrc-2.0" >~/.gtkrc-2.0

echo 'Copy .npmrc file.'
cat ${PWD%/*}"/.npmrc" >~/.npmrc

echo 'Copy .direnvrc file.'
cat ${PWD%/*}"/.direnvrc" >~/.direnvrc

echo "Copy fonts."
sudo bash -c 'cp -r ${PWD%/*}"/.fonts/"* "/usr/share/fonts/"'

echo "Copy icons."
sudo bash -c 'cp -r ${PWD%/*}"/.icons/"* "/usr/share/icons/"'
fc-cache

echo "Copy .scripts directory."
cp -r ${PWD%/*}"/.scripts" ~/

echo "Copy scritps to local bin directory."
cp -r ${PWD%/*}"/.local/bin/"* ~/.local/bin/

echo "Copy custom themes directory."
cp -r ${PWD%/*}"/.themes/"* ~/.themes/

echo "Copy backgrounds."
sudo bash -c 'cp -r ${PWD%/*}"/.backgrounds/"* "/usr/share/backgrounds/"'
