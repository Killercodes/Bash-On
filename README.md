# Bash-On Debian/Raspbian
Hand full of bash &amp; linux commands


## Heard about `bash` but what is `.bashrc` ? 

It's a shell script that Bash runs whenever it is started interactively. You can put any command in that file that you could type at the command prompt.
You put commands here to set up the shell for use in your particular environment, or to customize things to your preferences. A common thing to put in .bashrc are aliases that you want to always be available.
`sudo nano ~/.barc`

## Creating a new user with Sudo privileges `adduser`
*When you don't want to live like `pi`*

There is a command usermod, which could be used to do this if you first created a root password. But there are a lot of reasons for not creating a root password (mostly security and “best practice” related – and people still disagree about it).
You can’t use usermod to modify the id you are currently using, so the only way to do it is to create a new user and give it the same privileges (ie make it a sudo user).

The easiest way to do this is from the command line `sudo adduser username` where username is the name you give your new user.Adduser will also create a home directory for the new user at /home/username. After that you can give them sudo privileges by editing the sudoers file.
`sudo visudo` Use the cursor keys to navigate to the line ** User previlede specification** and copy the same priviledge as
`username ALL=(ALL) ALL` then save/close the file and reboot with the new user

## Removing a user `deluser`
*Life of pi ends here*

You can use `sudo deluser usernamer` to delete just the user account. You don’t have to, but if you want to remove the /home/user directory as well, use `sudo deluser -remove-home username` this will remove all traces of user from the system. For example `sudo deluser pi`

## ROOT user with `SUDO`
*Don't wanna live as 2nd class citizen*

Most users are allowed to run most programs, and to save and edit files stored in their own home folder. Normal users are not normally allowed to edit files in other users' folders or any of the system files. There's a special user in Linux known as the superuser, which is usually given the username `root`. The superuser has unrestricted access to the computer and can do almost anything.

You won't normally log into the computer as `root`, but you can use the `sudo` command to provide access as the superuser. If you log into your Raspberry Pi as the pi user, then you're logging in as a normal user. You can run commands as the `root` user by using the `sudo` command before the program you want to run.

### How to `sudo`

You can also run a superuser shell by using `sudo su`. When running commands as a superuser there's nothing to protect against mistakes that could damage the system. It's recommended that you only run commands as the superuser when required, and to exit a superuser shell when it's no longer needed.

One can also use `sudo -s` to get a super shell and quit by typing `exit` or by `sudo su -` the `su` will enable you to impersonate the other users in the system with `sudo su user1` when you are `user2`

### Who can use sudo?

It would defeat the point of the security if anyone could just put sudo in front of their commands, so only approved users can use sudo to gain administrator privileges. The pi user is included in the `sudoers` file of approved users. To allow other users to act as a superuser you can add the user to the sudo group with `usermod`, edit the `/etc/sudoers` file, or add them using `visudo`.

## Session management
*Who is that guy in my system *

### Impersonate with `su`

The `su` stands forshort for **substitute user** makes it possible to change a login session's owner without logging-out from the current session with `su userName`. typing `su` will change the session to `root` but it will ask for password, if you don't have password for `root` use `su root` or simply `su -` to have the root sesson.

### Now `whoami`

Changing sesson will be a bit confusing sometime althogh it is reflected back in prompt but you can make sure with `whoami` which return the current user who executes it

### Know who is there with `w`

The `w` commands shows who is logged in to the system and what they are doing.


## Process mgmt
*Oh i am missing `Ctrl+Alt+Del`*

### Show he currently running process with `pstree`

The `pstree` displays the processes (i.e., executing instances of programs) on the system in the form of a tree diagram. 

### Get the process status with `ps`

The `ps` command is used to provide information about the currently running processes, including their process identification numbers (PIDs). it comes with handful of options like `ps all` will show process info but there is also `htop` which is highly interactive application to search filter and kill processes running in the system.

### `htop` the task manager
*Wanna kill `iexplore.exe`, be the killer again*

If you are missing the windows task manager that shows all the running taskas so that you can kill them ;) type `htop` by pressing `f4` you can filter the running process and even kill them.


## The `SSH` problem
*Going headless you are blind until `ssh`, How about a nifty surgery*  

[How to enable `ssh` when the official way fails](https://github.com/Killercodes/Bash-On/blob/master/SSH%20in%20headless%20Raspbian.md)

## FileSystem
*Where are  my files & docs*

[Read about commands to manipulate files and directories here](https://github.com/Killercodes/Bash-On/blob/master/Directory%20and%20Files.md)

## Install & Uninstall packages
*I can't live without free software and i don't see them*

[Read how to install & uninstall packages in raspbian](https://github.com/Killercodes/Bash-On/blob/master/Installing%20and%20uninstalling%20packages.md)

