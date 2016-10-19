#!/bin/bash
set -e # script terminates if any command exits with non-zero status
set -u # terminates if any variable is unset
set -o pipefail

echo analysis,nRuns,nFail,fabs,frel,xabs,xrel,seed,under3460,under3450,under3440 > HW13.csv
for i in log2/*.log; #change log2-->log, if running locally or outside of my directory
do
	analysis=$(basename -s ".log" "$i") # this establishes my basename variable for commands downstream
	h=$(grep "hmax" $i | head -n1 | grep -o -E "[0-9]") # the grep command pulls a specific string"hmax" from my file directory. After isolating the string specificed, it then pulls the integer associated with hmas.
        CPU=$(grep -E "Elapsed time. [[:digit:]]+" -o out/$analysis.out) # Another grep command used to get elapsed time and integer. Here, I'm calling the variable to look into another directory, .out
        Nruns=$(egrep -o "BEGIN. [[:digit:]]+" -o $i | cut -f2 -d':' | egrep -o "[[:digit:]]+") # grep to obtain the number of runs 
	Nfail=$(sed -n '5p' $i | grep -o -E "proposals = [[:digit:]]+" | grep -o -E "[[:digit:]]+") # sed or "streamline editor" is similar to grep, but edits the file while reading it. Here, I am using it to obtain the number of fails.
	fabs=$(sed -n '3p' $i | cut -f5 -d" " | grep -E -o "[[:digit:]]+.+[[:digit:]]") # another sed command to get ftolAbs
	frel=$(sed -n '3p' $i | cut -f4 -d" " | grep -E -o "[[:digit:]]+.+[[:digit:]]+") # sed to get ftolRel number
        xabs=$(grep -E "xtolAbs=[[:digit:]].+ " -o $i | head -n1 | egrep -o "[[:digit:]]+.[[:digit:]]+") # grep used for xtolAbs number, and nothing more
	xrel=$(grep -E "xtolRel=[[:digit:]].+" -o $i | head -n1 | egrep -o "[[:digit:]]+.[[:digit:]]+") # grep to xtolRel values
	seed=$(grep -E "seed [[:digit:]]+ " -o $i | head -n1 | egrep -o "[[:digit:]]+") # grep to get main seed number
	
echo $analysis,$Nruns,$Nfail,$fabs,$frel,$xabs,$xrel,$seed 

l=$(sed -nE 's/.*-loglik=([0-9,]+).*/\1/p' $i) # sed again is used isolate the loglik values in my files that match initial $i variable, which are then piped into if statements. Here, sed is better than grep as it is able to read the files and execute commands simultaneously. As opposed to grep. 
a=0
b=0
c=0
for number in $l # for look to recall my $l variable from the sed command
	do 
	 if [ $number -lt 3460 ] #first if loop to count the number of loglik values less than 3460
         then
         a=$((a+1)) #variable is 0+1 for every time it is less than 3460, same syntax for values less than 3450, 3440.
	fi
echo $l,$a
	if [ $number -lt 3450 ]
	 then
	 b=$((b+1))
	fi
	if [ $number -lt 3440 ]
	then
	 c=$((c+1))
	fi
done
echo $analysis,$Nruns,$Nfail,$fabs,$frel,$xabs,$xrel,$seed,$a,$b,$c >> HW13.csv # prints the values from previous commands, stored as standard output, to a csv file: HW13.csv 

done #fin
