#! /bin/bash
a=10
b=5

sum=$((a + b))
echo "Summe: $sum"
sleep 1
sum=$((b + b))
echo "Summe: $sum"
sleep 1
sum=$((a + a))
echo "Summe: $sum"