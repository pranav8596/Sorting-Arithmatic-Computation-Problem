#!/bin/bash -x

read -p "Enter the values of a, b & c : " a b c

result1=`echo "scale=2; $(($a + $b * $c ))" | bc`
result2=`echo "scale=2; $(($a * $b + $c ))" | bc`
result3=`echo "scale=2; $(($c + $a / $b ))" | bc`
