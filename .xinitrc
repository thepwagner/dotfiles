if [[ "$(hostname)" == "picard" ]]; then
	xrandr --output DP-2 --pos 2688x0 --auto --output DP-4 --auto --scale 0.7x0.7 --pos 0x0
	synergyc 192.168.86.30 &
fi

compton &
feh --bg-scale ~/.wallpaper/80s-space.jpg
i3

