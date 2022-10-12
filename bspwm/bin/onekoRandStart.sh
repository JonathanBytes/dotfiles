#!/bin/bash

number=$(($RANDOM % 6))

if [[ $number == 0 ]]; then
  oneko -tora & 
fi
