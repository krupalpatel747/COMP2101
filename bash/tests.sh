#!/bin/bash
# This is a script to practice doing testing in bash scripts

# This section demonstrates file testing

# Test for the existence of the /etc/resolv.conf file
# TASK 1: Add a test to see if the /etc/resolv.conf file is a regular file
# TASK 2: Add a test to see if the /etc/resolv.conf file is a symbolic link
# TASK 3: Add a test to see if the /etc/resolv.conf file is a directory
# TASK 4: Add a test to see if the /etc/resolv.conf file is readable
# TASK 5: Add a test to see if the /etc/resolv.conf file is writable
# TASK 6: Add a test to see if the /etc/resolv.conf file is executable
test -e /etc/resolv.conf && echo "/etc/resolv.conf exists" || echo "/etc/resolv.conf does not exist"

#task 1 to 6 are below
test -f /etc/resolv.conf && echo "/etc/resolv.conf exists and its a reglar file" || echo "it is not a regular file"
test -h /etc/resolv.conf && echo "/etc/resolv.conf exists and is a symbolic link" || echo "file is not a symbolic link"
test -d /etc/resolv.conf && echo "/etc/resolv.conf exists and its a directory" || echo "file is not a directory"
test -r /etc/resolv.conf && echo "/etc/resolv.conf exists and it is redeable" || echo "file is not redeable"
test -w /etc/resolv.conf && echo "/etc/resolv.conf exists and it is writable" || echo "file is not writable"
test -x /etc/resolv.conf && echo "/etc/resolv.conf exists and it s executable" || echo "file is not executable"

# Tests if /tmp is a directory
# TASK 4: Add a test to see if the /tmp directory is readable
# TASK 5: Add a test to see if the /tmp directory is writable
# TASK 6: Add a test to see if the /tmp directory can be accessed

#task 4,5,6 are below
[ -d /tmp ] && echo "/tmp is a directory" || echo "/tmp is not a directory"
[ -r /tmp ] && echo "/tmp is redeable" || echo "/tmp is not redeable"
[ -w /tmp ] && echo "/tmp is writable" || echo "/tmp is not writable"
[ -x /tmp ] && echo "/tmp is executable" || echo "/tmp is not executable"


# Tests if one file is newer than another
# TASK 7: Add testing to print out which file newest, or if they are the same age

#task 7 is below
[ /etc/hosts -nt /etc/resolv.conf ] && echo "/etc/hosts is newer than /etc/resolv.conf"
[ /etc/hosts -ot /etc/resolv.conf ] && echo "/etc/resolv.conf is newer than /etc/hosts"
[ ! /etc/hosts -nt /etc/resolv.conf -a ! /etc/hosts -ot /etc/resolv.conf ] && echo "/etc/hosts is the same age as /etc/resolv.conf"
[ /etc/hosts -nt /etc/resolv.conf ] && echo "/etc/hosts is newes file" || echo ""/etc/resolv.conf is newest file


# this section demonstrates doing numeric tests in bash

# TASK 1: Improve it by getting the user to give us the numbers to use in our tests
# TASK 2: Improve it by adding a test to tell the user if the numbers are even or odd
# TASK 3: Improve it by adding a test to tell the user is the second number is a multiple of the first numbers

#task 1 to 3 is below
read -p "Give me a first number: " firstNumber
read -p "Give me a second number: " secondNumber
checkFirstnumber=$(( $firstNumber % 2))
checkSecondnumber=$(( $secondNumber % 2))
multiple=$(( $firstNumber % $secondNumber ))


[ $firstNumber -eq $secondNumber ] && echo "The two numbers are the same"
[ $firstNumber -ne $secondNumber ] && echo "The two numbers are not the same"
[ $firstNumber -lt $secondNumber ] && echo "The first number is less than the second number"
[ $firstNumber -gt $secondNumber ] && echo "The first number is greater than the second number"

[ $firstNumber -le $secondNumber ] && echo "The first number is less than or equal to the second number"
[ $firstNumber -ge $secondNumber ] && echo "The first number is greater than or equal to the second number"

#task 2
[ "$checkFirstnumber" = "0" ] && echo "the first number is even" || echo "the first number is odd"
[ "$checkSecondnumber" = "0" ] && echo "the secondNumber is even" || echo "the secondNumber is odd"

#task 3

[ "$multiple" = "0" ] && echo "firstnumber is multiple of second number" || echo "first number is not multiple of second number"

# This section demonstrates testing variables

# Test if the USER variable exists
# TASK 1: Add a command that prints out a labelled description of what is in the USER variable, but only if it is not empty
# TASK 2: Add a command that tells the user if the USER variable exists, but is empty

#task 1 and 2 are below
[ -v USER ] && echo "The variable SHELL exists"
[ -z $USER ] && echo "the variable is empty" || echo "the variable contains the username ,$USER"
[[ -v $USER  && -z $USER ]] && echo "the variable is exists but it is empty" || echo "the variable is exists but it is not empty"

# Tests for string data
# TASK 3: Modify the command to use the != operator instead of the = operator, without breaking the logic of the command
# TASK 4: Use the read command to ask the user running the script to give us strings to use for the tests

#task 3 and 4 are below
read -p "Give me a first string: " firstString
read -p "Give me a second string: " secondString
[ $firstString != $secondString ] && echo "$firstString is alphanumerically not equal to $secondString" || echo "$firstString is alphanumerically equal to $secondString"
