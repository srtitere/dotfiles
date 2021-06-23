#! /usr/bin/bash

theme=$(ls -l $HOME/.config/kitty/kitty-themes/themes/ | awk '{print $9}')

selection=$(echo "$theme" | rofi -dmenu -icon-theme Papirus)

echo "$selection"

cp "$HOME/.config/kitty/kitty-themes/themes/$selection" "$HOME/.config/kitty/theme.conf"
