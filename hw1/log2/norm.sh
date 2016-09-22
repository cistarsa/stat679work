#!/bin/bash
#ls timetest?_snaq.log
#echo
for i in {1..9}; do
cp timetest${i}_snaq.log timetest0${i}_snaq.log 
rm timetest?_snaq.log
done
