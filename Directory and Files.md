# Directories & Files

## Making a directory with `mkdir`
To make a new directory use **mkdir** as
`sudo mkdir directoryName`

## Changing directory with `cd`
To change a directory use the **cd** command as 
`cd ./directoryName` to go to a inner directory and to move to a parent directory use `cd /directory` like `cd /Home` to go Home or `cd /` to move to the previous one. See the below table for more info

|Command | What it does
----|----
`cd dirNm`|Go to directory
`cd` or `cd ~`|Go to $HOME directory
`cd ..`|Go up a directory
`cd -`|Go to previous directory
`pwd`|Where am I - show current directory
`ls`|List contents of directory
`ls -alh`|What's here - list all files and folders
`mkdir dir_name`|Make a directory
`sudo rm -r dir_name`|Delete a directory and any files it contains

## List the contents of directory with `ls`
To list the contents use `ls ./directory` you can also do `ls ./directory1/directory2` to list the contents of a child directory
whereas just typing `ls` will show the contents of current directory. You can also refer `~` for the home directory 
as ls `~/user/documents` 

## Using `nano`
`nano` is a text editor that can be used to read/write files in the console, you can use `sudo nano filename` to open a file where
the file is in current directory. To save a file press `Ctrl+O` and to exit nano `Ctrl+X`

## Move/Rename file/folder with `mv`
Use the **MV** command to move a file or directory as `sudo mv <currentPath/filename> <newPath/filename>` Make sure the file/directory name is same else the  **mv** command will rename the file/directory. 

Command| What it does
----|----
`rm somefilename.*`|Remove file or files
`mv {old-dir-name} {new-dir-name}`|Move or rename file
`cp existing_file.txt new_file.txt`|Copy file
`wget http://downloads.somedomain.com/...`|Download file

# Linux Directory Structure

|Directory   |Description
----|----
`/`          |Primary hierarchy root and root directory of the entire file system hierarchy.
`/bin` |Essential command binaries that need to be available in single user mode; for all users, e.g., cat, ls, cp.
`/boot`|Boot loader files, e.g., kernels, initrd.
`/dev`|Essential device files, e.g., /dev/null.
`/etc`|Host-specific system-wide configuration files
`/etc/opt`|Configuration files for add-on packages that are stored in /opt.
`/etc/sgml`|Configuration files, such as catalogs, for software that processes SGML.
`/etc/X11`|Configuration files for the X Window System, version 11.
`/etc/xml`|Configuration files, such as catalogs, for software that processes XML.
`/home`|Users' home directories, containing saved files, personal settings, etc.
`/lib`|Libraries essential for the binaries in /bin and /sbin.
`/lib<qual>`|Alternate format essential libraries. Such directories are optional, but if they exist, they have some requirements.
`/media`|Mount points for removable media such as CD-ROMs (appeared in FHS-2.3 in 2004).
`/mnt`|Temporarily mounted filesystems.
`/opt`|Optional application software packages.
`/proc`|Virtual filesystem providing process and kernel information as files. In Linux, corresponds to a procfs mount. Generally automatically generated and populated by the system, on the fly.
`/root`|Home directory for the root user.
`/run`|Run-time variable data: Information about the running system since last boot, e.g., currently logged-in users and running daemons.
`/sbin`|Essential system binaries, e.g., fsck, init, route.
`/srv`|Site-specific data served by this system, such as data and scripts for web servers, data offered by FTP servers, and repositories for version control systems (appeared in FHS-2.3 in 2004).
`/sys`|Contains information about devices, drivers, and some kernel features.[7]
`/tmp`|Temporary files (see also /var/tmp). Often not preserved between system reboots, and may be severely size restricted.
`/usr`|Secondary hierarchy for read-only user data; contains the majority of (multi-)user utilities and applications.[8]
`/usr/bin`|Non-essential command binaries (not needed in single user mode); for all users.
`/usr/include`|Standard include files.
`/usr/lib`|Libraries for the binaries in /usr/bin and /usr/sbin.
`/usr/lib<qual>`|Alternate format libraries, e.g. /usr/lib32 for 32-bit libraries on a 64-bit machine (optional).
`/usr/local`|Tertiary hierarchy for local data, specific to this host. Typically has further subdirectories, e.g., bin, lib, share.[9]
`/usr/sbin`|Non-essential system binaries, e.g., daemons for various network-services.
`/usr/share`|Architecture-independent (shared) data.
`/usr/src`|Source code, e.g., the kernel source code with its header files.
`/usr/X11R6`|X Window System, Version 11, Release 6 (up to FHS-2.3, optional).
`/var`|Variable files—files whose content is expected to continually change during normal operation of the system—such as logs, spool files, and temporary e-mail files.
`/var/cache`|Application cache data. Such data are locally generated as a result of time-consuming I/O or calculation. The application must be able to regenerate or restore the data. The cached files can be deleted without loss of data.
`/var/lib`|State information. Persistent data modified by programs as they run, e.g., databases, packaging system metadata, etc.
`/var/lock`|Lock files. Files keeping track of resources currently in use.
`/var/log`|Log files. Various logs.
`/var/mail`|Mailbox files. In some distributions, these files may be located in the deprecated /var/spool/mail.
`/var/opt`|Variable data from add-on packages that are stored in /opt.
`/var/run`|Run-time variable data. This directory contains system information data describing the system since it was booted.In FHS 3.0, /var/run is replaced by /run; a system should either continue to provide a /var/run directory, or provide a symbolic link from /var/run to /run, for backwards compatibility.
`/var/spool`|Spool for tasks waiting to be processed, e.g., print queues and outgoing mail queue.
`/var/spool/mail`|Deprecated location for users' mailboxes.[12]
`/var/tmp`|Temporary files to be preserved between reboots.

## Backup & Restore with `dd`

### To backup a drive as img file
```bash
sudo dd if=/dev/sda of=backup.img bs=1M
```

### To restore img file to drive
```bash
sudo dd bs=4M if=backup.img of=/dev/mmcblk0
```
if `pv` is installed you may use
```bash
dd bs=4M if=backup.img | pv | dd of=/dev/sda
```
