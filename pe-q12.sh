#!/bin/bash

# Question 12: What is the value of the first triangle number to have over
#	       five hundred divisors.

triangle () {
        baseval=0
        newval=1
        while true; do
                trinumber="$(( baseval + newval ))"
                baseval="$trinumber"
                newval="$(( newval + 1 ))"
                declare -a factors
                IFS=" " read -r -a a <<< "$(factor "$trinumber")"
                for (( i = 1; i < ${#a[@]}; i++ )); do
                        if [[ "${a[i]}" != "${a[i-1]}" ]]; then
                                counter=1
                                if [[ "${a[i+1]}" != "" ]]; then
                                        while (( "${a[i]}" == "${a[i+1]}" )); do
                                                if (( "${a[i]}" == "${a[i+1]}" )); then
                                                        counter="$((counter + 1))"
                                                        i="$((i+1))"
                                                        if [[ "${a[i+1]}" == "" ]]; then
                                                                break
                                                        fi

                                                fi
                                        done
                                fi
                                factors+=("$((counter + 1))")
                        fi
                done
                product=1
                for i in "${factors[@]}"; do
                        product="$((product * i ))"
                done
                if (( $product > 500 )); then
                        echo "$trinumber"
                        exit 1
                fi
                unset factors
        done
}	

triangle
