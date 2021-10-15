#!/bin/bash

x=$BUILD_NUMBER

def build = Thread.currentThread().toString()
def regexp= ".+?/job/([^/]+)/.*"
def match = build  =~ regexp
def jobName = match[0][1]

echo "job name =$jobName"

if [ $(expr $x % 3) == "0" ]; then
   echo "succsess"
else
   echo "fail"
   exit 1
fi



