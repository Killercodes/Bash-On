# DOS commands and their UNIX equivalents

DOS Command	|UNIX Equivalent	|Effect
--|--|--
`ASSIGN`|	`ln`|	link file or directory
`ATTRIB`|	`chmod`|	change file permissions
`CD`|	`cd`|	change directory
`CHDIR`|	`cd`|	change directory
`CLS`|	`clear`|	clear screen
`COMP`|	`diff`, `comm`, `cmp`|	file compare
`COPY`|	`cp`|	file copy
`Ctl-C`|	`Ctl-C`|	break (signal)
`Ctl-Z`|	`Ctl-D`|	EOF (end-of-file)
`DEL`|	`rm`|	delete file(s)
`DELTREE`|	`rm -rf`|	delete directory recursively
`DIR`|	`ls -l`|	directory listing
`ERASE`|	`rm`|	delete file(s)
`EXIT`|	`exit`|	exit current process
`FC`|	`comm, cmp`|	file compare
`FIND`|	`grep`|	find strings in files
`MD`|	`mkdir`|	make directory
`MKDIR`	|`mkdir`|	make directory
`MORE`|	`more`|	text file paging filter
`MOVE`|	`mv`|	move
`PATH`|	`$PATH`|	path to executables
`REN`|	`mv`|	rename (move)
`RENAME`|	`mv`|	rename (move)
`RD`|	`rmdir`|	remove directory
`RMDIR`|	`rmdir`|	remove directory
`SORT`|	`sort`|	sort file
`TIME` |	`date`|	display system time
`TYPE` |	`cat` |	output file to stdout`
`XCOPY`|	`cp`|	(extended) file copy


So if you are moving from DOS to Linuz the following enteries in `.bashrc` will help you a lo

``` bash
alias ASSIGN='ln'	#link file or directory
alias ATTRIB='chmod'	#change file permissions
alias CHDIR='cd'	#change directory
alias CLS='clear'	#clear screen
alias COMP='diff'
alias comp3='cmp'	#file compare
alias COPY='cp'	#file copy
alias DEL='rm'	#delete file(s)
alias DELTREE='rm -rf'	#delete directory recursively
alias DIR='ls -l'	#directory listing
alias ERASE='rm'	#delete file(s)
alias FC='comm' # cmp	file compare
alias FIND='grep'	find strings in files
alias MD='mkdir'	#make directory
alias MOVE='mv'	#move
alias PATH='$PATH'	#path to executables
alias REN='mv'	#rename (move)
alias RENAME='mv'	#rename (move)
alias RD='rmdir'	#remove directory
alias SORT='sort'	#sort file
alias TIME='date'	#display system time
alias TYPE='cat'	#output file to stdout
alias XCOPY='cp'	#(extended) file copy
```
