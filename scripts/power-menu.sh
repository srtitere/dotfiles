#!/bin/bash

# small power menu using rofi, i3, systemd and pm-utils
# (last 3 dependencies are adjustable below)
# tostiheld, 2016

logout() {
    case $DESKTOP_SESSION in
        i3)
            i3-msg exit
            ;;
        bspwm)
            bspc quit
            ;;
        *)
            0
            ;;
    esac
}

#with ligth-dm

poweroff_command="systemctl poweroff"
reboot_command="systemctl reboot"
logout_command="dm-tool switch-to-greeter"
#hibernate_command="systemctl hibernate"
suspend_command="systemctl suspend"
# lock_command="$HOME/scripts/fuzzy_lock.sh"
lock_command="dm-tool lock"
rofi_command="rofi -lines 5 -width 200"

options=$'poweroff\nreboot\nlogout\nsuspend\nlock'

eval "\$$(echo "$options" | $rofi_command -dmenu -p "")_command"
