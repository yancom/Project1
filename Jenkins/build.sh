#!/bin/bash

num=$BUILD_NUMBER
repo=${JOB_NAME%%/*}

echo "This script stared by stage=$STAGE_NAME repositorie=$repo"


if [ $(expr $num % 3) == "0" ]; then
   echo "succsess"
else
   echo "failed"
   exit 1
fi



