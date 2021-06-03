#!/bin/bash

# Question 26: Find the value of d < 1000 for which 1/d contains
#			   the longest recurring cycle in its decimal fraction part.

reciprocal () {
	
	#	Beginning of primes
	declare -a a
	declare -a primes
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

	for i in "${a[@]}"; do
		if [[ "$i" != "" ]]; then
			primes+=("$i")
		fi
	done	
	# End of primes

	max=0
	#for (( i = 2; i < "$1"; i++ )); do
	 for i in "${primes[@]}"; do
		a="$(echo "scale=1000; 1 / $i" | bc -l)"
		for (( j = 1; j < 1100; j++ )); do
			for (( k = "$((j + 1))"; k < 1100; k++ )); do
				val="${a:j:5}"
				val2="${a:k:5}"
				if [[ "$val" == "$val2" ]]; then
					result="$(( k - j ))"
					break 2
				fi
			done
		done
		if (( "$result" > "$max" )); then
			max="$result"
			answer="$i"
		fi	
	done
	echo "$answer"
}

reciprocal 1000
