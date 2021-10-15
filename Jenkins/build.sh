#!/bin/bash

x=$BUILD_NUMBER


if [ $(expr $x % 3) == "0" ]; then
   echo "succsess"
else
   echo "fail"
   exit 1
fi



