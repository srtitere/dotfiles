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

if [[ -d $HOME/.config/bspwm ]]
then

	cp -rf $HOME/.config/bspwm $HOME/.config/bspwm.bak
	cp -r ./config/bspwm $HOME/.config/

else

	cp -r ./config/bspwm $HOME/.config/
fi

if [[ -d $HOME/.config/sxhkd ]]
then

	cp -rf $HOME/.config/sxhkd $HOME/.config/sxhkd.bak
	cp -r ./config/sxhkd $HOME/.config/

else

	cp -r ./config/sxhkd $HOME/.config/
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

if [[ -f $HOME/.config/compton.conf ]]
then
	cp -rf $HOME/.config/compton.conf $HOME/.config/compton.conf.bak
	cp -r ./compton/compton.conf $HOME/.config/
else
	cp -r ./compton/compton.conf $HOME/.config/ 
fi

if [[ -f $HOME/.Xresources ]]
then
    cp -rf $HOME/.Xresources $HOME/.Xresources$(date +"%Y-%m-%d-%H-%M%S").bak
    cp -r .Xresources $HOME/.Xresources
else
    cp -r .Xresources $HOME/.Xresources
fi

if [[ -f $HOME/.profile ]]
then
    cp -rf $HOME/.profile $HOME/.profile$(date +"%Y-%m-%d-%H-%M%S").bak
    cp -r .profile $HOME/.profile
else
    cp -r .profile $HOME/.profile
fi

if [[ -d $HOME/scripts ]]
then
    cp -rf $HOME/scripts $HOME/scripts$(date +"%Y-%m-%d-%H-%M%S").bak
    cp -r ./scripts $HOME/
else
    cp -r ./scripts $HOME/
fi

if [[ -d $HOME/.cache/wal ]]
then
    cp -rf $HOME/.cache/wal_$(date +"%Y-%m-%d-%H-%M%S").bak
    cp -r ./cache/wal $HOME/.cache/
else
    mkdir -p $HOME/.cache
    cp -r ./cache/wal $HOME/.cache/
fi

cp -rf .fonts $HOME/
