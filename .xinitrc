if [[ "$(hostname)" == "picard" ]]; then
	xrandr --output DP-4 --pos 0x0 --auto --output HDMI-0 --auto --scale 0.7x0.7 --pos 2688x0x0x0x0
fi

if command -v vmware-user > /dev/null 2>&1; then
    vmware-user &
fi

compton &
i3

