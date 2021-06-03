#!/bin/bash

# Question 4: Finding the largest palindrome made from the 
#	      product of two  3-digit numbers.

max=0
for (( i = 999; i >= 100; i-- )); do
	for (( j = 999; j >= 100; j-- )); do
		result="$((i * j))"
		if (( ${result:0:1} == ${result: -1:1} )); then
			if (( ${result:1:1} == ${result: -2:1} )); then
				if (( ${result:2:1} == ${result: -3:1} )); then
					if (( $result > $max )); then
						max=$result
					fi
				fi
			fi
		fi	
	done
done

echo "$max"
