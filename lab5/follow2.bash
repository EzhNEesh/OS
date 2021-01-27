#!/bin/bash
./mem.bash&pid0=$!
./mem2.bash&pid1=$!
str0="Start time: $(date +%R)"
str1="Time    VIRT     RES   SHR   CPU   MEM   FREE   SWAP" >> test1.1
echo $str0 > test1.2.1
echo $str1 >> test1.2.1
echo $str0 > test1.2.2
echo $str1 >> test1.2.2
while true;
do
	info_sh=$(top -p $pid0 -n 1 -b | head -8 | tail -n +8 | awk '{print ""$11" "$5" "$6" "$7" "$9" "$10""}')
	info_mem=$(top -o %MEM -n 1 -b | head -4 | tail -n +4 | awk '{print $6}')
	info_swap=$(top -o %MEM -n 1 -b | head -5 | tail -n +5 | awk '{print $5}')
	echo "$info_sh $info_mem $info_swap" >> test1.2.1
	info_sh2=$(top -p $pid1 -n 1 -b | head -8 | tail -n +8 | awk '{print ""$11" "$5" "$6" "$7" "$9" "$11""}')
	info_mem2=$(top -o %MEM -n 1 -b | head -4 | tail -n +4 | awk '{print $6}')
	info_swap2=$(top -o %MEM -n 1 -b | head -5 | tail -n +5 | awk '{print $5}')
	echo "$info_sh2 $info_mem2 $info_swap2" >> test1.2.2
	sleep 1
done
