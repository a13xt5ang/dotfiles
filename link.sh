#!/bin/bash

conflict=false

for f in $(ls)
do
  if [ -e ../.$f ]
  then
    echo ../.$f "exists already!"
    conflict=true
  fi
done

if $conflict
then
  echo "No files were modified."
  exit
fi

for f in $(ls)
do
  ln -s ${PWD##*/}/$f ../.$f
done

rm ../.link.sh
