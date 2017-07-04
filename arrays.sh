#!/bin/bash

names[1]="ravi"
names[2]="sharma"
names[3]="bob"
names[4]="jenn"

names[14]="ram"

echo ${names[2]}
echo

echo "loop till 4th element"
echo "======================"

for index in {1..4}; do
	echo "User $index is ${names[$index]}"
done

echo
echo "loop till 14th element"
echo "======================"

for index in {1..14}; do
	echo "User $index is ${names[$index]}"
done

echo
echo "To loop through each value of array"
echo "===================================="

for name in "${names[@]}"; do
	echo $name
done


