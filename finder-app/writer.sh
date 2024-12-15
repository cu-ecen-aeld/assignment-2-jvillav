#!/bin/sh

if [ $# -ne 2 ]; then
	echo "Invalid number of parameters given"
	echo "Usage: $0 <directory> <search string>"
	exit 1
fi

writefile=$1
writestr=$2

# check if the file path is valid by using `touch`
# if the file path given is valid it will update the timestamp
# or create the file, if there's a permission issue or the
# path is not valid it will return an error

dir_name=$(dirname "$writefile")

echo "Output directory: $dir_name"

if [ ! -d $dir_name ]; then
	echo "Creating directory"
	# Ensure that all the file structure is created
	retval=$(mkdir -p "$dir_name" 2>&1)
	echo $retval
else
	echo "Directory found"
fi

if [ $? -ne 0 ]; then
	echo "Error creating $dir_name"
	exit 1
fi

retval=$(touch "$writefile" 2>&1)

if [ $? -ne 0 ]; then

	echo "The given path $writefile is not valid"
	echo "Failed with the following error:"
	echo $retval
else
	echo "File $writefile created"
fi



echo $writestr > $writefile
