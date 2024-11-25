#!/bin/bash
clear
echo "Gib die Zeit in sekunden ein:"
read seconds

echo "Timer gestartet für $seconds sekunden.."

for ((i=seconds; i>=1; i--)); do
    if [ $i -le 5 ]; then
        echo "Nur noch $i Sekunden!"
    fi
    sleep 1
done

echo "Zeit abgelaufen!"
echo -e "\a"

sleep 1
exit 0