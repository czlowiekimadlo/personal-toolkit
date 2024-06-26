#!/bin/bash

if [ "$2" == "" ]
then
  origin="`origin`"
else
  origin="$2"
fi

if [ "$3" == "" ]
then
  remote="`remote`"
else
  remote="$3"
fi

if [ "$1" == "" ]
then
  LANG=en_GB git branch -vv
else
  LISTA=`LANG=en_GB git branch -vv | sed 's/\*/ /' | awk '{print $1}' | grep -i "$1$"`
  if [ "$LISTA" == "" ]
  then
    read -p "Create branch $1? " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[YyTt]$ ]]
    then
      LANG=en_GB git checkout -b $1 $remote/$origin
    fi
    exit
  fi
  LANG=en_GB git checkout $1
fi
