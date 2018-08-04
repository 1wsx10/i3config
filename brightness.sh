#!/bin/bash
#brightness=5

C=$(sed -n 's/#brightness=//;2p' $0)
N=$C

if [[ $1 == "up" ]]; then
	echo "up"
	N=$(expr $C + 1)

elif [[ $1 == "down" ]]; then
	echo "down"
	N=$(expr $C - 1)
fi

if [[ $N -gt 10 ]]; then
	N=10
elif [[ $N -lt 0 ]]; then
	N=0
fi

sed -i "2s/\(#brightness=\).*/\1$N/" $0
C=$(sed -n 's/#brightness=//;2p' $0)
light -S $(expr $C \* $C)

L=$(light -G)
echo "Light: $L"
