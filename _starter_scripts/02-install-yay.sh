#!/usr/bin/env bash
set -eo pipefail

package="yay"

if pacman -Qi $package &> /dev/null; then
    echo "##################    "$package" is already installed.    ##################"

else
    sudo pacman -S --needed git base-devel

    [ -d /tmp/yay ] && rm -rf /tmp/yay
    mkdir /tmp/yay

    git clone https://aur.archlinux.org/yay.git /tmp/yay

    cd /tmp/yay
    makepkg -si --noconfirm
    [ -d /tmp/yay ] && rm -rf /tmp/yay

    if pacman -Qi $package &> /dev/null; then
        yay --devel --timeupdate --sudoloop --answerclean All --answeredit None --answerdiff None --useask --removemake --redownload --rebuildall --save
        echo "##################    "$package" has been installed.    ##################"
    else
        echo "!!!!!!!!!!!!!!!!!!    "$package" has NOT been installed.    !!!!!!!!!!!!!!!!!!"
    fi
fi

echo "Adding options to Pacman conf file."
sed '/UseSyslog/s/^#//' -i /etc/pacman.conf
sed '/Color/s/^#//' -i /etc/pacman.conf
sed '/CheckSpace/s/^#//' -i /etc/pacman.conf
sed '/VerbosePkgLists/s/^#//' -i /etc/pacman.conf
