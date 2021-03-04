#!/bin/bash
# partial code coming from https://unix.stackexchange.com/questions/417209/get-cpu-usage-and-run-a-command-if-it-is-higher-than-80
# from usermazs

a=1
while [  $a -lt 10 ]
do
  cores=$(nproc) 
  load=$(awk '{print $3}'< /proc/loadavg)
  echo | awk -v c="${cores}" -v l="${load}" '{print " " l*100/c "%"}'
  usage=$(echo | awk -v c="${cores}" -v l="${load}" '{print l*100/c}' | awk -F. '{print $1}')
  if [[ ${usage} -ge 60 ]]; then
     if [[ ${usage} -ge 80 ]]; then
         echo "Alert"
     else
         echo "Warning"
     fi
  fi
  echo "------------------------"
  sleep 2
done
