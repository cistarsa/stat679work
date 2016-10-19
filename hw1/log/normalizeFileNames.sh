#!/bin/bash

cd log2
ls -l timetest?_snaq.log
for filename in timetest?_snaq.log
do 
cp $filename *0?_snaq.log 

done



