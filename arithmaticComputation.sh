#!/bin/bash -x

read -p "Enter the values of a, b & c : " a b c

result1=`echo "scale=2; $(($a + $b * $c ))" | bc`
