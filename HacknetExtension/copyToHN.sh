#!/bin/bash
#TODO: Make this POSIX-compliant.
#
#
#Current challenges:
# [ == ] isn't POSIX
# read -n isn't POSIX
#
#Notes:
# Yes I know that I'm using [[ ]], which is not POSIX
# But if I'm already falling back on bash, then I might
# as well use all of the features.

ourdir="$(readlink -f "$(dirname "$0")")"
if [[ -z "$1" ]]; then
	if [[ -z "$XDG_DATA_HOME" ]]; then
		XDG_DATA_HOME="$HOME/.local/share"
	fi
	STEAMAPPSDIR="$XDG_DATA_HOME/Steam/steamapps/common"
else
	STEAMAPPSDIR="$1"
fi
printf "steamapps/common directory has been set to: %s.\nIs this correct? " "$STEAMAPPSDIR"
read -n 1 input
printf "\n"
if [[ "$input" == "y" ||  "$input" == "Y" ]]; then
	cp -r -v "$ourdir/ISOLATE" "$STEAMAPPSDIR/Hacknet/Extensions"
	printf "Extension has been copied to Hacknet's directory succesfully.\n"
else
	printf "Please re-run this script with the proper steamapps/common directory as the first argument.\n"
fi
