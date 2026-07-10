#!/bin/bash

$source_DIR=$1
days={3:-14}

if [ -z "$source_DIR" ]; then
    echo "missing parameter"
    echo "Usage: $0 <source_dir> [days :-14]" #default value the code
    exit 1
fi
if [ ! -d "$source_DIR" ]; then
    echo "ERROR : Directory:$source_DIR doesnot exit code"
    exit 1
fi




