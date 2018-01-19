#!/bin/bash

# Variables
USERS_DATA_FILE="users.dat"
GENERATED_FOLDER="config"
GENERATED_POSTFIX_ACCOUNTS_FILE="$GENERATED_FOLDER/postfix-accounts.cf"

echo "hola"
exit 2
# Remove data from previous runs
rm -Rf $GENERATED_FOLDER

# Verify if user file exist
if [ ! -f $USERS_DATA_FILE ]; then
    echo "`date '+%Y-%m-%d %H:%M:%S'` [WARN]: User data file does not exist, create one like user_example.dat with name users.dat"
    exit -1
fi

# Generate structure
if [ ! -d $GENERATED_FOLDER ]; then
    mkdir $GENERATED_FOLDER
fi

# Start execution
echo "`date '+%Y-%m-%d %H:%M:%S'` [INFO]: Generating config for tvial/docker-mailserver docker..."

touch $GENERATED_POSTFIX_ACCOUNTS_FILE
for USER_DATA in `cat $USERS_DATA_FILE | grep -v '#'`
do
    USER_DATA_ARR=(${USER_DATA//|/ })
    MAIL_USER=${USER_DATA_ARR[0]}
    MAIL_PASS=${USER_DATA_ARR[1]}

    if [ -z $MAIL_PASS ]; then
        echo "`date '+%Y-%m-%d %H:%M:%S'` [WARN]: Bad line: $USER_DATA_ARR"
    else
        echo "`date '+%Y-%m-%d %H:%M:%S'` [INFO]: Generating config for user $MAIL_USER..."
        docker run --rm -e MAIL_USER=$MAIL_USER -e MAIL_PASS=$MAIL_PASS -ti tvial/docker-mailserver:latest /bin/sh -c 'echo "$MAIL_USER|$(doveadm pw -s SHA512-CRYPT -u $MAIL_USER -p $MAIL_PASS)"' >> $GENERATED_POSTFIX_ACCOUNTS_FILE
    fi
done

POSTFIX_ACCOUNTS=`cat $GENERATED_POSTFIX_ACCOUNTS_FILE | wc -l | sed 's/ //g'`

if [ $POSTFIX_ACCOUNTS -gt 0 ]; then
    echo "`date '+%Y-%m-%d %H:%M:%S'` [INFO]: Generating DKIM config..."
    docker run --rm -v "$(pwd)/$GENERATED_FOLDER":/tmp/docker-mailserver -ti tvial/docker-mailserver:latest generate-dkim-config
else
    echo "`date '+%Y-%m-%d %H:%M:%S'` [WARN]: No postfix accounts created, so no create DKIM config"
    exit -1
fi

exit 1