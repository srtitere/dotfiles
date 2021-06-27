#! /usr/bin/bash

scripts=$(ls -xl $HOME/scripts/rofi_scripts/ | awk '{print $9}'| sed '1d')

selection=$(echo "$scripts" | rofi -dmenu -icon-theme Papirus)

echo "$selection"

bash -c "$HOME/scripts/rofi_scripts/$selection"
