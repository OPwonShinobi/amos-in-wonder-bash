#!/bin/bash
echo 'Please maximize window for best viewing experience.'
# # enlarge cmd window to full screen if is not already
cat "./txt/intro"
# # empty line after printing body of text
echo

# # scan choice file for possible middle commands and paths
while read cmd node; do
# 	if not defined nextNode1 
	if [[ -z ${nextNode1} ]]; then
		nextNode1=${node}
	else
		nextNode2+=${node}
	fi
done < <(awk /middle/ ./txt/introC)

# foreverloop
while [[ ${userInput} != ${nextNode1} && ${userInput} != ${nextNode2} ]]; do
	# The previous while loop seems to mess with default stream read uses
	# Explicitly read from stdin
	read userInput < /dev/tty
	# all choices coded into scenes are uppercase
	# convert userInput to all uppercase to do case-insensitive check
	userInput=${userInput^^}
	if [[ ${userInput} = ${nextNode1} ]]; then
		# the current process is replaced with ./middle.sh 
		# There might be a better way to run ./middle.sh in a new non-subshell but its good enough
		exec ./middle.sh ${nextNode1}
	elif [[ ${userInput} = ${nextNode2} ]]; then
		exec ./middle.sh ${nextNode2}
	else
		echo 'Only 2 paths are open before you, choose again.'
	fi
done 