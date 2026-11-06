#!/bin/sh

if [ $# -lt 2 ]
then
	echo "Error: the number of arguments must be 2"
	exit 1
fi

WriteFile=$1
WriteStr=$2
WriteDir=$(dirname "$WriteFile")
if [ ! -d "$WriteDir" ]
then
	mkdir -p "$WriteDir"
	if [ $? -ne 0 ]
	then
		ehco "Error: folder '$WriteDir' cannot be created"
		exit 1
	fi
fi
echo "$WriteStr" > "$WriteFile"

if [ $? -ne 0 ]
then
	echo "Error: Could not write to file '$WriteFile'"
fi
