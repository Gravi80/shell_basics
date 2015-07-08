
grep -irnw 'directory' -e "pattern"

#-r is recursive, -n is line numberm -i is incase-sensitive and -w stands match the whole word.

grep --include=\*.{c,h} -irnw 'directory' -e "pattern" # This will only search through the files which have .c or .h extensions.

grep --exclude=*.o -irnw 'directory' -e "pattern" #exclude searching all the files ending with .o extension.


