#!/bin/bash -x

#Declaration of the Dictionary
declare -A resultsForComputatons

#To compute the expressions
function computateExpressions() {
	result1=`echo "scale=2; $(($a + $b * $c ))" | bc`
	result2=`echo "scale=2; $(($a * $b + $c ))" | bc`
	result3=`echo "scale=2; $(($c + $a / $b ))" | bc`
	result4=`echo "scale=2; $(($a % $b + $c ))" | bc`
}

#To store every computation in the Dictionary
function storeInDictionary() {
	resultsForComputatons[Expression1]=$result1
	resultsForComputatons[Expression2]=$result2
	resultsForComputatons[Expression3]=$result3
	resultsForComputatons[Expression4]=$result4
}

#To store values of Dictionary into Array
function storeInArray() {
	for ((i=1; i<=4; i++))
	do
		dictionaryToArray[$i]=${resultsForComputatons[Expression$i]}
	done
}

function sortTheResultsOfArray() {
	for ((i=1; i<=4; i++))
	do
		echo ${dictionaryToArray[$i]}
	done | sort $1

}

#Perform arithmatic computation
function arithmaticComputation() {
	computateExpressions
	storeInDictionary
	storeInArray
	echo "Results in Descending order:"
	sortTheResultsOfArray -rn
}

#Main
read -p "Enter the values of a, b & c : " a b c
arithmaticComputation


