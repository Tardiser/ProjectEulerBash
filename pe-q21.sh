#!/bin/bash

# Question 21: Evaluate the sum of all the amicable numbers under 10000.

sumofdivisors () {
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

sumofamics () {
	b="$1"
	sum=0
	declare -a d
	for (( i = 1; i < "$b"; i++ )); do
		d+=( [i]="$(sumofdivisors "$i")" )
	done
	for (( i = 2; i < "$b"; i++ )); do
		if (( "${d[i]}" > 10000 )); then
			continue
		elif (( "${d[i]}" < "$i" )); then
			continue	
		elif (( "${d[i]}" == "$i" )); then
			continue
		else
			if (( "${d[d[i]]}" == "$i" )); then
			sum=$(( sum + i + d[i]))
			fi
		fi
	done
	echo "And the result is = $sum"	

}
sumofamics 10000

