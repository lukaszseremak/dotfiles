#!/usr/bin/env bash
set -eo pipefail

echo "Creating all folders."

[ -d $HOME"/.fonts" ] || mkdir -p $HOME"/.fonts"
[ -d $HOME"/.icons" ] || mkdir -p $HOME"/.icons"
[ -d $HOME"/.themes" ] || mkdir -p $HOME"/.themes"
[ -d $HOME"/Desktop" ] || mkdir -p $HOME"/Desktop"
[ -d $HOME"/Documents" ] || mkdir -p $HOME"/Documents"
[ -d $HOME"/Downloads" ] || mkdir -p $HOME"/Downloads"
[ -d $HOME"/Music" ] || mkdir -p $HOME"/Music"
[ -d $HOME"/Pictures" ] || mkdir -p $HOME"/Pictures"
[ -d $HOME"/Pictures/screenshots" ] || mkdir -p $HOME"/Pictures/screenshots"
[ -d $HOME"/Programs" ] || mkdir -p $HOME"/Programs"
[ -d $HOME"/Projects" ] || mkdir -p $HOME"/Projects"
[ -d $HOME"/Videos" ] || mkdir -p $HOME"/Videos"
[ -d /usr/share/backgrounds/ ] || sudo mkdir -p /usr/share/backgrounds/

echo "##################    Default folders created!    ##################"
