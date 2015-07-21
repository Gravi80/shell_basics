nl : Outputs the content of text file with lines Numbered.

shuf : Randomly selects line/file/folder from a file/folder.

stat : Shows the status information of a file as well as of a file system.


To replace the text Windows with Linux in all text files in current directory and down you can run this:
--------------------------------------------------------------------------------------------------------
find . -name '*.txt' -print | xargs perl -pi -e's/Windows/Linux/ig' *.txt


comm: compare sorted files line by line
----------------------------------------
comm -12 file1 file2   Print only lines present in both file1 and file2.
comm -3 file1 file2    Print lines in file1 not in file2, and vice versa.


split and csplit: splitting files
---------------------------------
cat name | split --lines=1  ( will create files having one line each )



