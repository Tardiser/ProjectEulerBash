#!/bin/bash

# Question 25: What is the index of the first term in the Fibonacci sequence
#			   to contain 1000 digits?

fibdigits () {

        digits="$(( $1 + (( $1 / 68) * 2) ))"
        # Every 68 characters it includes a "\n" and length
        # increases 2 characters. To prevent this, we are adding this.

        declare -a f
        f=( [1]=1 [2]=1 )
        var=3
        while true; do
            f[var]=$(echo "scale=10000;${f[var-1]} + ${f[var-2]}" | bc)
            if (( "${#f[var]}" == "$digits" )); then
                    echo "$var"
                    exit 1
            fi
            var="$((var + 1))"
    done
}

fibdigits 1000
