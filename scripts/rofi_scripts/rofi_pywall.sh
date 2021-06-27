#! /usr/bin/bash

select=$(printf 'Light\nDark' | rofi -dmenu)

case $select in
    Light)
         themes=$(wal --theme | awk 'BEGIN{ light=0}  $1 ~/Light/{ light=1; } $1 ~/Extra/{light=0}; {if (light==1) {print $2}}' | sed '1d')
         ;;
    Dark)
	themes=$(wal --theme | awk 'BEGIN{ light=0}  $1 ~/Light/{ light=1; } {if (light==0) {print $2}}' | sed '1d' )
	;;
    *)
	exit 0
	;;
esac
# echo $themes
selection=$(echo "$themes" | rofi -dmenu)

# echo "$selection"

case $select in
    Light)
       wal --theme $selection -l
       ;;
    Dark)
	wal --theme $selection
     	;;
    *)
	exit 0
	;;
esac
