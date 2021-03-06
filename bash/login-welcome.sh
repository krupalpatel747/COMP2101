#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############

user="krupal patel"
hostname=$HOSTNAME
#a command for printing a day like sunday....
day=$(date '+%A')
#a command for the time
time=$(date '+%H:%M')
###############
# Main        #
###############
#setting the different title according to day
test $day = Monday && title="today's temprature is 21"
test $day = Tuesday && title="today's temprature is 22"
test $day = Wednesday && title="today's temprature is 23"
test $day = Thursday && title="today's temprature is 24"
test $day = Friday && title="today's temprature is 25"
test $day = Saturday && title="today's temprature is 26"
test $day = Sunday && title="today's temprature is 27"

# here, i assign the output to a variable named output and print the output through cowsay
output=$(echo "welcome to planet $hostname,$title,hi $user , it is weekday at $time am")
echo $output | cowsay
