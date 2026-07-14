#!/bin/bash

source_dir=$1
destination_dir=$2
days=${3:-14}

if [ -z "source_dir" ] || [ -z "destination_dir" ]; then 
   echo "Ether source directory or destination directory is empty"
   echo "usage :$0 [source_dir] [destination_dir] [days:(default -14)]"
  exit 1
fi

if [ ! -d "source_dir" ]; then
  echo "source directory :$source directory doesn't is exist"
  exit 1
fi

if [ ! -d "destination_dir" ]; then
  echo "destination_dir :$destination_dir doesn't is exist"
  exit 1
fi










