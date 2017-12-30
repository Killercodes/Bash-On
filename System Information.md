# System Information

Command|Description
----|----
`uname -a`|Displays all the system information like kernel, release date, operating system & processor
'uptime`| Shows how long the system have been running and the system load 
`hostname` | Shows the system hostname it can be used with `hostname -I` to show the ip address
'last reboot` | Shows the system reboot history
`date`| Shows the date with timezone
`cal`| Shows the calender
`dmesg` | Print the kernel ring buffer with boot log
`cat /proc/cpuinfo`| Prints the cpu information for all the cores
`cat /proc/meminfo`| Prints the memory information
`cat /proc/interrupts`| Prints the number of interrupts per cpu & I/O device
`lsblk`| Lists the bloack devices
`free -m`|Display amount of free and used memory in the system in megabytes
`id`| Shows the active user id with login & group
`last`| Shows listing of last logged in users
`who`| Shows who is logged into the system
`ps`| Shows the current active process with the user, `ps aux` you can see all the process and filter it with grep as `ps aux|grep 'bash'` will show all the process with **bash**
`

