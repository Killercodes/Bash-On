# Commands Of Termux

> Termux is an Android terminal emulator and Linux environment app that works directly with no rooting or setup required. A minimal base system is installed automatically — additional packages are available using the APT package manager.

## mkdir
`mkdir`  for create directory use command mkdir `mkdir dir_name`

## ls
`ls` to view directory and files on command line use command `ls`

## cat
`cat` command for read any types of files use command `cat file_name`

## cd
`cd` for changing directory use command `cd dir_name`

`cd ..` this command used for return back from current directory

`cd ~` this command used for return back to `$HOME` directory

`cd  usr` ,`cd home` go to termux file system [home /usr]

`cd /sdcard`  this command used for changing the dirctory to _sdcard_ the internal storage of your device 

## mv
`mv`  this command use to move files from one path to another path by using `mv /path/file  /path` where file to be moved.

`mv -v` this command used for moving non-empty directory,for example `mv -v /path/directory  /path` where to move directory .

## cp
`cp`  to copy any files to one directory to another directory as `cp  /path/file  /path` where to copy file.

`cp -R` this command is used for copied non-empty directory to another directory ,we can use `cp -R /path/directory  /path` where to copy non-empty directory.

## rm
`rm` this command is used for remove any single files 
`rm -rf`  this command is used for remove non-empty directory 

## ping
`ping` The ping command helps to verify IP-level connectivity. When troubleshooting, you can use ping to send an ICMP echo request to a target host name or IP address. 

## stop a program
`ctrl +C` to stop any program

## ifconfig
`ifconfig` this command is used for check your device ip address

## clear
`clear` this command is used for clear the terminal

## clear
`find`  this command is used for finding files and directory from the terminal

## exit
`exit` for exit the terminal  or use `ctrl+d`

## UPDATE 
`apt update`

## Check whether termux is properly installed
```bash
pkg install sl
sl
```
You can see a moving train if all is well

## Know all running processes in Termux
```bash
top
```
## Display text in a different style
```bash
apt install figlet

figlet anyword
```

## See Matrix background animation on Termux
```bash
apt install cmatrix

cmatrix + ENTER
```

## Find factors of a number
```bash
pkg install coreutils

factor 1337
```
## Go to the friendly interactive shell, fish
```bash
apt install fish
fish+ENTER
```

## To see text in colorful style
```bash
apt install toilet

toilet -f mono12 -F green BugBounty
```
## To open any site in termux
```bash
apt install w3m

w3m google.com
```
## Installing Metasploit in Termux
```bash
pkg install curl

curl -LO https://raw.githubusercontent.com/Hax4us/Metasploit_termux/master/metasploit.sh

chmod 777 metasploit.sh

./metasploit.sh
```

Type|COMMANDS	|USAGE
--|--|--
File	|`cp -v`	|used to prints informative massage
File	|`cp -r`	|used to copy any directory
File	|`mv -u`	|update-move when source is newer than destination
File|`mv -v`	|to move any directory
Directory|`ls -n`	|to display UID and GID directory
Directory|`ls --version`	|to check the version of ls command
Directory|`cd --`	|show last working directory from where we moved
Directory|`ls -l`	|show file action like - modified, date and time, owner of file, permissions Etc.
Directory|`ls help`	|show display how to use "ls" command
|`cp -n`	|no file overwrite
Directory|`cd ~`	|move to users home directory from anywhere
|`mv [file1 name] [new file2 name]`	|move or rename two file at a time
Directory|`cd -`	|move one directory back from current location
|`mv [file name]`	|move any file and folder
Directory|`ls`	|list directory
Directory|`ls -a`	|list all files including hidden files
Directory|`pwd`	|show your current working directory
|`mv -i`	|interactive prompt before overwriting files
Download|`wget [url]`	|install tool , apt install wget
Download|`git clone [url]`	|install any tools with git clone, apt install git
Directory|`ls -al`	|formatted listing with hidden files
|`mv -f`	|force move by overwriting destination files without prompt
Directory|`ls -i`	|Display number of file or directory
|`cp`	|copy any file
Directory|`cd /`	|change to root directory
Directory|`cd`	|change directory
Directory|`cd ..`	|change current directory to parent directory
Download|`curl -O [url]`	|apt install curl
File|`rm`|remove or delete files
File|`rm` [filename]	|remove any text files
Directory|`rmdir [dir name]`	|remove any directory
Directory|`rm -rf`	|force remove a directory or a folder
Directory|`rm -r [name]`	|delete a directory called name
Package|`apt remove [package name]`	|uninstall / remove a package
File|`touch [file name]`	|create new file
Directory|`mkdir [name]`	|create a directory or folder
File|`more [file name]`	|output the contents of file
File|`head [file name]`	|output the first 10 line of file
File|`tail -f [file name]`	|output the contents of file as it grows
Package|`apt install zip`	|install zip file tool
Zip|zip name.zip [file]	|compress file using this commands
Zip|unzip [zip file]	|to unzip file
FTP|ftp	|launch ftp client from terminal
FTP|-p	|use passive mode
FTP|bye	|terminate current ftp session, exit
FTP|ascii	|set file transfer to ascii protocols
FTP|bell	|bell sound after each command
FTP|status	|shows current status about ftp server
FTP|open host	|open a connection to remote host
FTP|remotehelp [cmdname]	|request help from ftp server
FTP|account [password]	|supply a password required by remote
System|uname -m	|used to find the architecture of your device
System|du	|display directory space usage
System|df	|display disk usages
System|cal	|show display calendar
System|w	|show display who is currently online
System|cat /proc/meminfo	|show memory related information
System|cat /proc/cpuinfo	|show cpu information
System|whoami	|show your login name
System|fingure username	|shows information about user
System|date	|show the current date and time
System|uptime	|show the system current uptime
System|man |command	show manual a command
System|free	|display memory and swap usage
System|kill	|send signal to process
System|kill- l	|list all of the signal that are possible to send with kill
System|lspci	|show PCI devices
System|lsusb	|show usb devices
Package|apt search [qurey] |search for package
Package|pkg search [qurey]	|find a package
Search|locate [file]	|find all files with filename
Search|locate [query]	|find all path names contains a pharse
Search|whereis [command]	|find location binary /source/man file for a command
Search|which [command]	|find of an executable
File|grep pattern [files]	|searching for pattern in files
File|grep -r pattern files	|searching for certain pattern in files
File| grep pattern	|search for pattern in the output of command
Search|find / -atime40	|to find all the files, which are accessed 40 days back
Search|find / -cmin -60	|find change files in last 1 hour
Search|find / -type d -name mll	|find all directories whose name is mll in directory
Search|find . -type f -perm 0777 -print	|find all tghe files, whose permission are 777
Network|ifconfig	|shows all configuration a network interface like ip, mac
Network|ifconfig eth0	|used view the network setting on the interface eth0
Network|ifconfig wlan0	|view the network setting on wlan0
Network|ping [host]	|to ping host ip and show results
Network|arp	|check network card & show ip adress
Network|host	|display specific server
Network|netstat	|review network connection
Network|nslookup	|find out DNS related query
Network|tracerout ipadress	|display number of hops & respone time to get to a remote system and website
Network|whois domain	|get whois information of domain
Network|telnet [ip address [post]	|telnet connection
Network|dig domain	|get DNS information of domain
File|scp	|copies file, over a source
System|uname -a	|used to display kernal information
Search|whereis app	|shows possible location for an app
Tool|nano [file name]	|display and edit text files
Package|apt show	|view package information
File|append [local-file] |remote file	append a local file to one on the remote
System|$	|execute a macro
