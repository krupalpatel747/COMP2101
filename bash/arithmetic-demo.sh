#!/bin/bash
#
# this script demonstrates doing arithmetic

# Task 1: Remove the assignments of numbers to the first and second number variables. Use one or more read commands to get 3 numbers from the user.
# Task 2: Change the output to only show:
#    the sum of the 3 numbers with a label
#    the product of the 3 numbers with a label

# i am taking the 3 number as the input from user through read command

read -p "please enter num1=" num1
read -p "please enter num2=" num2
read -p "please enter num3=" num3

# doing sum of three numbers
sum=$((num1+num2+num3))
echo "the sum of this 3 numbers are=" $sum

#doing product of three numbers
product=$((num1*num2*num3))
echo "the product of this three numbers are=" $product
