#! /usr/bin/bash

wallpapers=$(ls -l $HOME/wallpapers/ | awk '{print $9}')

selection=$(echo "$wallpapers" | rofi -dmenu -icon-theme Papirus)

echo "$selection"

feh --bg-scale "$HOME/wallpapers/$selection"
