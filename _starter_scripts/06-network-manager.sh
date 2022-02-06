#!/usr/bin/env bash
set -eo pipefail

echo "##################    Installing Network management.    ##################"

sudo pacman -S networkmanager --noconfirm --needed
sudo pacman -S network-manager-applet --noconfirm --needed
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

echo "##################    Network management software installed!    ##################"
