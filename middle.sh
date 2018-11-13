#!/bin/bash
# only load rest of script if called via another script; user shouldn't run this script directly
# makes sure a path has been entered
if ! [[ $(echo "$1" | awk '/^[[:upper:]]{1}$/') ]]; then
	exit
fi

# save current node letter as something more readable
currentNode=$1

# # read & display the current scene text
cat "./txt/${currentNode}"
# #empty line after printing body of text
echo

# Scan choice file for possible middle commands and paths
# Won't run unless middle paths present in choice file
while read cmd node; do
# 	if not defined nextNode1 
	if [[ -z ${nextNode1} ]]; then
		nextNode1=${node}
	else
		nextNode2=${node}
	fi
done < <(awk /middle/ ./txt/${currentNode}C )

# Scan choice file for possible end command and ending path
# Won't run unless end paths present in choice file
while read cmd node; do
	# the current process is replaced with ./end.sh 
	# There might be a better way to run it in a new non-subshell but this good enough
	exec ./end.sh $currentNode
done < <(awk /end/ ./txt/${currentNode}C)

# :foreverloop
while [[ ${userInput} != ${nextNode1} && ${userInput} != ${nextNode2} ]]; do
	# The previous while loop seems to mess with default stream read uses
	# Explicitly read from stdin
	read userInput < /dev/tty
	# all choices coded into scenes are uppercase
	# convert userInput to all uppercase to do case-insensitive check
	userInput=${userInput^^}
	if [[ ${userInput} = ${nextNode1} ]]; then
		exec ./middle.sh ${nextNode1}
	elif [[ ${userInput} = ${nextNode2} ]]; then
		exec ./middle.sh ${nextNode2}
	else
		echo 'Only 2 paths are open before you, choose again.'
	fi
done 