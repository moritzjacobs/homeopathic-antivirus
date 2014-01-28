#!/bin/bash
SOURCE_FILE=$1
ITERATIONS=${2:-200}

for ((n = 1; n <= $ITERATIONS; n++)); do
	# shake
	awk NR==$((${RANDOM} % `wc -l < $1` + 1)) $SOURCE_FILE > solution.txt

	# dilute
	for i in {1..99}
	do
	   echo -e >> solution.txt
	done

	# repeat
	SOURCE_FILE='solution.txt'
done