#!/bin/bash 
echo analysis,Hmax,cputime > out5.csv
for i in log2/*.log;
do
	echo "i=$i" 
	analysis=$(echo $i | grep -o -E "[^/]+\.log" | grep -o -E "[^.log]+")
	h=$(grep "hmax" $i | head -n1 | grep -o -E "[0-9]")
	CPU=$(grep -E "Elapsed time. \d+" -o out/$analysis.out)	
	echo "h=$h ; analysis=$analysis ; CPU=$CPU"
    echo "$h,$analysis,$CPU" >> out5.csv	
done
