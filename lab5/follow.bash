#!/bin/bash
./mem.bash&pid0=$!
echo "Start time: $(date +%R)" > test1.1
echo "Time    VIRT     RES   SHR   CPU   MEM   FREE   SWAP" >> test1.1
while true;
do
	info_sh=$(top -p $pid0 -n 1 -b | head -8 | tail -n +8 | awk '{print ""$11" "$5" "$6" "$7" "$9" "$10""}')
	info_mem=$(top -o %MEM -n 1 -b | head -4 | tail -n +4 | awk '{print $6}')
	info_swap=$(top -o %MEM -n 1 -b | head -5 | tail -n +5 | awk '{print $5}')
	echo "$info_sh $info_mem $info_swap" >> test1.1
	sleep 1
done
