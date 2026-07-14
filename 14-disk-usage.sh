#!/bin/bash

Disk_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read -r line 

do
   echo "$line"

done <<<"$Disk_USAGE"


