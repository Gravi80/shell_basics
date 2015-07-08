#!/bin/bash

#Concatenating Strings
c="Hello"
c+="World"
echo $c


#Another mathod for concat
d="Messing"
d=${d}" with alternate methods"

echo $d


#Substings

FullName="ravi Sharma"
echo "Full Name is:" $FullName
echo "After the First third characters:" ${FullName:3}
echo "Four Characters after the fourth character" ${FullName:3:4}
echo "Last Two Characters:" ${FullName: -2}
echo "Full Name is" `expr length $FullName` "characters long"

