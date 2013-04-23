userresources=$HOME/.Xresources
if [ -f $userresources ]; then
xrdb -merge $userresources
fi
xrandr -s 1920x1200 
xrandr --dpi 96
xset r rate 250 40
dwm
