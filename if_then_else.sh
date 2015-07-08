#!/bin/bash

#---------------------------------Basic Menu-------------------------------------------#

echo "What would you like to do today?"
echo "1. Play Game"
echo "2. Go To Work"
read Idea
echo

if [[ $Idea == 1 ]]; then
  echo "Excellent Choice"
elif [[ $Idea -eq 2 ]]; then
  echo "Take Some Rest Man"
else
  echo "Eh what now?"
fi



#-----------------------------------Not Equael------------------------------------------#
if [[ 0 != 1 ]]; then
  echo "Zero is not Equal to one"
fi


#------------------------------Arithmetic Comparision----------------------------------#
#Arithmetic Comaprision - Use Within double parentheses ((....))

Num1=3
Num2=4

if (( $Num1 > $Num2 )); then
	echo $Num1 "is less then " $Num2
else
	echo $Num1 "is less then" $Num2
fi


#------------------------------------Logical AND--------------------------------------#
var1=1
var2=1
var3=0

if (( $var1 && $var2 )); then
	echo "Both Var1 and Var2 are True"
else
	echo "Either Var1 or Var2 are false"
fi



#-------------------------------------Logical OR-------------------------------------#

if [[ $var2 == 1 ]] || [[ $var3 == 1 ]]
then
	echo "Either Statement is True"
else
	echo "Both Statement is false"
fi

