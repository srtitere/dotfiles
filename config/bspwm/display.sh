#! /bin/bash

num_monitors=$(xrandr --listmonitors | grep + | cut -d " " -f6 | wc -l)

case $num_monitors in
    1)
        bspc monitor -d 1 2 3 4 5 6 7 8 9
        ;;
    2)
        primary=$(xrandr --listmonitors | grep 0: | cut -d " " -f6)
        secondary=$(xrandr --listmonitors | grep 1: | cut -d " " -f6)
        bspc monitor $primary -d 1 2 3 4
        bspc monitor $secondary -d 5 6 7 8 9
        ;;
    *)
        bspc monitor -d 1 2 3 4 5 6 7 8 9
        ;;
esac
