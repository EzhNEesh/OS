#!/bin/bash
declare -a ar
while [[ ${#ar[@]} -le $1 ]];
do
	ar+=(1 2 3 4 5 6 7 8 9)
done
