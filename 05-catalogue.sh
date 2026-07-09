#!/bin/bash
app_name=catalogue
source ./common.sh
check_root

app_name=catalogue
app_setup
nodejs_setup
systemd_setup





cp $SCRIPT_DIR/mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "Adding mongo.repo"

dnf install mongodb-mongosh -y
VALIDATE $? "Installed MongoDB client "

INDEX=$(mongosh --host mongodb.manikumar.online --eval 'db.getMongo().getDBNames().indexOf("catalogue")')

if [ $INDEX -lt 0 ]; then

   mongosh --host mongodb.manikumar.online </app/db/master-data.js 
    VALIDATE $? "Load Products"
else
   echo -e "Products already loaded ... $YELLOW SKIPPING $NC"

fi


app_restart
print_total_time



