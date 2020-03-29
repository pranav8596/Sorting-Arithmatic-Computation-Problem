#!/bin/bash -x

#Declaration of the Dictionary and Array
declare -A resultsForComputatons
declare -a dictionaryToArray

#To Compute arithmatic expression 1
function computeExpression1() {
	result1=`echo "scale=2; $(($a + $b * $c ))" | bc`
	echo $result1
}

#To Compute arithmatic expression 2
function computeExpression2() {
	result2=`echo "scale=2; $(($a * $b + $c ))" | bc`
	echo $result2
}

#To Compute arithmatic expression 3
function computeExpression3() {
	result3=`echo "scale=2; $(($c + $a / $b ))" | bc`
	echo $result3
}

#To Compute arithmatic expression 4
function computeExpression4() {
	result4=`echo "scale=2; $(($a % $b + $c ))" | bc`
	echo $result4
}

#To compute the All the arithmatic expressions
function computateExpressions() {
	computeExpression1
	computeExpression2
	computeExpression3
	computeExpression4
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

#To sort the results in Ascending and Descending order
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
	echo "Results in Ascending order:"
	sortTheResultsOfArray -n
}

#Main
read -p "Enter the values of a, b & c : " a b c
arithmaticComputation


