#!/bin/bash

 option=$(echo "        lock|      logout|       sleep|   power off|      reboot" | rofi -sep "|" -dmenu -i -p "" -auto-select -hide-scrollbar -monitor 0 -width 8 -lines 6 -location 3 -tokenize false -matching normal | xargs)

 case $option in
     lock) ./lock.sh;;
     logout) i3-msg exit;;
     sleep) systemctl suspend;;
     power\ off) systemctl poweroff;;
     reboot) systemctl reboot;;
 esac

 exit 0
                                                 
