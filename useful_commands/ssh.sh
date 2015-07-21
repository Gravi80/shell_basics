sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist

sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist


Hardening ssh
--------------
you don't want people logging in directly as root - instead, they should logon as a normal user, 
then use the su command to switch over. 
You can change this simply in the /etc/ssh/ssh_config file by adding the line:

PermitRootLogin  no



Password-less ssh
-----------------
Tired of typing your password every time you log into the server? 

ssh also supports keys, so you'll only have to type in your password when you log in to the desktop. 
Generate a keypair on your desktop machine:

ssh-keygen -t dsa -C your.email@ddress

Enter a passphrase for your key. 
This puts the secret key in ~/.ssh/id_dsa and the public key in ~/.ssh/id_dsa.pub. 


Now see whether you have an ssh-agent running at present:
echo $SSH_AGENT_PID

Most window managers will run it automatically if it's installed. If not, start one up:
eval $(ssh-agent)

Now, tell the agent about your key:
ssh-add
and enter your passphrase. 

You'll need to do this each time you log in; if you are using X, try adding
SSH_ASKPASS=ssh-askpass ssh-add
to your .xsession file. 
(You may need to install ssh-askpass.) 
Now for each server you log into, create the directory ~/.ssh and copy the file ~/.ssh/id_dsa.pub 
into it as ~/.ssh/authorized_keys . 
If you started the ssh-agent by hand, kill it with

ssh-agent -k
when you log out.

