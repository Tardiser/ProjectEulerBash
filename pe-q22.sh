#!/bin/bash

# Question 22: What is the total of all the name scores in the file?

file="/home/erdem/bin/p022_names.txt"
var=$(<"$file") # Assigned file values to a variable.

IFS=", " read -r -a list1  <<< "$var" # We made a list by using this variable,
									  # seperated by commas.

list1=("${list1[@]//\"/}")			  # We made quotation marks removed.

IFS=$'\n' sorted=($(sort <<<"${list1[*]}")) # Sorted the list alphabetically.

alphabet=( "" A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ) 
counter=0

for i in "${sorted[@]}"; do	
	counter=$(( counter + 1 ))
	sum=0
	for (( j = 0; j < "${#i}"; j++ )); do
		letter="${i:j:1}"
		for (( k = 1; k <= 26; k++ )); do
			if [[ "$letter" == "${alphabet[k]}" ]]; then
				sum="$(( sum + k ))"
				break 1
			fi
		done	
	done
	totalscore="$(( totalscore + ( sum * counter ) ))"
done

echo "$totalscore"
