#!/usr/bin/bash

if [[ -d $HOME/.config/polybar ]] 
then

    cp -rf $HOME/.config/polybar $HOME/.config/polybar.bak
    cp -r ./config/polybar $HOME/.config/

else

    cp -r ./config/polybar $HOME/.config/

fi


if [[ -d $HOME/.config/i3 ]]
then

	cp -rf $HOME/.config/i3 $HOME/.config/i3.bak
	cp -r ./config/i3 $HOME/.config/

else

	cp -r ./config/i3 $HOME/.config/
fi

if [[ -d $HOME/.config/rofi ]]
then
	cp -rf $HOME/.config/rofi $HOME/.config/rofi.bak
	cp -r ./config/rofi $HOME/.config/

else

	cp -r ./config/rofi $HOME/.config/

fi

if [[ -d $HOME/.config/kitty ]]
then
	cp -rf $HOME/.config/kitty $HOME/.config/kitty.bak
	cp -r ./config/kitty  $HOME/.config/
else
	cp -r ./config/kitty  $HOME/.config/
fi