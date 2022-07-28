#!/bin/bash

number=$(($RANDOM % 3))

if [[ $number == 0 ]]; then
  oneko -tora & 
fi
