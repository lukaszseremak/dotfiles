#!/usr/bin/env bash
set -eo pipefail

package="yay"

if pacman -Qi $package &>/dev/null; then
	echo "##################    "$package" is already installed.    ##################"

else
	sudo pacman -S --needed git base-devel

	[ -d /tmp/yay ] && rm -rf /tmp/yay
	mkdir /tmp/yay

	git clone https://aur.archlinux.org/yay.git /tmp/yay

	cd /tmp/yay
	makepkg -si --noconfirm
	[ -d /tmp/yay ] && rm -rf /tmp/yay

	if pacman -Qi $package &>/dev/null; then
		echo "##################    "$package" has been installed.    ##################"
	else
		echo "!!!!!!!!!!!!!!!!!!    "$package" has NOT been installed.    !!!!!!!!!!!!!!!!!!"
	fi
fi

yay --devel --timeupdate --sudoloop --answerclean All --answeredit None --answerdiff None --useask --removemake --redownload --rebuildall --save
echo "Adding options to Pacman conf file."
sudo sed '/UseSyslog/s/^#//' -i /etc/pacman.conf
sudo sed '/Color/s/^#//' -i /etc/pacman.conf
sudo sed '/CheckSpace/s/^#//' -i /etc/pacman.conf
sudo sed '/ParallelDownloads/s/^#//' -i /etc/pacman.conf
sudo sed '/VerbosePkgLists/s/^#//' -i /etc/pacman.conf
sudo sed '/VerbosePkgLists/s/ILoveCandy//' -i /etc/pacman.conf
