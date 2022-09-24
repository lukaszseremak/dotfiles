#! /bin/bash

light_blue='\033[1;34m'
light_purple='\033[1;35m'
bold=$(tput bold)
animal="vader"

# clear
echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n${light_purple}"
for file in "$@"; do
	file_name=$(basename "$file")

	if [ -d "$file" ]; then
		file_icon=""
	else
		case "${file_name##*.}" in
		sh) file_icon="" ;;
		svg | png | jpg | JPG) file_icon="" ;;
		*) file_icon="" ;;
		esac
	fi

	echo -e "$file_icon $file_name $(du -sh "$file" | awk '{print $1}')"
done | cowsay -f "$animal" -n

echo -e "${light_blue}"
read -p "${bold}Do you want to delete it? [y/n]: " -n1 ans

[ "$ans" = "y" ] && rm -rf "$@"
