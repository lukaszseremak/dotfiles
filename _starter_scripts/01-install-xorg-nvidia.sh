#!/usr/bin/env bash
set -eo pipefail

echo "This is the opensource driver for nvidia"
echo " Xserver setup"

sudo pacman -S xorg-server xorg-apps xorg-xinit xorg-twm xterm --noconfirm --needed
sudo pacman -S xf86-video-nouveau --noconfirm --needed

echo "###################   xorg for nvidia installed.  ######################"
