#!/bin/bash

# Question 10: Sum of the primes below 2 million.

primes() {
        declare -a a
        declare  i j

        a[0]=2
        for (( i = 3; i <= $1; i=i+2 )); do
                a[$i]=$i
        done

        for (( i = 3; i * i <= $1; i=i+2 )); do
                if [[ ! -z $a[$i] ]]; then
                        for (( j = i * i; j <= $1; j += i )); do
                                a[$j]=""
                        done
                fi
        done
        for i in ${a[*]}; do
		sum=$((sum + i))
	done
	echo "$sum"	
}

primes 2000000

