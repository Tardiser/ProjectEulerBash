#!/bin/bash

# Question 17: If all the numbers from 1 to 1000 inclusive were written out
#	       in words, how many letters would be used?

numbers () {
	declare -a numbers
	numbers=( [1000]="onethousand" )
	numbers1=( [0]="" [1]="one" [2]="two" [3]="three" [4]="four" [5]="five" [6]="six" [7]="seven" [8]="eight" [9]="nine" [10]="ten" [11]="eleven" [12]="twelve" [13]="thirteen" [14]="fourteen" [15]="fifteen" [16]="sixteen" [17]="seventeen" [18]="eighteen" [19]="nineteen" [20]="twenty" )
        numbers2=( [2]="twenty" [3]="thirty" [4]="forty" [5]="fifty" [6]="sixty" [7]="seventy" [8]="eighty" [9]="ninety" )
	for (( i = 1; i < 1000; i++ )); do
		if (( $i <= 20 )); then
			numbers+=( [$i]=${numbers1[$i]} )	
		elif (( $i > 20 & $i < 100 )); then
			val1="${i:0:1}"
			val2="${i:1:1}"
			digit1="${numbers2[val1]}"
			digit2="${numbers1[val2]}"
			numbers+=( [$i]=$digit1$digit2 )
		else
			val1="${i:0:1}"
			val2="${i:1:2}"
			val2="${val2#0}"
			if (( $val2 == 0 )); then
				digit1="${numbers1[val1]}"
				numbers+=( [$i]=$digit1"hundred" )
			else
				digit1="${numbers1[val1]}"
				digit2="${numbers[val2]}"
				numbers+=( [$i]=$digit1"hundredand"$digit2 )
			fi	
				
		fi	
		counter=$(( counter + ${#numbers[$i]} ))
	done	
	counter=$(( counter + ${#numbers[1000]} ))		
	echo "$counter"
}

numbers
