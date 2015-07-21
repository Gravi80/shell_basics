find . -user xyz : Lists all file owned by user ‘xyz’

find -size +100M : This command combination, Lists all the files/folders the size of which is 100M or more.


To replace the text Windows with Linux in all text files in current directory and down you can run this:
--------------------------------------------------------------------------------------------------------
find . -name '*.txt' -print | xargs perl -pi -e's/Windows/Linux/ig' *.txt


Finding the biggest files
-------------------------
ls -lSrh
The "r" causes the large files to be listed at the end and the "h" gives human readable output (MB and such).


largest directories with:
-------------------------
du -kx | egrep -v "\./.+/" | sort -n


Listing today's files only:
---------------------------
ls -al --time-style=+%D | grep `date +%D`


Find all files with extension:
------------------------------
find . -name '*.gz'

will locate all the gzip archives in the current path. 
But suppose we want to check they are valid archives? 
The gunzip -vt option will do this for us, but we can cunningly combine both operations, using xargs:

find . -name '*.gz' | xargs gunzip -vt



Output redirection of standard
------------------------------
When you execute a command which you know will produce a lot of errors such as using find to look for files on the topmost / (slash root) directory knowing full well that you don’t have read access to many directories, such as this one (which assumes you’re looking for the file php.ini):

$ find / -name php.ini
find: /etc/cups/ssl: Permission denied
find: /etc/ssl/private: Permission denied
<other output truncated>

You get the idea. What you can do is to send them to /dev/null if you’re not interested in the error messages like so

$ find / -name php.ini 2> /dev/null