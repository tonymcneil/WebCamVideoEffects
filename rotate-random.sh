#!/usr/bin/env bash

source .common.sh

IFS=$'\n'
effects=($(find ./ -name "v-*.sh"))
unset IFS

while true; 
do
  effect=${effects[ $RANDOM % ${#effects[@]} ]}
  $effect; 
  sleep 5 
done
