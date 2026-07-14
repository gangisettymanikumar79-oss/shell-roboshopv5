#!/bin/bash

Disk_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=10

while IFS= read -r line 

do
   USAGE=$(echo "$line" | awk '{print $5}' | cut -d "%" -f1)
   PARTITION=$( echo $line | awk '{print $7}' )
if [ "$USAGE" -ge "$USAGE_THRESHOLD"]; then
   MESSAGE+="High Disk Usage on $PARTITION: $USAGE <br>"
   fi
done <<<"$Disk_USAGE"

echo "$Message"


