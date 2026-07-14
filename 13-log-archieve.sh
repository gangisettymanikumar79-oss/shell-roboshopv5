#!/bin/bash

source_dir=$1
dest_dir=$2
days=${3:-14}
if [ -z "source_dir" ] || if [ -z "dest_dir" ]; then
   echo "ether sourece directory or destination directory or empty"
   echo "usage: $0 [source_dir] [dest_dir] [days:default 14]"
   exit 1
fi
# Check source directory exists

if [ ! -d "source_dir" ]; then
  echo "source directory : $source_dir doesn't is empty"
  exit 1
fi
# Check destination directory exists

if [ ! -d "dest_dir" ]; then
  echo "dest_dir : $dest_dir doesn't is empty"
  exit 1
fi

echo "Source Directory      : $source_dir"
echo "Destination Directory : $destination_dir"
echo "Days                  : $days"





