#!/bin/bash

echo -n 'enter file name='
read FILE_NAME

# -d => directory
# -f => file
# -e => either file or directory

if [ -f $FILE_NAME ]; then
	echo "file exists"
else
	echo "File does not exists."
fi

