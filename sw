#!/bin/bash

if [ "$2" == "" ]
then
  origin="`origin`"
else
  origin="$2"
fi

if [ "$1" == "" ]
then
  git branch -vv
else
  LISTA=`git branch -vv | sed 's/\*/ /' | awk '{print $1}' | grep $1`
  if [ "$LISTA" == "" ]
  then
    read -p "Create branch $1? " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[YyTt]$ ]]
    then
      git checkout -b $1 origin/$origin
    fi
    exit
  fi
  git checkout $1
fi
