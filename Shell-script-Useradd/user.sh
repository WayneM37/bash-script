#!/bin/bash

if [[ "${UID}" -ne 0 ]]
then
   echo 'Please run this script with sudo or as root.'
   exit 1
fi

read -p "Enter a user name: " USER_NAME
read -p "Enter your name: " COMMENT
read -sp "Enter passowrd: " PASSWORD

useradd -c "$COMMENT" -m $USER_NAME

if [[ $? -ne 0 ]]
then 
    echo "The account could not be created"
    exit 1
fi

#echo $PASSWORD | passwd --stdin $USER_NAME   #for Amazon linux 2 İmages.

echo ${USER_NAME}:${PASSWORD} | /usr/sbin/chpasswd   # for ubuntu

if [[ $? -ne 0 ]]
then
  echo 'The password for the account could not be set.'
  exit 1
fi

passwd -e $USER_NAME

# Display the username, password, and the host where the user was created.

echo "$USER_NAME"
echo "$PASSWORD"

