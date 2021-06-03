#!/bin/bash

# Question 6: Difference between the sum of the squares of the
#	      first one hundred natural numbers and the square of the sum.

sum () {
	sum=0
	for (( i = 1; i <= 100; i++ )); do
		sum=$((sum+i))
	done
}

sumsquares () {
	sumsquares=0
	for (( i = 1; i <= 100; i++ )); do
		sumsquares=$(( sumsquares + (i*i) ))
	done
}

sum
echo "$sum"
sumsquares
echo "$sumsquares"
result=$(( (sum*sum) - sumsquares ))
echo "$result"
