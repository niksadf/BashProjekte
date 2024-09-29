#!/bin/bash

# Hier gibt man sein Passwort ein.
read -p "Bitte gebe deinen Passwort ein: " password
echo

# Hier prüft es ob das Passwort mindestens 8 Zeichen lang ist.
if [ ${#password} -lt 8 ]
then
 echo "Passwort ist zu kurz, es muss mindestens 8 Zeichen lang sein."
else
 # Prüft ob das Passwort mindestens eine Zahl enthält.
 if [[ "$password" =~ [0-9] ]]
 then
  echo "Passwort ist gültig."
 else
  echo "Passwort muss mindestens eine Zahl enthalten."
 fi
fi