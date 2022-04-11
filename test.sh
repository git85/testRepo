#!/bin/bash

echo -e "This is for searchhead" 
echo -e "This is a tryout"
echo -e "Test shc deployment"

counter=0

MAX_RETRIES=600
#TWT=Total Wait Time
TWT=0

 while [ ${TWT} -lt ${MAX_RETRIES} ];
    do
    sleep 1
    echo "Running test loop" |tee -a  /tmp/test.log
let TWT=${TWT}+1
      if [ ${TWT} -ge ${MAX_RETRIES} ]; then
        exitCode=0;
        echo "Timedout" |tee -a  /tmp/test.log
        exit $exitCode
      fi
  done
