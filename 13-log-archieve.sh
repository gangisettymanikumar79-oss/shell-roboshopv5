#!/bin/bash

source_dir=$1
destination_dir=$2
days=${3:-14}

# Check arguments
if [ -z "$source_dir" ] || [ -z "$destination_dir" ]; then
    echo "Either source directory or destination directory is missing."
    echo "Usage: $0 <source_dir> <destination_dir> [days (default: 14)]"
    exit 1
fi

# Check source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Source directory '$source_dir' does not exist."
    exit 1
fi

# Check destination directory exists
if [ ! -d "$destination_dir" ]; then
    echo "Destination directory '$destination_dir' does not exist."
    exit 1
fi

echo "Source Directory      : $source_dir"
echo "Destination Directory : $destination_dir"
echo "Days                  : $days"








