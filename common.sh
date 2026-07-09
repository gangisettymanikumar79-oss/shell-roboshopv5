
#!/bin/bash
LOGS_FOLDER="/var/log/roboshop"
sudo mkdir -p $LoGS_FOLDER
sudo chown -R ec2-user:ec2-user $LOGS_FOLDER
sudo chmod -R 755 $LOGS_FOLDER
LOGS_FILE="$LOGS_FOLDER/$0.log"
SCRIPT_DIR=$PWD

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
VALIDATE(){
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

app_setup(){
    id roboshop
if [ $? -ne 0 ];then
 
   useradd --system --home /app --shell /sbin/nologin --comment "roboshop system user" roboshop
       VALIDATE $? "createing roboshop system user"
else
    echo -e "system user roboshop alredy create......$BLUE Skipping $NC"
fi
rm -rf /app
VALIDATE $? "Removing existing code"

rm -rf /tmp/$app_name.zip
VALIDATE $? "Removed $app_name zip"

mkdir -p  /app 
VALIDATE $? "createing app directory"

curl -o /tmp/$app_name.zip https://roboshop-artifacts.s3.amazonaws.com/$app_name-v3.zip 
cd /app 
unzip /tmp/$app_name.zip

}

nodejs_setup(){

dnf module disable nodejs -y
dnf module enable nodejs:20 -y

dnf install nodejs -y
VALIDATE $? "installing nodejs:20"

npm install 
VALIDATE $? "Installing dependencies "

}

systemd_setup(){

    cp $SCRIPT_DIR/$app_name.service /etc/systemd/system/$app_name.service
    VALIDATE $? "Created systemctl service"

    systemctl daemon-reload
    systemctl enable $app_name 
    VALIDATE $? "Enabling $app_name"


}

app_restart(){
    systemctl restart $app_name
    VALIDATE $? "$app_name restarting"

}