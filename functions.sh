#!/bin/bash

function hello(){
	echo "Hello World"
}

hello


function apples(){
	clear
	echo "Do you like Red or Green Apples"
	read apples
	case "$apples" in
		[gG]reen) echo "oh, you like Green Apples.";;
		[rR]ed) echo "Good, you like Red Apples.";;
		*) echo "Um? I wouldn't eat apple of that color."
	esac
}


x=0

while [[ $x = 0 ]]; do
	clear
	echo "Do you like apples or bananas?"
	read fruit

	case "$fruit" in
		[aA]pples )
		apples
		x=1
		;;
		[bB]ananas )
		echo "You like Bananas"
		x=1
		;;
		* )
		echo "That is not an option."
		sleep 1
		clear
		echo "Please Type either apples or bananas"
		sleep 1
		;;
	esac
done