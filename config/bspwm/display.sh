#! /bin/bash

num_monitors=$(xrandr --listmonitors | grep + | cut -d " " -f6 | wc -l)

case $num_monitors in
    1)
        bspc monitor -d I II III IV V VI VII VIII IX
        ;;
    2)
        primary=$(xrandr --listmonitors | grep 0: | cut -d " " -f6)
        secondary=$(xrandr --listmonitors | grep 1: | cut -d " " -f6)
        bspc monitor $primary -d I II III IV
        bspc monitor $secondary -d V VI VII VIII IV
        ;;
    *)
        bspc monitor -d I II III IV V VI VII VIII IX
        ;;
esac
