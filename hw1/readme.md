### In order to start this assignment I first obtained raw data directories (log and out) from git repository: git clone git@github.com:UWMadison-computingtools/coursedata.git.

### I began exercise 1 using my MacBook OSX 10.7.5 and as up-to-date libraries as possible. I created a directory on my desktop stat679work and transformed it as a git repository following the instructions on https://github.com/UWMadison-computingtools/coursedata/blob/master/readme.md. 

### After copying (cp) the log directory onto my desktop, I had uninentially deleted the original log directory. So, in order to mitigate further confusion I renamed log to log2. My script to rename the files in the log2 directory is:

#!/bin/bash

for i in {1..9};do
cp timetest${i}_snaq.log timetest0${i}_snaq.log
rm timetest${i}_snaq.log 

done

### the out directory was untarnished by my cp, so the name remained. here is the script to rename the files in out:

#!/bin/bash

for i in {1..9};do
cp timetest${i}_snaq.out timetest0${i}_snaq.out
rm timetest${i}_snaq.out

done

### the above scripts can be found at stat679/hw1/normalize(logs/out).sh

### for HW1 exercise 2 I used grep and standout to pipe my commands in sequence. The script is:

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

### and found at stat679/hw1/summarizeSNaQres
