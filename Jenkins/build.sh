#!/bin/bash

num=$BUILD_NUMBER
name=$JOB_NAME

echo "This script stared by stage=$STAGE_NAME job=${JOB_NAME%%/*}"


if [ $(expr $num % 3) == "0" ]; then
   echo "succsess-> started by $name"
else
   echo "failed"
   exit 1
fi



