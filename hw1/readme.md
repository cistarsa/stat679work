### data

In order to start this assignment I first obtained raw data directories (log and out) from git repository: 
`git clone git@github.com:UWMadison-computingtools/coursedata.git`.

### getting started

I began exercise 1 using my MacBook OSX 10.7.5 and as up-to-date libraries as possible. I created a directory on my desktop stat679work and transformed it as a git repository following the [instructions](https://github.com/UWMadison-computingtools/coursedata/blob/master/readme.md). 

### first try

After copying (cp) the log directory onto my desktop, I had uninentially deleted the original log directory. So, in order to mitigate further confusion I renamed log to log2. My script to rename the files in the log2 directory is, and should be run from hw1/log2:

```shell
#!/bin/bash

for i in {1..9};do
	mv timetest${i}_snaq.log timetest0${i}_snaq.log 
done
```

the out directory was untarnished by my cp, so the name remained. here is the script to rename the files in out and should be run from hw1/out:

```shell
#!/bin/bash

for i in {1..9};do
	mv timetest${i}_snaq.out timetest0${i}_snaq.out
done
```

the above script can be found [here](https://github.com/kingcohn1/stat679work/tree/master/hw1)

### HW1 exercise 2 I used grep and standout to pipe my commands in sequence. 

 The script is:
```
echo analysis,Hmax,cputime > out5.csv # to create a .csv with the column names analysis, Hmax..etc.

for i in log/*.log; #find all my .log files in the log directory and set a recursive variable $
do
	echo "i=$i" # recall the file names, recursively with $
	analysis=$(echo $i | grep -o -E "[^/]+\.log" | grep -o -E "[^.log]+") #
	h=$(grep "hmax" $i | head -n1 | grep -o -E "[0-9]")
	CPU=$(grep -E "Elapsed time. [[:digit:]]+.+" -o out/$analysis.out | grep -E -o "[[:digit:]]+\.[[:digit:]]+")	
	echo "h=$h ; analysis=$analysis ; CPU=$CPU"
    echo "$analysis,$h,$CPU" >> out5.csv	
done
```

### and found [here](https://github.com/kingcohn1/stat679work/tree/master/hw1)

## For Exercise 3 

We must create a .csv file, like we did in exercise 2, but using more involved commands like an ```if``` loop, ```sed, basename``` and ```cut````. The updated summarizeSNaQres.sh script can be found [here](https://github.com/kingcohn1/stat679work/tree/master/hw1/summarizeSNaQres.sh). With the output .csv [at](https://github.com/kingcohn1/stat679work/blob/master/hw1/HW13.csv).

I had issues syncing my local directory with my github repository, but was able to resolve this by:

```bash 
git mv log2 log # this renames my log2 directory to log, via git and mv
git commmit -m "renamed log2 to log" # this commits the changes with a message, required
git push origin master # this final command pushes my changes to the github repository! 
```


