#!/bin/bash

source ./common.sh

check_root

dnf module disable redis -y
dnf module enable redis:7 -y

dnf install redis -y 
validate $? "installing redis :7"

sed -i -e 's/127.0.0.1/0.0.0.0/g' -e '/protected-mode/c protected-mode no' /etc/redis/redis.conf    
validate $? "Allowing remote connections"

systemctl enable redis 
systemctl start redis 
validate $? "starting redius"
print_total_time


