#!/bin/bash

# Get disk usage
# Remove from output, and lines with Filesystem, tmpfs and cdrom using grep.
# Any thing you like filtered out should be done with the grep function
# awk to reorder the columns
# Finally a while loop to determine percentages

df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
	echo $output
	usep=$(echo $output | awk '{ print $1 }' | cut -d'%' -f1 )
	partition=$(echo $output | awk '{ print $2 }' )
	if [ $usep -ge 90 ]; then
		echo "Running out of space on \"$partition ($usep%)\" on $(hostname) as on $(date)"
	fi
done

