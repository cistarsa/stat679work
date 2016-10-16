#!/bin/bash
set -e # script terminates if any command exits with non-zero status
set -u # terminates if any variable is unset
set -o pipefail

echo analysis,nRuns,nFail,fabs,frel,xabs,xrel,seed,under3460,under3450,under3440 > HW13.csv
for i in log/*.log;
do
	analysis=$(basename -s ".log" "$i")
	h=$(grep "hmax" $i | head -n1 | grep -o -E "[0-9]")
        CPU=$(grep -E "Elapsed time. [[:digit:]]+" -o out/$analysis.out)
        Nruns=$(egrep -o "BEGIN. [[:digit:]]+" -o $i | cut -f2 -d':' | egrep -o "[[:digit:]]+")
	Nfail=$(sed -n '5p' $i | grep -o -E "proposals = [[:digit:]]+" | grep -o -E "[[:digit:]]+")
	fabs=$(sed -n '3p' $i | cut -f5 -d" " | grep -E -o "[[:digit:]]+.+[[:digit:]]"
	frel=$(sed -n '3p' $i | cut -f4 -d" " | grep -E -o "[[:digit:]]+.+[[:digit:]]+")
        xabs=$(grep -E "xtolAbs=[[:digit:]].+ " -o $i | head -n1 | egrep -o "[[:digit:]]+.[[:digit:]]+")
	xrel=$(grep -E "xtolRel=[[:digit:]].+" -o $i | head -n1 | egrep -o "[[:digit:]]+.[[:digit:]]+") 
	seed=$(grep -E "seed [[:digit:]]+ " -o $i | head -n1 | egrep -o "[[:digit:]]+") 

l=$(sed -nE 's/.*-loglik=([0-9,]+).*/\1/p' $i)
a=0
b=0
c-0
for number in $l 
	do 
	 if [ $number -lt 3460 ]
         then
         a=$((a+1))
	fi
	if [ $number -lt 3450 ]
	 then
	 b=$((b+1))
	fi
	if [ $number -lt 3440 ]
	then
	 c=$((c+1))
	fi
done
echo $analysis,$Nruns,$Nfail,$fabs,$frel,$xabs,$xrel,$seed,$a,$b,$c >> HW13.csv

done
