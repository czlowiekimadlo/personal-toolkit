#!/bin/bash
if [ "$1" == "" ]
then
  git status
else
  git status $1
fi

