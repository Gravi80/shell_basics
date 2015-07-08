#!/bin/bash

# Scripts can be written for all kinds of interpreters — bash, tsch, zsh, or other shells, or for Perl, Python, and so on.

# The "#!" combo is called a shebang by most Unix geeks. 
# This is used by the shell to decide which interpreter to run the rest of the script.

#Read an Input From KeyBoard

echo -n  What is ur Name?=  # -n is for being in same line
read NAME # read from Command Line and store it in varaible NAME
echo Hello there $NAME

echo 'Press any key to continue....'
read -n 1


#Result Back FRom System Commands
echo 'You are running' $(lsb_release -sd) 'with kernel' $(uname --r)


