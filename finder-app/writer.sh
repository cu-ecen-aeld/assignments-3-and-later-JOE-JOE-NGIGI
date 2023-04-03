#!/bin/bash


# Check if no arguments are available and return error
# store arguments in variables

# Path to file is $1, text to write is $2
writefile=$1
writestr=$2

# Check if supplied arguments are 2, if not return error
if [ $# -ne 2 ] 
then
	echo "Please specify required arguments!"
	exit 1
fi

mkdir -p "$(dirname $writefile)" && touch "$writefile"

if ! [ -f $writefile ]
then
	echo "File could not be created"
	exit 1
fi 

echo $writestr > $writefile



