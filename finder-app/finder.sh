#!/bin/bash

# Check the number of arguments passed to the bash script and proceed if they are two

if [ "$#" -ne 2 ]
then
	echo "Error: Number of arguments is incorrect"
	exit 1
fi


filesdir=$1
searchstr=$2
# check that filesdir is a valid directory

if [ ! -d "$filesdir" ]
then
	echo "Error: $filesdir is not a valid directory"
	exit 1
fi

# return the number of files in filesdir and the number of matching text

total_files=$(find "$filesdir" -type f | wc -l)
total_matches=$(grep -r "$searchstr" "$filesdir" | wc -l)


# Print a message to display number of files and number of matching lines

echo "The number of files are $total_files and the number of matching lines are $total_matches"



