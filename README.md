# Bash-On Debian/Raspbian
Hand full of bash &amp; linux commands


## What is `.bashrc` 

It's a shell script that Bash runs whenever it is started interactively. You can put any command in that file that you could type at the command prompt.
You put commands here to set up the shell for use in your particular environment, or to customize things to your preferences. A common thing to put in .bashrc are aliases that you want to always be available.
`sudo nano ~/.barc`

## Creating a new user with Sudo privileges `adduser`
There is a command usermod, which could be used to do this if you first created a root password. But there are a lot of reasons for not creating a root password (mostly security and “best practice” related – and people still disagree about it).
You can’t use usermod to modify the id you are currently using, so the only way to do it is to create a new user and give it the same privileges (ie make it a sudo user).

The easiest way to do this is from the command line `sudo adduser username` where username is the name you give your new user.Adduser will also create a home directory for the new user at /home/username. After that you can give them sudo privileges by editing the sudoers file.
`sudo visudo` Use the cursor keys to navigate to the line ** User previlede specification** and copy the same priviledge as
`username ALL=(ALL) ALL` then save/close the file and reboot with the new user

## Removing a user `deluser`
You can use `sudo deluser usernamer` to delete just the user account. You don’t have to, but if you want to remove the /home/user directory as well, use `sudo deluser -remove-home username` this will remove all traces of user from the system

