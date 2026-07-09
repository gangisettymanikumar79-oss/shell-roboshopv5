#!/bin/bash

source ./common.sh
check_root

cp RabbitMQ.repo /etc/yum.repos.d/RabbitMQ.repo
validate $? "Adding RabbitMQ.repo"

dnf install rabbitmq-server -y
validate $? "installing rabbitmq-server "

systemctl enable rabbitmq-server
systemctl start rabbitmq-server

validate $? "enanle and start rabbitmq-server "
rabbitmqctl add_user roboshop roboshop123

rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
validate $? "setting up username and password"
print_total_time


