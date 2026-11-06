#!/bin/sh

if [ $# -lt 2 ]
then
	echo "Wrong parameter number"
	exit 1
else
	FilesDir=$1
	SearchStr=$2
fi
if [ ! -d "$FilesDir" ]
then
	echo "Error : '$FilesDir' is not a valide directory on filesystem."
	exit 1
fi
NumberOfFiles=$(find "$FilesDir" -type f | wc -l)
NumberOfMatchingLines=$(grep -I -r "$SearchStr" "$FilesDir" | wc -l)
echo "The number of files are $NumberOfFiles and the number of matching lines are $NumberOfMatchingLines"
