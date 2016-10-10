#!bin/bash

echo analysis,Hmax,cputime > out5.csv
for i in log/*.log;
do
	echo "i=$i" 
	analysis=$(echo $i | grep -o -E "[^/]+\.log" | grep -o -E "[^.log]+")
	h=$(grep "hmax" $i | head -n1 | grep -o -E "[0-9]")
	CPU=$(grep -E "Elapsed time. [[:digit:]]+" -o out/$analysis.out | grep -E -o "[[:digit:]]+")	
	echo "h=$h ; analysis=$analysis ; CPU=$CPU"
    echo "$analysis,$h,$CPU" >> out5.csv	
done
