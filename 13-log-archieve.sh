#!/bin/bash

source_dir=$1
destination_dir=$2
days=${3:-14}

if [ -z "$source_dir" ] || [ -z "$destination_dir" ]; then 
   echo "Ether source directory or destination directory is empty"
   echo "usage :$0 [source_dir] [destination_dir] [days:(default -14)]"
  exit 1
fi

if [ ! -d "$source_dir" ]; then
  echo "Source directory $source_dir does not  exist"
  exit 1
fi

if [ ! -d "$destination_dir" ]; then
  echo "Destination_dir $destination_dir does not  exist"
  exit 1
fi

FILE=$(find "$source_dir" -type f -name "*.log" -mtime +$days)

if [ -z "$FILE" ]; then
   echo "Log files older than 14 days not found, nothing to do"
   exit 1
if

while IFS= read -r FILE
do
  echo "$FILE"
done <<< "$FILE"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
ARCHIEVE_FILE="$DEST_DIR/logs-archieve-$TIMESTAMP.tar.gz"

tar -czvf $ARCHIEVE_FILE $FILES










