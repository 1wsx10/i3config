#!/bin/bash
#brightness=4

C=$(sed -n 's/#brightness=//;2p' "$0")
N=$C

if [[ $1 == "up" ]]; then
	echo "up"
	N=$(dc -e "$C 1 +p")

elif [[ $1 == "down" ]]; then
	echo "down"
	N=$(dc -e "$C 1 -p")
fi

if [[ $N -gt 10 ]]; then
	N=10
elif [[ $N -lt 0 ]]; then
	N=0
fi

sed -i "2s/\(#brightness=\).*/\1$N/" "$0"
C=$(sed -n 's/#brightness=//;2p' "$0")
light -S "$(dc -e "$C"' d*p')"

L=$(light -G)
echo "Light: $L"
