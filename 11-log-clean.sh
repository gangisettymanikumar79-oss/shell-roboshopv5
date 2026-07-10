#!/bin/bash

source_DIR=$1
days={3:-14}

if [ -z "$source_DIR" ]; then
    echo "missing parameter"
    echo "Usage: $0 <source_dir> [days(optional default to 14]" #default value the code
    exit 1
fi
if [ ! -d "$source_DIR" ]; then
    echo "ERROR : Directory:$source_DIR doesnot exit code"
    exit 1
fi

echo "Scanning $SOURCE_DIR for log files older than 14 days"
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)


if [ -z "$FILS" ]; then

   echo "No log files older than 14 days found"
    exit 0

fi

while IFS= read -r line
do
   echo "File to be deleted: $FILE"
   rm-f $FILE
   echo "File $FILE deleted"

done




