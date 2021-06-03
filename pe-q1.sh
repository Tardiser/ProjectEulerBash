#!/bin/bash

# Question 1: sum of numbers that is under 1000 and can be divided to 3 or 5

sum=0
for i in {1..999}; do
	if (( $i % 3 == 0 )); then
		sum=$(( sum + i ))
	elif (( $i % 5 == 0 )); then
		sum=$(( sum + i))
	fi
done
printf "The result is $sum \n"


