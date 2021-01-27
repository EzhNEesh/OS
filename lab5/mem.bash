#!/bin/bash
rm report.log
declare -a ar
declare -i step=0
while true;
do
	let step++
	ar+=(1 2 3 4 5 6 7 8 9)
	if [[ step -eq 100000 ]];
	then
		echo ${#ar[@]} >> report.log
		step=0
	fi
done
