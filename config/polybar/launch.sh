#!/usr/bin/env bash

# Author:
#     Sergio Quijano Rey
#     sergiquijano@gmail.com
# Description:
#     Launcher for polybar
#     Code from https://github.com/polybar/polybar/wiki
# Version:
#     v1.0 - 23/08/2020 - First documented version

# Parameters
#===============================================================================
if [[ $DESKTOP_SESSION == "i3" ]]
then
   bar_name="main"
else
   bar_name="main-b"
fi
echo $bar_name
# Terminate already running bar instances
killall -q polybar

# Launch polybar on all monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
    # -r means that changes to the config file are applied without the need of reloading the program
    MONITOR=$m polybar -r $bar_name >>/tmp/mybar.log 2>&1 & disown
done
