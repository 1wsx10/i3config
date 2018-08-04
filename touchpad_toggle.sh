#!/bin/bash
#TouchpadOff=1

if [[ $1 != "set" ]]; then
	sed -i '2s/#TouchpadOff=1/#TouchpadOff=TEMP/' $0
	sed -i '2s/#TouchpadOff=0/#TouchpadOff=1/' $0
	sed -i '2s/#TouchpadOff=TEMP/#TouchpadOff=0/' $0
fi


#suppress normal output (printing everything), grab the second line, remove #, then print the second line
synclient $(sed -n '2s/#//;2p' "$0")
