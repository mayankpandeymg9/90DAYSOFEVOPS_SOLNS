#!/bin/bash


# Prompt for input

echo "Enter the file path:"
read file_path
echo "Enter the username:"
read username
echo "Enter the perms (eg. rwx)"
read perms
sudo setfacl -m u:$username:$perms $file_path
echo "ACL permission ser successfully"
