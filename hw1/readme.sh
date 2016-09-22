#this file will attempt to summarize a few hours of banging my head against the keyboard to find a reasonable "for" loop to execute exercise 1:1.
#

#!/bin/bash the Unix "shebang" is required as a header for all bash.sh scripts in order to tell terminal to run these commands in the bash program, notice the bath to the bash program is the bin directory. This is important because bash syntax is slightly different than other programminglanguages, which have a different header pointed to a different interpreter. 

for i in {1..9};do # this first line was the beginning of a long night. The for loop is a command designed to run commands many times based on the variables set by the user. In this example I am interested in renaming files containing the all the numbers from 1-9, only. This for loop can differentiate between a 1 by itself and a 1 with a 0 or another number eg 10, 11...etc. After organizng my numbers, the "do" command is followed by "cp". The for syntax, requires "do" and a command. Cp will copy my files with the number variable and rename them according to the script-with a leading 0. However, the cp command copies my files and keeps my originals so I must also include a remove command eg rm and specify the old files to remove.
cp timetest${i}_snaq.out timetest0${i}_snaq.out
rm timetest${i}_snaq.out

done
  
