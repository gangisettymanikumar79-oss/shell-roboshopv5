#!/bin/bash
source ./common.sh
check_root

dnf install mysql-server -y
validate $? "installing mysql-server"

systemctl enable mysqld
systemctl start mysqld  
 validate $? "enable and start mysqld"
mysql_secure_installation --set-root-pass RoboShop@1
validate $? "setting up root password"

print_total_time

