#!/usr/bin/env bash
set -eo pipefail

declare -a packages=(
    "zsh"
)
for package in ${packages[@]}; do
  echo $str
  if pacman -Qs $package > /dev/null ; then
    echo "The package $package is installed. Trying to remove it."
    if yay -R $package ; then
      echo "Removing was succeeded."
    else
      echo "Remove failed."
    fi
  else
    echo "The package $package is not installed."
  fi
done
