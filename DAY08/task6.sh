#!/bin/bash


#Bash script for listing all the file of an specific extension.



#This will read your extension
echo "Enter the Extension of the file:"
read ext


#No need to write any "There is no file with blah blah extension"
#ls will automatically show you the result
ls *$ext
