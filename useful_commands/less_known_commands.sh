Creates a simple web page for the current working directory over port 8000.
---------------------------------------------------------------------------
Python -m SimpleHTTPServer


nl : Outputs the content of text file with lines Numbered.

shuf : Randomly selects line/file/folder from a file/folder.

Pstree : Prints running processes with child processes, recursively.


stat : Shows the status information of a file as well as of a file system.

mount | column -t : Lists mounted file system, in nice formatting with specification.


screen : Detach and Reattach, long running process from a session.


at : Run a particular command, time based.

factor : Gives all the possible factors of a decimal number.

ping -i 60 -a IP_address : Pings the provided IP_address, and gives audible sound when host comes alive.


disown -a && exit Command : Run a command in background, even after terminal session is closed.


getconf LONG_BIT Command : Output Machine Architecture, very clearly.


 find . -user xyz : Lists all file owned by user ‘xyz’

 find -size +100M : This command combination, Lists all the files/folders the size of which is 100M or more.


 ps -LF -u user_name : Outputs Processes and Threads of a user.



The watch command can be used to repeat a command at fixed intervals.the default interval is 2 second.the interval can be changed with -n option

root@localhost:~# watch -n 2 free


list all the processes on the box not being run by you:
ps aux | grep -v `whoami`

to be a little more clever, why not just list the top ten time-wasters:
ps aux  --sort=-%cpu | grep -m 11 -v `whoami` 



Replacing same text in multiple files

If you have text you want to replace in multiple locations, there are several ways to do this. To replace the text Windows with Linux in all files in current directory called test[something] you can run this:
perl -i -pe 's/Windows/Linux/;' test*

To replace the text Windows with Linux in all text files in current directory and down you can run this:
find . -name '*.txt' -print | xargs perl -pi -e's/Windows/Linux/ig' *.txt

To replace the word word1 with the word word2 in the file file1, we can use the sed command:
sed "s/word1/word2/g" file1 > file2



Finding the biggest files
You can find the biggest files in the current directory with:
ls -lSrh

The "r" causes the large files to be listed at the end and the "h" gives human readable output (MB and such).


You can also look for the largest directories with:
du -kx | egrep -v "\./.+/" | sort -n





Listing today's files only
ls -al --time-style=+%D | grep `date +%D`



Find and execute
Suppose we have a lot of tarballs, and we want to find them all:

find . -name '*.gz'
will locate all the gzip archives in the current path. But suppose we want to check they are valid archives? The gunzip -vt option will do this for us, but we can cunningly combine both operations, using xargs:

find . -name '*.gz' | xargs gunzip -vt







 Secure logout

 When you are using a console on a shared machine, or indeed, just on your own desktop, you may find that when you logout, the screen still shows a trace of who was logged in and what you were doing. A lot of distros will clear the screen, but some don't. You can solve this by editing your ~/.bash_logout file and adding the command:

clear




Hardening ssh
Although SSH is a pretty secure way to connect to your server, there are two simple changes you can make that will boost its security even further. First, you almost certainly don't want people logging in directly as root - instead, they should logon as a normal user, then use the su command to switch over. You can change this simply in the /etc/ssh/ssh_config file by adding the line:

PermitRootLogin  no

Now the only way to get root privilges is through su, which means crackers now need to break two passwords to get full access. While you are editing that file, find the line which says:

Protocol 2, 1
And change it to:
Protocol 2

This removes the option to fallback on the original SSH protocol, now considered very vulnerable.









Password-less ssh


Tired of typing your password every time you log into the server? ssh also supports keys, so you'll only have to type in your password when you log in to the desktop. Generate a keypair on your desktop machine:

ssh-keygen -t dsa -C your.email@ddress
Enter a passphrase for your key. This puts the secret key in ~/.ssh/id_dsa and the public key in ~/.ssh/id_dsa.pub. Now see whether you have an ssh-agent running at present:

echo $SSH_AGENT_PID
Most window managers will run it automatically if it's installed. If not, start one up:

eval $(ssh-agent)
Now, tell the agent about your key:
ssh-add

and enter your passphrase. You'll need to do this each time you log in; if you're using X, try adding

SSH_ASKPASS=ssh-askpass ssh-add
to your .xsession file. (You may need to install ssh-askpass.) Now for each server you log into, create the directory ~/.ssh and copy the file ~/.ssh/id_dsa.pub into it as ~/.ssh/authorized_keys . If you started the ssh-agent by hand, kill it with

ssh-agent -k
when you log out.





env: run a command (useful in scripts)



dd: moving data between files or devices

comm: compare sorted files line by line

split and csplit: splitting files

ab: benchrmarking web servers






how often have you regretted not starting a long-running command in screen? when it's time to go home, yet you're forced to wait till the command finishes executing on production, just because it's running from a your shell.

in such a scenario, i'd press Ctrl-z, followed by bg and disown, close my laptop, and head home.


Ctrl-z: pauses the running process, and throws you back at the shell prompt.

bg: resumes the process in background.

disown: used to remove jobs from the job table, or to mark jobs so that a SIGHUP signal is not sent to them if the parent shell receives it (e.g. if the user logs out)
Then I disown the backgrounded ssh process, so the tunnel doesn't close when I close my terminal window:
disown the process(no more terminal will be owner), so command will be alive even after closing the terminal.



xargs(1) and the -P option usually means you don't need that Hadoop cluster
As a proponent of putting everything in syslog, logger(1) is sorely underused in favor of everyone inventing their own logging and log rotation.





Another tool I recently learned is vmtouch. It might not be installed by default on UNIX or Linux systems. 

You can use it to report how much of a specific file is currently held in the RAM used by the filesystem cache.



http://www.cyberciti.biz/tips/spice-up-your-unix-linux-shell-scripts.html





$ echo {red,yellow,blue,black,pink}_mask
red_mask yellow_mask blue_mask black_mask pink_mask

$echo {"red ","yellow ","blue ","black ","pink "}mask
$echo {red,yellow,blue,black,pink}" mask"
$echo {{yellow,red}_color,blue,green}


$ cp -v /home/f/F/RoR/sample_config_file.conf  /home/f/F/RoR/sample_config_file.conf.bak
$ cp -v /home/f/F/RoR/sample_config_file.conf{,.bak}

`/home/f/F/RoR/sample_config_file.conf' -> `/home/f/F/RoR/sample_config_file.conf.bak'



command substitution which is very helpful at assigning values to variables and especially at shell scripting.

$ ls -lh $(find . |grep txt)
The inner commands in the previous command lists all files with the string txt in their file names. The outer command ls -lh shows the time stamp (creation/modification date), file owner, file size etc of the files containing the string txt in their file names.



Output redirection of standard
------------------------------
When you execute a command which you know will produce a lot of errors such as using find to look for files on the topmost / (slash root) directory knowing full well that you don’t have read access to many directories, such as this one (which assumes you’re looking for the file php.ini):

$ find / -name php.ini
find: /etc/cups/ssl: Permission denied
find: /etc/ssl/private: Permission denied
<other output truncated>

You get the idea. What you can do is to send them to /dev/null if you’re not interested in the error messages like so

$ find / -name php.ini 2> /dev/null



	

