#!/bin/bash

# Question 23: Find the sum of all the positive integers which cannot be written#			   as the sum of two abundant numbers.

divisors () {
    # Better at numbers higher than 1000.
        sum=0
    sqrt=$(echo "sqrt ( $1 )" | bc)
    if (( "$(( $1 % 2 ))" == 0 )); then
                step=1
        else
                step=2
        fi
    for (( i = 1;i <= "$sqrt"; i=$(( i + step )) )); do
                if (( "$i" == "$sqrt" )); then
                        if (( "$(( sqrt * sqrt ))" == "$1" )); then
                                sum="$(( sum + i ))"
                        else
                                if (( $(( $1 % i )) == 0 )); then
                                        sum="$(( sum + i))"
                                        sum="$(( sum + ( $1 / i) ))"
                                fi
                        fi
                else
                        if (( $(( $1 % i )) == 0 )); then
                                        sum="$(( sum + i))"
                                        sum="$(( sum + ( $1 / i) ))"
                        fi
                fi
        done
        sum="$(( sum - $1 ))"
        echo "$sum"
}


abundant () {
		declare -a abundantnumbers
		declare -a sumoftwo
		for (( i = 0; i <= "$1"; i++)); do
				sumoftwo[$i]="$i"
		done

		for (( i = 1; i <= "$1"; i++ )); do
			if (( "$(divisors $i)" > $i )); then
					abundantnumbers+=("$i")
			fi
		done
		echo "${abundantnumbers[@]}"
		
		for (( i = 0; i < "${#abundantnumbers[@]}"; i++ )); do
				for (( j = 0; j <= "$i"; j++ )); do
						sum=$(( abundantnumbers[i] + abundantnumbers[j] ))
						if (( "$sum" > 28123 )); then
								break 1
						fi		
						sumoftwo[$sum]=""
				done
				echo "$i"
		done
		echo "${sumoftwo[@]}"
}

abundant 28123


