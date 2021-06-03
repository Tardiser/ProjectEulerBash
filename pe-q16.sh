#!/bin/bash

# Question 16: What is the sum of the digits of the number 2^1000?

#	       It takes approximately 5 seconds to compute the code below,
#	       it can be improved.

sumofdigits () {
	declare -a a
	a=( [0]=1 )
	for (( i = 1; i <= 1000; i++ )); do
		extra=0
		length="${#a[@]}"
		for (( j = 0; j <= $length; j++ )); do
			if [[ ${a[j]} == "" ]]; then
				a+=( [j]=0 )
			fi	
			a+=( [j]=$(( (a[j] * 2) + extra ))  )
			if (( "${a[j]}" > 9 )); then
				a+=( [j]=$(( a[j] - 10 )) )
				extra=1
			else
				extra=0
			fi
		done
	done
	for (( i = 0; i < 1000; i++ )); do
		sum=( $((sum + a[i] )) )
	done
	echo "$sum"	

}

sumofdigits
