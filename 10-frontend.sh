#!/bin/bash

app_name=frontend

source ./common.sh
check_root

dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y
VALIDATE $? "installing nginx:24"

rm -rf /usr/share/nginx/html/* 

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip

cd /usr/share/nginx/html 
unzip /tmp/frontend.zip

rm -rf /etc/nginx/nginx.conf
VALIDATE $? "Removed Default conf"

cp $SCRIPT_DIR/nginx.conf /etc/nginx/nginx.conf
VALIDATE $? "Copied roboshop nginx conf"

systemctl restart nginx
systemctl enable nginx
 VALIDATE $? "Enable and restarted nginx"

print_total_time

