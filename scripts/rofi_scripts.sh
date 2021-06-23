#! /usr/bin/bash

scripts=$(ls -l $HOME/scripts/rofi_scripts/ | awk '{print $9}')

selection=$(echo "$scripts" | rofi -dmenu -icon-theme Papirus)

echo "$selection"

bash -c "$HOME/scripts/rofi_scripts/$selection"
