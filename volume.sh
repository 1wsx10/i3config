#!/bin/sh
#volume=5

C=$(sed -n 's/#volume=//;2p' "$0")
N=$C

# raise or lower value
if [ "$1" = "up" ]; then
	echo "up"
	N=$(dc -e "$C 1+p")

elif [ "$1" = "down" ]; then
	echo "down"
	N=$(dc -e "$C 1-p")

elif [ "$1" = "mute" ]; then
	pamixer -t
fi


# make sure it doesn't go out of bounds
if [ "$N" -gt 10 ]; then
	N=10
elif [ "$N" -lt 0 ]; then
	N=0
fi

sed -i "2s/\(#volume=\).*/\1$N/" "$0"
C=$(sed -n 's/#volume=//;2p' "$0")
pamixer --set-volume "$(dc -e "$C 10*p")"

