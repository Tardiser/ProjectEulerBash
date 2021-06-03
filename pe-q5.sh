#!/bin/bash

# Question 5: Smallest number that can be divided by the number 1 to 20
#	      without a remainder.

a=2520
forfunc () {
        for (( i = 11; i <= 21; i++ )); do
                if (( $a % $i == 0 )); then
                        counter=$i
                        if (( $counter == 20 )); then
                                echo "$a"
                                exit 1
                        fi
                else
                        break
		fi
	done	
}

while [[ $a > 1 ]]; do
	
	forfunc	
	a=$((a+2520))	
done	
