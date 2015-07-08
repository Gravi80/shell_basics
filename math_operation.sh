#!/bin/bash

#Integers with some maths
a=4
b=6
a=$((a*b))

echo $a

let 'a+=1'
echo a=$a b=$b

