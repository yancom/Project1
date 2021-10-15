#!/bin/bash
echo ${env.JOB_NAME}
x=$BUILD_NUMBER

def build = Thread.currentThread().toString()
def regexp= ".+?/job/([^/]+)/.*"
def match = build  =~ regexp
def jobName = match[0][1]

if [ $(expr $x % 3) == "0" ]; then
   echo "great"
else
   echo "fail"
   exit 1
fi



