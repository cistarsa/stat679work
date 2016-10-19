### For HW 1 exercise 3...


I am hoping to resolve my github repository/local direcotry communication issues soon, but in the meantime my script and .csv can be accessed from my stat679work home direcory or with the following hyperlinks: the HW1 exercise 3 script [here](https://github.com/kingcohn1/stat679work/blob/master/hw1.3.sh) and should work when cd'ing into HW1, stat679work or running it from [here](https://github.com/kingcohn1/stat679work/tree/master/hw1). But keep in mind if you are copying the script and trying to run it on your local directory just change the first line so it points to the log directory, not log2. As:
```shell
echo analysis,nRuns,nFail,fabs,frel,xabs,xrel,seed,under3460,under3450,under3440 > HW13.csv
for i in log2/*.log; #change log2-->log, if running locally or outside of my directory 
do
```

And my .csv output file can be located [here](https://github.com/kingcohn1/stat679work/blob/master/HW13.csv). 
