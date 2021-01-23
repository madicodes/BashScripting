#!/bin/bash

echo "Task 1"
for i in $(ls ${HOME}); do
    echo $i
done
echo "========"
for i in {01..10}; do
    echo {e,$i{f..i},j} #fix this
    echo {aa..ee}$i
done
echo "========"
echo "Ananylying Subjects"
echo "========"
logs="logs"
for logfile in "$logs"/*;do
 echo "$logfile"
 subject="$(grep -o "Subject[0-9][0-9]" "$logfile" | head -1)"
 if [[ $subject == "Subject01" ]]; then  #strings are equal?
    echo "logfile $logfile CONTAINS word Subject01"
 elif [[ $subject == *"08"* ]]; then #contains string or use regex =~.*"08"*
    echo "logfile $logfile contains SUBSTRING 08"
 else
    echo "logfile $logfile doesn't coooooontain word Subject01"
 fi
echo "******"
done

echo "======"
echo "Analysing Runtime"
echo "======"
for logfile in "$logs"/*;do
 echo "$logfile"
 runtime="$(grep "run-time" "$logfile" | head -1   | grep -Eo "[0-9]+\.[0-9]+" | grep -o '.*[.]' |tr -d '.')"
 if [[ $runtime -lt 10 && $runtime -gt 0 ]]; then
    echo "logfile $logfile contains $runtime value less than 10"
 fi
 echo "*****"
done


