#!/bin/bash
rm report2.log
declare -a ar
declare -i step=0
while true;
do
	let step++
	ar+=(1 2 3 4 5 6 7 8 9)
	if [[ step -eq 100000 ]];
	then
		echo ${#ar[@]} >> report2.log
		step=0
	fi
done
