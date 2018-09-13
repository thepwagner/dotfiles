if [[ "$(hostname)" == "picard" ]]; then
	xrandr --output DP-4 --pos 0x0 --auto --output HDMI-0 --auto --scale 0.7x0.7 --pos 2688x0x0x0x0
	synergyc 192.168.86.30 &
fi

compton &
feh --bg-scale ~/.wallpaper/80s-space.jpg
i3

