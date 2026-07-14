#!/bin/bash

Disk_usage=$(df -hT | grep -v Filesystem)

while IFS= read -r line 

do
   echo "$line"

done <<<"$Disk_usage"


