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
# filename:helloworld

clear # command to clear the the screen

echo "Hello World" # echo command prints whatever comes after it

# cat can also be used to print multplie lines as 
cat << END
line 1
line 2
line 3
END
```

## I wrote the script but not able to execute it

That's because you don't have premissions to execute it, after writing shell script one need to set execute permission for your script.
You may read about `chmod` in the previous sections.
``` bash
chmod +x helloworld
#or
chmod 755 helloworld
or
chmod 777 helloworld
```
to execute it type `./helloworld`

## what is #!/bin/bash
Linux comes with different kinds of shells as 
- `sh` or Bourne Shell
- `bash` or Bourne Again shell
- `csh` or C shell
- `tcsh` or TENEX C shell
- `ksh` or the Korn shell

... [ToDo] someting more here

## How can i define variable 
Variables can be defined without a keyword, atlhough it must start from letters and are case sensetive as follows
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
## How to pass parameter to the shell
You can pass the the parameter in the command line argument or can read it from the standard input 

### Passing command line arguments
The `$` is used to hold the command line arguments passed to it jist like in dos it was `%`. So the first argument will be given the placeholder `$1` and the second will get `$0` and it goes so on. As per limitation it goes from 0-9 that means you can pass 9 parameters to your script as `$1...$9` where the first parameter `$0` will always refers to the script file itself. 
`$*` or `$@` can also be used to concartinate all the parameters passed to it and `$#` will have the count of parameters passed to the script.

``` bash
#!/bin/bash
echo "Argument Count $#"
echo "$0 is script name"
echo "$1  - 1st arg"
echo "$2  - 2nd argument"
echo "All args -  $* or $@"
```

### Reading from the Standard input 
You can use the `read` to read a line from standard input and use it as a variable once the script runs as
``` bash
#!/bin/bash
# read name from standard input after the script execution 

echo "Please type your Name: "
read myname
echo "Hello $myname, you are awesome."
```
Here the variable `myname` is defined as a placeholder and once the script runs it prints the message and waits for the keyboard input after that it uses `$` to display the name as `$myname`



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




