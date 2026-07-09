#!/bin/bash
source ./common.sh
check_root

dnf install mysql-server -y  &>> $LOGS_FILE
validate $? "installing mysql-server"

systemctl enable mysqld  &>> $LOGS_FILE
systemctl start mysqld   &>> $LOGS_FILE
 validate $? "enable and start mysqld"
mysql_secure_installation --set-root-pass RoboShop@1
validate $? "setting up root password"

print_total_time


