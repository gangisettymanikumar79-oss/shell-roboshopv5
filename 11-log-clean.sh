#!/bin/bash

source_DIR=$1
Days=${2:-14}

if [ -z "$source_DIR" ]; then
    echo "missing parameter"
    echo "Usage: $0 <source_dir> [days (optional, default 14)]"
    exit 1
fi

if [ ! -d "$source_DIR" ]; then
    echo "ERROR: Directory $source_DIR does not exist"
    exit 1
fi

echo "Scanning $source_DIR for log files older than $Days days"

FILES=$(find "$source_DIR" -name "*.log" -mtime +"$Days")

if [ -z "$FILES" ]; then
    echo "No log files older than $Days days found"
    exit 0
fi

echo "$FILES" | while IFS= read -r FILE
do
    echo "File to be deleted: $FILE"
    rm -f "$FILE"
    echo "File $FILE deleted"
done

echo "Cleanup complete"



