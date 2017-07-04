http://www.mitchchn.me/2014/os-x-terminal/?x


brew
----
brew gives you easy access to thousands of free utilities and libraries from the open source community.

$brew install archey
# a cool little script for displaying your Mac’s specs next to a colourful Apple logo. 

# It keeps all its files in a single directory:
# /usr/local/



open
-----
$open /Applications/Safari.app/
$open .
# You can set the -a flag to choose the app yourself, or -e to open the file for editing in TextEdit.


pbcopy and pbpaste
-------------------
These two commands let you copy and paste text from the command line.

Using pbcopy with pipes is a great way to capture the output of a command without having to 
scroll up and carefully select it.

$ls ~ | pbcopy
# will copy a list of files in your home directory to the OS X clipboard.

# You can easily capture the contents of a file:
$pbcopy < blogpost.txt


# This hacked-up script will grab the link of the latest Google doodle and copy it to your clipboard.
$curl http://www.google.com/doodles#oodles/archive | grep -A5 'latest-doodle on' | grep 'img src' | sed s/.*'<img src="\/\/'/''/ | sed s/'" alt=".*'/''/ | pbcopy



# For instance, if you want to save email subject lines to a task list, 
# you could copy the subjects from Mail.app and run:
$pbpaste >> tasklist.txt




mdfind
--------
Anything Spotlight can find, mdfind can find too.

# the -onlyin flag can restrict the search to a single directory:
$mdfind -onlyin ~/Documents essay
$mdfind -onlyin . Gemfile

# The mdfind database should stay up to date in the background, but you can also troubleshoot it 
# (as well as Spotlight) using mdutil. 
# If Spotlight isn’t working the way it should, 
# mdutil -E 
# will erase the index and rebuild it from scratch. 
# You can also turn off indexing entirely with mdutil -i off.



launchctl
----------
launchctl lets you interact with the OS X init script system, launchd.
With launch daemons and launch agents, you can control the services that start up when you boot your computer.
You can even set up scripts to run periodically or at timed intervals in the background, similar to cron 
jobs on Linux.

# For example, if you’d like to have the Apache web server start automatically when you turn on your Mac, simply type:
$ sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist

# Running
$ launchctl list
# will show you what launch scripts are currently loaded.


$ sudo launchctl unload [path/to/script]
# will stop and unload running scripts, and adding the 
# -w flag will remove those scripts permanently from your boot sequence.


# Launchd scripts are stored in the folllowing locations:
~/Library/LaunchAgents    
/Library/LaunchAgents          
/Library/LaunchDaemons
/System/Library/LaunchAgents
/System/Library/LaunchDaemons





screencapture
--------------
screencapture lets you take many different kinds of screenshots. It’s similar to Grab.app 
and the keyboard shortcuts 
cmd + shift + 3 and cmd + shift + 4, except it’s far more flexible. 

# Capture the contents of the screen, including the cursor, and attach the resulting image (named ‘image.png’) 
# to a new Mail message:
$screencapture -C -M image.png


# Select a window using your mouse, then capture its contents without the window’s drop shadow and copy the 
# image to the clipboard:
$ screencapture -c -W

# Capture the screen after a delay of 10 seconds and then open the new image in Preview:
$ screencapture -T 10 -P image.png

# Select a portion of the screen with your mouse, capture its contents, and save the image as a pdf:
$ screencapture -s -t pdf image.pdf

# To see more options
$ screencapture --help





say
-----
say converts text to speech, using the same TTS engine OS X uses for VoiceOver. 
Without any options, say will simply speak whatever text you give it out loud.

$ say "Never trust a computer you can't lift."

# You can also use say to speak the contents of a text file with the -f flag, 
# and you can store the resulting audio clip with the -o flag:
$ say -f mynovel.txt -o myaudiobook.aiff

# The say command can be useful in place of console logging or alert sounds in scripts. 
# For instance, you can set up an Automator or Hazel script to do batch file processing and then 
# announce the task’s completion with say.

# You can set the voice (and language!) used by say by changing the default setting in the Dictation 
# & Speech panel in System Preferences.




