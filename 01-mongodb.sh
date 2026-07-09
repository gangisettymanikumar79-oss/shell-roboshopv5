#!/bin/bash
source ./common.sh

check_root


cp mongo.repo /etc/yum.repos.d/mongo.repo
validate $? "Adding mongo.repo"

dnf install mongodb-org -y &>>$LOGS_FILE
validate $? "Installing MongoDB"

systemctl enable --now mongod
validate $? "Starting and enabling MongoDB"

sed -i s/127.0.0.1/0.0.0.0/g /etc/mongod.conf
validate $? "Allowing remote connections to MongoDB"

systemctl restart --now mongod
validate $? " Restarting MongoDB"

print_total_time









