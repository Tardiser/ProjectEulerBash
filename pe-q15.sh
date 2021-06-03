#!/bin/bash

# Question 15: How many routes are there from the top left to the bottom right
#	       through a 20x20 grid?

# 	       By doing basic math we figured out that the result will be
#	       c(20+20,20) => c(40,20)

routes () {
	r="$1"
	result=1
	for (( i = 1; i <= "$r"; i++ )); do
		result=$(( result * ( r + i ) / i ))
	done	
	echo "$result"	
}	

routes 20
