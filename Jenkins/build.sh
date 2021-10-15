#!/bin/bash
echo ${env.JOB_NAME}
x=$BUILD_NUMBER


if [ $(expr $x % 3) == "0" ]; then
   echo "great"
else
   echo "fail"
   exit 1
fi


echo "End"
