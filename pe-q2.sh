#!/bin/bash

# Question 2: Sum of the even numbers in the 
#	      fibonacci sequence that is under 4000000.

oldval=1
newval=2
sum=0

while (( $newval < 4000000 )); do	
	if (( $newval % 2 == 0 )); then
		sum=$(( sum + newval ))
	fi
	betweenval=$newval
	newval=$(( oldval + newval ))
	oldval=$betweenval
done
printf "The result is $sum \n"
		
