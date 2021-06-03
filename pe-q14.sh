#!/bin/bash

# Question 14: Which starting number for the collatz sequence,
# 	       under one million, produces the longest chain?

collatz () {
	max=0
	declare -a store
	store=( [1]=1 )
	for (( i=2; i < 1000000; i++ )); do
		loop="$i"
		length=0
		while [[ "$loop" != 1 ]] && (( "$loop" >= "$i" )); do
			if (( $(( loop % 2 )) == 0 )); then
				loop=$(( loop / 2 ))
				length=$(( length + 1 ))
			else
				loop=$(( (3 * loop + 1) / 2 ))
				length=$(( length + 2 ))
			fi	
		done
		store+=( [i]=$(( length + store[loop] )) )
		if (( "${store[i]}" > "$max" )); then
			max="$length"
			startpoint="$i"
		fi
		echo "$i" #Döngü ne kadar hızlı devam ediyor görmek için.
	done
	echo "$startpoint"
}

collatz
