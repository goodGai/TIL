#!/bin/bash

echo '------------';
echo '参数：'$1;

if [ $1 == set ]
then 
    git config --global http.proxy http://localhost:7890
    git config --global https.proxy https://localhost:7890
elif [ $1 == unset ]
then
    git config --global --unset http.proxy
    git config --global --unset https.proxy
elif [ $1 == get ]
then
   git config --global --get http.proxy
   git config --global --get https.proxy
else
    echo '参数错误❎'
fi

