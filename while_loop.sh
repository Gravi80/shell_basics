let x=1

# -lt is for less then
while [[ $x -lt 2 ]]; do
	echo "x is: $x"
	let x=$x+1
	sleep 1
done

# ls | tr -s " " | cut -d " " -f9

echo
echo "loop through all files in a directory"
echo "====================================="

ls | while read file; do
	echo "file found $file"
done


echo
echo "wc of all files"
echo "================"

ls | while read -r file; do
	if [ -f $file ]; then
		word_count=($(wc -wl $file | tr -s " " | cut -d " " -f2 -f3))
		echo "$file =>  words=${word_count[1]}	 lines=${word_count[0]}"
	fi
done

# to assign the output to an array
# arr=($(command))
# the inner $() runs the command while the outer () causes output to be an array