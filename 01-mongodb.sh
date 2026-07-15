#!/bin/bash
source ./common.sh

check_root


cp mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $?  "Adding mongo.repo"

dnf install mongodb-org -y &>>$LOGS_FILE
VALIDATE $? "Installing MongoDB"

systemctl enable --now mongod
VALIDATE $? "Starting and enabling MongoDB"

sed -i s/127.0.0.1/0.0.0.0/g /etc/mongod.conf
VALIDATE $? "Allowing remote connections to MongoDB"

systemctl restart --now mongod
VALIDATE $? " Restarting MongoDB"


print_total_time










