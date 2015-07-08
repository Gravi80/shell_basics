#!/bin/bash

names[1]="ravi"
names[2]="sharma"
names[3]="bob"
names[4]="jenn"

echo ${names[2]}
echo

for index in {1..4}; do
	echo ${names[$index]}
done



