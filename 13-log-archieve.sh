#!/bin/bash

source_dir=$1
destion_dir=$2
Days={3:-14}
if [ -z "source_dir" ] || if [ -z "destion_dir" ]; then
   echo "ether sourece directory or destion directory or empty"
   echo "usage: $0 [source_dir] [dest_dir] [days:default 14]"
   exit 1
fi

if [ -d "source_dir" ]; then
  echo "source directory : $source_dir doesn't is empty"
  exit 1
fi

if [ -d "destion_dir" ]; then
  echo "destion_dir : $destion_dir doesn't is empty"
  exit 1
fi

