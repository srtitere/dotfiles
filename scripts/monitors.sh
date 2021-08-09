#!/usr/bin/bash

r=$(echo -e "Portátil\nHDMI\nDoble\narandr" | rofi -dmenu -p "Selecciona entrada")

case "$r" in
    Portátil) ~/.screenlayout/1monitor.sh ; ~/.config/polybar/launch.sh ;;
    HDMI) ~/.screenlayout/1monitorhdmiI.sh ; ~/.config/polybar/launch.sh ;;
    Doble) ~/.screenlayout/2monitoresExtIntel.sh  ; ~/.config/polybar/launch.sh ;;
    arandr) arandr ; ~/.config/polybar/launch.sh ;;
    *) echo "$r no es una opcion existente (Portátil|HDMI|Doble|arandr)" ;;
esac

feh --bg-scale "$HOME/wallpapers/5k007.jpg"
