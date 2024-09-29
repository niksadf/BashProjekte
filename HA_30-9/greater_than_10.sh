#!/bin/bash

# Hier fragt der Skript nach eine Zahl welche du prüfen möchtest.
read -p "Bitte gebe eine Zahl ein: " number

# Hier wird überprüft ob die Zahl grösser, kleiner oder genau 10 ist.
if [ $number -gt 10 ]
then
 echo "Die Zahl ist grösser als 10."
elif [ $number -lt 10 ]
then
 echo "Die Zahl ist kleiner als 10."
else
 echo "Die Zahl ist genau 10."
fi