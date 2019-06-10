#!/bin/bash
#xinput enable

if [[ $1 != "set" ]]; then
	sed -i '2s/#xinput enable/#xinput TEMP/' "$0"
	sed -i '2s/#xinput disable/#xinput enable/' "$0"
	sed -i '2s/#xinput TEMP/#xinput disable/' "$0"
fi


#suppress normal output (printing everything), grab the second line, remove #, then print the second line
synclient "$(sed -n '2s/#//;2p' "$0")"
"$(sed -n '2s/#//;2p' "$0")" 'SynPS/2 Synaptics TouchPad'
