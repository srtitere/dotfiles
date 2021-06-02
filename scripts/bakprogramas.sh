!# /usr/bin/sh

killall dunst ; dunst >/tmp/log-dunst 2>&1 &
killall compton ; compton -b >/tmp/log-compton 2>&1 &
killall nm-applet ; nm-applet >/tmp/log-nm-applet 2>&1 &
killall blueman-applet ; blueman-applet >/tmp/log-blueman-applet 2>&1 &
killall xfce4-power-manager ; xfce4-power-manager >/tmp/log-xfce4-power-manager 2>&1 &
killall autotiling ; ~/.local/bin/autotiling >/tmp/log-autotiling 2>&1 &
