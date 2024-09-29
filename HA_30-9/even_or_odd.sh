#!/bin/bash

# Hier fragt es nach deine Zahl
read -p "Bitte gebe eine Zahl ein: " number


# Es wird überprüft ob die Zahl durch 2 teilbar ist,
# ist dies der Fall ist die Zahl gerade.
if [ $(($number % 2)) -eq 0 ]
then
 echo "Die Zahl ist gerade."
else
 echo "Die Zahl ist ungerade."
fi