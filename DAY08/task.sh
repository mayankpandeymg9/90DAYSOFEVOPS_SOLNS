#!/bin/bash
###########################


#this file describes Comments,Echo,Variables,and WildCards


echo "This is the Start of the file"

echo "Sum task"

#Enter the number of you choice
#read function reads the value for the variable
echo "Enter first number:"
read var1

echo "Enter Second number:"
read var2

#when declaring variable like below make sure the '=' is attached to the variable as the compiler can take it as a command when written in space.
sum=$((var1 + var2))

echo "SUM of $var1 and $var2 is : $sum"

