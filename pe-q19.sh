#!/bin/bash

# Question 19: How many Sundays fell on the first of the month 
#	       during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

sundays () {
	declare -a leap
	declare -a notleap
	leap=( "" 31 29 31 30 31 30 31 31 30 31 30 31 )
	notleap=( "" 31 28 31 30 31 30 31 31 30 31 30 31 )
	currentday=1
	counter=0
	for (( i = 1901; i <= 2000; i++ )); do
		if (( "$(( i % 4 ))" == 0 )); then
			for (( j = 1; j <= 12; j++ )); do
				currentday="$(( (currentday % 7) + (leap[j] % 7) ))"
				if (( "$currentday" == 6 )); then
					counter="$(( counter + 1 ))"
				fi
			done
		else
			for (( j = 1; j <= 12; j++ )); do
                                currentday="$(( (currentday % 7) + (notleap[j] % 7) ))"    
                                if (( "$currentday" == 6 )); then
                                        counter="$(( counter + 1 ))"    
                                fi      
                        done 
		fi
	done
	echo "$counter"
}

sundays
