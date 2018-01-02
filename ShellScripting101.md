# What is shell 
Shell is a user program or it’s environment provided for user interaction.It's an command language interpreter that executes commands read from the standard input device or from a file.

# What is Shell scripting ?

Shell script is a script like *dos's bat file* that executes series of commands when the file is executed in the shell.

## How to write 

You can make use of any text editor with `nano` you can do `sudo nano script1` to create a script file and write the script there. 
Like 
``` bash
#!/bin/bash
# My first shell script, this is a comment

clear # command to clear the the screen

echo "Hello World" # echo command prints whatever comes after it

# cat can also be used to print multplie lines as 
cat << END
line 1
line 2
line 3
END
```

## what is #!/bin/bash
Linux comes with different kinds of shells as 
- `sh` or Bourne Shell
- `bash` or Bourne Again shell
- `csh` or C shell
- `tcsh` or TENEX C shell
- `ksh` or the Korn shell

... [ToDo] someting more here

## How can i define variable 
Variables can be defiend without a keyword, atlhough it must start from letters and are case sensetive as follows
Do make sure that there should be no spaces between the variable and the value 
``` bash
#!/bin/bash
 
x=10            #NOT x = 10 no spaces
X=20            #variables are case sensitive
```

## How can i define a null
Extending the same example above you can define a `null` by not providing any valuees to it as
``` bash
#!/bin/bash
 
x=10            #NOT x = 10 no spaces
X=20            #variables are case sensitive
$y=             #NULL variable
```

## How to redirect the output to a file or something
It follows the same rule of the dos commands 
Command | Description
----|----
`>`| To output Linux-commands result to file.
`>>`| To output Linux-commands result to END of file.
`<`| To take input to Linux-command from file instead of keyboard.

See the below example to clear out your mind
``` bash
#!/bin/bash
clear # clear screen
echo "ls > flist will put the output from ls to a file called flist"
ls > flist
 
echo "ls -la >> flist will append the output to the end of the file flist"
ls -la >> flist
 
echo "cat < flist will input all the text in the file flist into the cat command "
cat < flist
```




