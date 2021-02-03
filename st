#!/bin/bash
if [ "$1" == "" ]
then
  LANG=en_GB git status
else
  LANG=en_GB git status $1
fi

