#!/bin/bash

# Question 9: There exists exactly one Pythagorean triplet for which
#	      a + b + c = 1000.Find the product abc.

pythagorean () {
	for (( j = 1; j < 1000; j++ )); do
		b=$j
		for (( k = 1; k < $j; k++ )); do
			a=$k
			c=$(( 1000-(a+b) ))	
			if (( $(( (a*a) + (b*b) )) == $((c*c)) )); then
					echo "$((a*b*c))"
					exit 1
			fi
		done
	done
	echo "$i"
}

pythagorean
