#!/bin/bash
# only load rest of script if called via another script; user shouldn't run this script directly
if [[ -z "${1}" ]]; then
	exit 0
fi

cat "./txt/outro"
# enter blank line (most importantly a newline)
echo

while read userInput < /dev/tty; do
	# all choices coded into scenes are uppercase
	# convert userInput to all uppercase to do case-insensitive check
	userInput=${userInput^^}
	if [[ ${userInput^^} = 'E' ]]; then
		exit 0
	elif [[ ${userInput^^} = 'S' ]]; then
		clear
		exec ./start.sh
	else
		echo 'Only 2 paths are open before you, choose again.'
	fi
done 