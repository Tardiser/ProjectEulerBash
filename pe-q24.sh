#!/bin/bash

# Question 24: What is the millionth lexicographic permutation of the 
#			   digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

fact () {
	product=1	
	for (( i = 2; i <= "$1"; i++ )); do
			product="$(( product * i ))"
	done
	echo "$product"
}

lexico () {
	numbers=( 0 1 2 3 4 5 6 7 8 9)	
	declare -a result	
	counter=0
	sum=0
	var=1000000
	factvar=9
	while true; do
			sum="$(( sum + "$(fact "$factvar")" ))"
			if (( "$sum" >= "$var" )); then
					var="$(( var - ( counter * "$(fact "$factvar")" ) ))"
				while true; do
					if [[ "${numbers[counter % 10]}" != "" ]]; then	
						result+=("${numbers[counter % 10]}")
						unset numbers[$((counter % 10))]
						for (( i = 0; i < "${#numbers[@]}" - 1; i++ ));do
							if [[ "${numbers[i]}" == "" ]]; then
								numbers[i]="${numbers[$((i + 1))]}"
								unset numbers[i+1]
							fi
						done
						break 1
					else
						counter="$((counter + 1))"
					fi
				done	
				factvar="$(( factvar - 1 ))"
				sum=0
				counter=0
				if (( "$factvar" < 0 )); then
					break 1
				fi
				continue
			fi
			counter="$(( counter + 1))"
	done
	echo "${result[@]}"

}

lexico
				

