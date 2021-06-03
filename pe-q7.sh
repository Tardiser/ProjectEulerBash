#!/bin/bash

# Question 7: 10.001st prime number?

function primes() {
        declare -a a
        declare  i j

        a[1]=""
        for (( i = 2; i <= $1; i++ )); do
                a[$i]=$i
        done

        for (( i = 2; i * i <= $1; i++ )); do
                if [[ ! -z $a[$i] ]]; then
                        for (( j = i * i; j <= $1; j += i )); do
                                a[$j]=""
                        done
                fi
	done

	declare -a newarray

	for i in "${a[@]}"; do
		if [[ $i != "" ]]; then
		newarray+=("$i")	
		fi
	done
	echo "${newarray[10000]}"	
}

primes 200000


			
