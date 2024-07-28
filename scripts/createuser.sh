#!/bin/bash
# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

#Prompt for the username
read -p "Enter the name of the new user: " USERNAME

# Check if a username was provided
if [ -z "$USERNAME" ]; then
  echo "No username provided. Exiting." >&2
  exit 1
fi

#Create the new user 
useradd -m $USERNAME

#Set a password
passwd $USERNAME

#Add the user to the sudoers file using a temporary file and visudo
TEMPFILE=$(mktemp)
cp /etc/sudoers $TEMPFILE
echo "${USERNAME} ALL=(ALL:ALL) ALL" >> $TEMPFILE

#Check the syntax of the updated file
visudo -cf $TEMPFILE > /dev/null
if [ $? -eq 0 ]; then
  cp $TEMPFILE /etc/sudoers
  echo "User $USERNAME has been added to the sudoers file."
else
  echo "Error: Invalid syntax in the sudoers file." >&2
  exit 1
fi

rm -f $TEMPFILE
