#!/bin/bash

source ./common.sh
check_root

cp RabbitMQ.repo /etc/yum.repos.d/RabbitMQ.repo
VALIDATE $? "Adding RabbitMQ.repo"

dnf install rabbitmq-server -y    &>> $LOGS_FILE
VALIDATE $? "installing rabbitmq-server "   &>> $LOGS_FILE

systemctl enable rabbitmq-server  &>> $LOGS_FILE
systemctl start rabbitmq-server   &>> $LOGS_FILE

VALIDATE $? "enanle and start rabbitmq-server " 
rabbitmqctl add_user roboshop roboshop123        &>> $LOGS_FILE

rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"  &>> $LOGS_FILE
VALIDATE $? "setting up username and password"
print_total_time



