#!/bin/bash
#
# This script implements a guessing game
# it will pick a secret number from 1 to 10
# it will then repeatedly ask the user to guess the number
#    until the user gets it right

# Give the user instructions for the game
cat <<EOF
Let's play a game.
I will pick a secret number from 1 to 10 and you have to guess it.
If you get it right, you get a virtual prize.
Here we go!

EOF

# Pick the secret number and save it
secretnumber=$(($RANDOM % 10 +1)) # save our secret number to compare later

# This loop repeatedly asks the user to guess and tells them if they got the right answer
# TASK 1: Test the user input to make sure it is not blank
# TASK 2: Test the user input to make sure it is a number from 1 to 10 inclusive
# TASK 3: Tell the user if their guess is too low, or too high after each incorrect guess

read -p "Give me a number from 1 to 10: " userguess # ask for a guess

# task 1
while [[ -z $userguess ]]; do # ask repeatedly until they get it right
  echo " please input should not be empty, try again "
  read -p "Give me a number from 1 to 10: " userguess # ask for another guess
done

while [[ $userguess != $secretnumber ]];
do # ask repeatedly until they get it right

#part of task 2,
  if [[ $userguess -gt 10 ]]; then
    echo "the number is greater then 10 , please try again"
    read -p "Give me a number from 1 to 10: " userguess
#part of task 2
  elif [[ $userguess -lt 1 ]]; then
    echo "the number is lower then 1 , please try again"
    read -p "Give me a number from 1 to 10: " userguess

#part of task 3
  elif [[ $userguess -gt $secretnumber ]]; then # ask repeatedly until they get it right
    echo " too high , try again, you are near to win"
    read -p "Give me a number from 1 to 10: " userguess # ask for another guess

#part of task 3
  elif [[ $userguess -le $secretnumber ]]; then
    echo " too low, try again "
    read -p "Give me a number from 1 to 10: " userguess # ask for another guess


  else
    break
  fi
done

echo "You got it! Have a milkdud."
