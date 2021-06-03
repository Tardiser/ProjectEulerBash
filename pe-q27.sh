#!/bin/bash

# Question 27: Find the product of the coefficients, a and b,
#			   for the quadratic expression that produces the maximum number of
#			   primes for consecutive values of n, starting with n=0.

isprime () {
	    num=$1
        numfacs=$(factor $num | wc -w)
        if [ $numfacs -gt 2 ]; then
                echo 1 # 1 refers to not prime therefore false.
        else
                echo 0 # 0 refers to prime therefore true.
        fi
}

quadraprime () {
	# Begining of the process of listing the primes up to the given argument.
    declare -a a
	declare -a primes
    declare  i j

    a[0]=2
    for (( i = 3; i <= 1000; i=i+2 )); do
        a[$i]=$i
    done

    for (( i = 3; i * i <= 1000; i=i+2 )); do
        if [[ ! -z $a[$i] ]]; then
            for (( j = i * i; j <= $1; j += i )); do
                a[$j]=""
            done
        fi
    done

    # To list without "" elements:
    for i in "${a[@]}"; do
       if [[ "$i" != "" ]]; then
           primes+=("$i")
       fi
    done

	# End of the listing primes process.
	# =========================================================
	# Beginning of the question.
	
	max=0
	for b in "${primes[@]}"; do
		echo "$b"
		for (( a = -999; a < "$b"; a=a+2 )); do
			if (( "$(( (a * -1) ))" > "$b" )); then
				continue
			fi	
			n=0
			counter=0
			while true; do
				calc="$(( (n * n) + (a * n) + b ))"
				if (( "$calc" < 0 )); then
					break 1
				fi	
				control=0
				if (( "$(isprime $calc)" == 0 )); then
					counter="$((counter+1))"
					control=1	
				else
					break 1
				fi	
				n=$((n+1))
			done
			if (( "$counter" > "$max" )); then
				max="$counter"
				values="$(( a * b))"
			fi
		done
	done	
	echo "$max"
	echo "$values"

}

quadraprime 1000
