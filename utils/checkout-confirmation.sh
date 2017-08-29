#!/bin/bash

read -n 1 -r -p "Discarding changes for file \"$CURRENT_EDITING_FILE\"? [y/N] " input

case $input in
	[yY][eE][sS]|[yY])
		if $IS_CURRENTLY_EDITING_FILE_UNTRACKED; then
			rm "$CURRENT_EDITING_FILE"
		else # tracked
			git checkout -- "$CURRENT_EDITING_FILE"
		fi
		;;
	*)
		# take anything else as a no
		;;
esac
