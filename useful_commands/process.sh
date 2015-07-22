pstree : Prints running processes with child processes, recursively.

screen : Detach and Reattach, long running process from a session.

ps -LF -u user_name : Outputs Processes and Threads of a user.


list all the processes on the box not being run by you:
------------------------------------------------------
ps aux | grep -v 'whoami'

to be a little more clever, why not just list the top ten time-wasters:
-----------------------------------------------------------------------
ps aux  --sort=-%cpu | grep -m 11 -v 'whoami' 




how often have you regretted not starting a long-running command in screen? 
when it is time to go home, yet you are forced to wait till the command finishes executing on production, 
just because it is running from a your shell.
------------------------------------------------------------------------------------------------------

in such a scenario, i would press Ctrl-z, followed by bg and disown, close my laptop, and head home.


Ctrl-z: pauses the running process, and throws you back at the shell prompt.

bg: resumes the process in background.

disown: disown the process(no more terminal will be owner), 
		so command will be alive even after closing the terminal.
		Used to remove jobs from the job table, or to mark jobs so that a SIGHUP signal is not sent to 
		them if the parent shell receives it (e.g. if the user logs out)
		Then I disown the backgrounded ssh process, 
		so the tunnel does not close when I close my terminal window.


   								OR

disown -a && exit command : Run a command in background, even after terminal session is closed.

