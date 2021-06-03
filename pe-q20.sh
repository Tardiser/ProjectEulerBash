#!/bin/bash

# Question 20: Find the sum of the digits in the number 100!

sumofdigits () {
        declare -a a
        a=( [0]=1 )
        for (( i = 1; i <= 100; i++ )); do
                extra=0
                length="${#a[@]}"
		for (( j = 0; j <= $((length + 1)); j++ )); do
                        if [[ ${a[j]} == "" ]]; then
                                a+=( [j]=0 )
                        fi
                        a+=( [j]=$(( (a[j] * i) + extra ))  )
                        if (( "${a[j]}" > 9 )); then
				extra="$((a[j] / 10))"
				a+=( [j]=$(( a[j] % 10 )) )
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



