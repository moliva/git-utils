#!/bin/bash

read -n 1 -r -p "Reseting file \"$CURRENT_EDITING_FILE\"? [y/N] " input

case $input in
	[yY][eE][sS]|[yY])
		git checkout -- "$CURRENT_EDITING_FILE"
		;;
	*)
		;;
esac
