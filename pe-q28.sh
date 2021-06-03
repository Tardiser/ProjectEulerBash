#!/bin/bash

# Question 28: What is the sum of the numbers on the diagonals
#		   in a 1001 by 1001 spiral formed in the same way?

spiralsum () {
	sum=1
	for (( i = 3; i <=1001; i=i+2 )); do
		sum="$(( sum + ( i * i ) ))"
		sum="$(( sum + ( i * i ) - ( i - 1 ) ))"
		sum="$(( sum + ( i * i ) - ( 2 * ( i - 1 )) ))"
		sum="$(( sum + ( i * i ) - ( 3 * ( i - 1 )) ))"
	done
	echo "$sum"
}

spiralsum
