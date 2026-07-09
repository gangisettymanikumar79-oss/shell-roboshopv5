
#!/bin/bash
LOGS_FOLDER="/var/log/roboshop"
sudo mkdir -p $LoGS_FOLDER
sudo chown -R ec2-user:ec2-user $LoGS_FOLDER
sudo chmod -R 755 $LoGS_FOLDER
LoGS_FILE="$LOGS_FOLDER/$0.log"

USERID=$(id -u)

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
NC='\e[0m' # No Color (Reset)
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

echo -e "$TIMESTAMP [INFO] Script started"

check_root(){
    if [ $USERID -ne 0 ]; then
        echo -e "$TIMESTAMP [ERROR] $R Please run this script with root access $N" | tee -a $LOGS_FILE
        exit 1
    fi
}

if [ $USERID -ne 0 ]; then
 echo "$timestamp [ERROR] $G please run this script with root access $N" | tee -a $LOGS_FILE
        exit 1
fi
validate(){
    if [ $1 -ne 0 ]; then
        echo -e "$timestamp [ERROR] $2..............$B FAILURE $N" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$timestamp [INFO] $2..............$B SUCCESS  $N"  | tee -a $LOGS_FILE
    fi
}

print_total_time(){
    echo -e "$TIMESTAMP [INFO] Script executed in $G $SECONDS seconds $N"
}