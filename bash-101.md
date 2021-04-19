# BASH 101
- [BASH 101](#bash-101)
- [Hello World](#hello-world)
- [Variables](#variables)
  - [Defining Variables](#defining-variables)
  - [Read-only Variables](#read-only-variables)
  - [Unsetting Variables](#unsetting-variables)
  - [Referencing the variables](#referencing-the-variables)
  - [Variable Types](#variable-types)
    - [Local Variables](#local-variables)
    - [Environment Variables](#environment-variables)
    - [Shell Variables](#shell-variables)
  - [Special Variables](#special-variables)
- [Command Line Arguments](#command-line-arguments)
  - [Special Variables in Arguments](#special-variables-in-arguments)
  - [Special Parameters $* and $@](#special-parameters--and-)
  - [Exit Status](#exit-status)
- [Arrays](#arrays)
  - [Defining Array Values](#defining-array-values)
  - [Accessing Array Values](#accessing-array-values)
  - [Array-Comparison](#array-comparison)
- [Basic Operators](#basic-operators)
  - [Arithmetic Operators](#arithmetic-operators)
  - [Relational Operators](#relational-operators)
  - [Boolean Operators](#boolean-operators)
  - [String Operators](#string-operators)
  - [File Test Operators](#file-test-operators)
- [Basic String Operations](#basic-string-operations)
  - [String Length](#string-length)
  - [Index](#index)
  - [Substring Extraction](#substring-extraction)
  - [Simple data extraction example:](#simple-data-extraction-example)
  - [Substring Replacement](#substring-replacement)
- [Decision Making](#decision-making)
  - [The if...fi statement](#the-iffi-statement)
  - [The if...else...fi statement](#the-ifelsefi-statement)
  - [The if...elif...fi statement](#the-ifeliffi-statement)
  - [Types of numeric comparisons](#types-of-numeric-comparisons)
  - [Types of string comparisons](#types-of-string-comparisons)
  - [Logical combinations](#logical-combinations)
  - [The case...esac Statement](#the-caseesac-statement)
  - [Simple case bash structure](#simple-case-bash-structure)
- [Loops](#loops)
  - [The for Loop](#the-for-loop)
    - [For loop with Directory & Files](#for-loop-with-directory--files)
  - [The while Loop](#the-while-loop)
  - [The until Loop](#the-until-loop)
  - [The select Loop](#the-select-loop)
  - [The infinite Loop](#the-infinite-loop)
  - ["break" and "continue" statements](#break-and-continue-statements)
  - [The break Statement](#the-break-statement)
  - [The continue statement](#the-continue-statement)
  - [Nesting Loops](#nesting-loops)
  - [Nesting while Loops](#nesting-while-loops)
- [Shell Functions](#shell-functions)
  - [Creating a function](#creating-a-function)
  - [Calling a function](#calling-a-function)
  - [Pass Parameters to a Function](#pass-parameters-to-a-function)
  - [Returning Values from Functions](#returning-values-from-functions)
  - [Nested Functions](#nested-functions)
  - [Function Call from Prompt](#function-call-from-prompt)
- [Bash Trap Command](#bash-trap-command)
- [File Testing](#file-testing)
  - [use "-e" to test if file exist](#use--e-to-test-if-file-exist)
  - [use "-d" to test if directory exists](#use--d-to-test-if-directory-exists)
  - [use "-r" to test if file has read permission for the user running the script/test](#use--r-to-test-if-file-has-read-permission-for-the-user-running-the-scripttest)
- [Pipelines](#pipelines)
- [Process Substitution](#process-substitution)
  - [Output](#output)
  - [Input](#input)



# Hello World

The tutorial discusses shell programming in general with focus on Bash ("Bourne Again Shell") shell as the main shell interpreter. Shell programming using other common shells such as sh, csh, tcsh, will also be referenced, as they sometime differ from bash.

Shell programming can be accomplished by directly executing shell commands at the shell prompt or by storing them in the order of execution, in a text file, called a shell script, and then executing the shell script. To execute, simply write the shell script file name, once the file has execute permission (**`chmod +x filename`**).

The first line of the shell script file begins with a "sha-bang" (**#!**) which is not read as a comment, followed by the full path where the shell interpreter is located. This path, tells the operating system that this file is a set of commands to be fed into the interpreter indicated. Note that if the path given at the "sha-bang" is incorrect, then an error message e.g. "Command not found.", may be the result of the script execution. It is common to name the shell script with the **".sh"** extension. The first line may look like this:
``` bash
#!/bin/bash
```
Adding comments: any text following the `"#"` is considered a comment

To find out what is currently active shell, and what is its path, type the highlighted command at the shell prompt (sample responses follow):
``` bash
ps | grep $$

987 tty1 00:00:00 bash
```
This response shows that the shell you are using is of type 'bash'. next find out the full path of the shell interpreter
``` bash
which bash

/bin/bash
```
This response shows the full execution path of the shell interpreter. Make sure that the "sha-bang" line at the beginning of your script, matches this same execution path.

# Variables
Shell variables are created once they are assigned a value. A variable can contain a number, a character or a string of characters. Variable name is case sensitive and can consist of a combination of letters and the underscore "_". Value assignment is done using the "=" sign. Note that no space permitted on either side of = sign when initializing variables.
``` bash
PRICE_PER_APPLE=5
MyFirstLetters=ABC
greeting='Hello        world!'
```

## Defining Variables
Variables are defined as follows −
```
variable_name=variable_value
```
``` bash
NAME="Abcd"
```
The above example defines the variable NAME and assigns the value "Abcd" to it. Variables of this type are called scalar variables. A scalar variable can hold only one value at a time.

Shell enables you to store any value you want in a variable. For example −
```
VAR1="Abcd"
VAR2=100
```


## Read-only Variables
Shell provides a way to mark variables as read-only by using the read-only command. After a variable is marked read-only, its value cannot be changed.

For example, the following script generates an error while trying to change the value of NAME −
``` bash
#!/bin/sh

NAME="Abcd"
readonly NAME
NAME="Efgh"
```
The above script will generate the following result −
```
/bin/sh: NAME: This variable is read only.
```

## Unsetting Variables
Unsetting or deleting a variable directs the shell to remove the variable from the list of variables that it tracks. Once you unset a variable, you cannot access the stored value in the variable.

Following is the syntax to unset a defined variable using the **`unset`** command −
``` bash
unset variable_name
```
The above command unsets the value of a defined variable. Here is a simple example that demonstrates how the command works −
``` bash
#!/bin/sh

NAME="Abcd Efgh"
unset NAME
echo $NAME
```
The above example does not print anything. You cannot use the unset command to unset variables that are marked readonly.


## Referencing the variables

A backslash `"\"` is used to escape special character meaning
``` bash
PRICE_PER_APPLE=5
echo "The price of an Apple today is: \$HK $PRICE_PER_APPLE"
```
Encapsulating the variable name with `${}` is used to avoid ambiguity
``` bash
MyFirstLetters=ABC
echo "The first 10 letters in the alphabet are: ${MyFirstLetters}DEFGHIJ"
```
Encapsulating the variable name with `""` will preserve any white space values
``` bash
greeting='Hello        world!'
echo $greeting" now with spaces: $greeting"
```
Variables can be assigned with the value of a command output. This is referred to as substitution. Substitution can be done by encapsulating the command with `` (known as back-ticks) or with `$()`

``` bash
FILELIST=`ls`
FileWithTimeStamp=/tmp/my-dir/file_$(/bin/date +%Y-%m-%d).txt
```
Note that when the script runs, it will run the command inside the `$()` parenthesis and capture its output.

## Variable Types
When a shell is running, three main types of variables are present −

### Local Variables
A local variable is a variable that is present within the current instance of the shell. It is not available to programs that are started by the shell. They are set at the command prompt.

### Environment Variables
An environment variable is available to any child process of the shell. Some programs need environment variables in order to function correctly. Usually, a shell script defines only those environment variables that are needed by the programs that it runs.

### Shell Variables
A shell variable is a special variable that is set by the shell and is required by the shell in order to function correctly. Some of these variables are environment variables whereas others are local variables.

## Special Variables
The following table shows a number of special variables that you can use in your shell scripts −

Vairable | Description
--|--
**`$0`** |The filename of the current script.
**`$n`** | These variables correspond to the arguments with which a script was invoked. Here n is a positive decimal number corresponding to the position of an argument (the first argument is $1, the second argument is $2, and so on).
**`$#`** | The number of arguments supplied to a script.
**`$*`** |All the arguments are double quoted. If a script receives two arguments, $* is equivalent to $1 $2.
**`$@`** |All the arguments are individually double quoted. If a script receives two arguments, $@ is equivalent to $1 $2.
**`$?`**|The exit status of the last command executed.	
**`$$`** | The process number of the current shell. For shell scripts, this is the process ID under which they are executing.
**`$!`** | The process number of the last background command.





``` bash
#!/bin/bash
echo "Script Name: $0"
function func {
    for var in $*
    do
        let i=i+1
        echo "The \$${i} argument is: ${var}"
    done
    echo "Total count of arguments: $#"
}

```

`$@` and `$*` have different behavior when they were enclosed in double quotes.

``` bash
#!/bin/bash
function func {
    echo "--- \"\$*\""
    for ARG in "$*"
    do
        echo $ARG
    done

    echo "--- \"\$@\""
    for ARG in "$@"
    do
        echo $ARG
    done
}
```


# Command Line Arguments
Arguments can be passed to the script when it is executed, by writing them as a space-delimited list following the script file name.

Inside the script, the `$1` variable references the first argument in the command line, `$2` the second argument and so forth. The variable `$0` references to the current script. In the following example, the script name is followed by 6 arguments.
```
./bin/my_shopping.sh apple 5 banana 8 "Fruit Basket" 15
```
``` bash
echo $3 --> results with: banana

BIG=$5

echo "A $BIG costs just $6" --> results with: A Fruit Basket costs just 15
```
The variable `$#` holds the number of arguments passed to the script
``` bash
echo $# --> results with: 6
```
The variable `$@` holds a space delimited string of all arguments passed to the script

## Special Variables in Arguments
Following script uses various special variables related to the command line −
``` bash
#!/bin/sh

echo "File Name: $0"
echo "First Parameter : $1"
echo "Second Parameter : $2"
echo "Quoted Values: $@"
echo "Quoted Values: $*"
echo "Total Number of Parameters : $#"
```
Here is a sample run for the above script −
```
$./test.sh Zara Ali
File Name : ./test.sh
First Parameter : Zara
Second Parameter : Ali
Quoted Values: Zara Ali
Quoted Values: Zara Ali
Total Number of Parameters : 2
```

## Special Parameters $* and $@
There are special parameters that allow accessing all the command-line arguments at once. `$*` and `$@` both will act the same unless they are enclosed in double quotes, `""`.

Both the parameters specify the command-line arguments. However, the `"$*"` special parameter takes the entire list as one argument with spaces between and the `"$@"` special parameter takes the entire list and separates it into separate arguments.

We can write the shell script as shown below to process an unknown number of commandline arguments with either the `$*` or `$@` special parameters −
``` bash
#!/bin/sh

for TOKEN in $*
do
   echo $TOKEN
done
```
Here is a sample run for the above script −
```
$./test.sh Abcd Efgh 10 Years Old
Abcd
Efgh
10
Years
Old
```

## Exit Status
The **`$?`** variable represents the exit status of the previous command.

Exit status is a numerical value returned by every command upon its completion. As a rule, most commands return an exit status of 0 if they were successful, and 1 if they were unsuccessful.

Some commands return additional exit statuses for particular reasons. For example, some commands differentiate between kinds of errors and will return various exit values depending on the specific type of failure.

Following is the example of successful command −
```
$./test.sh Abcd Efgh
File Name : ./test.sh
First Parameter : Abcd
Second Parameter : Efgh
Quoted Values: Abcd Efgh
Quoted Values: Abcd Efgh
Total Number of Parameters : 2
$echo $?
0
$
```


# Arrays
A shell variable is capable enough to hold a single value. These variables are called scalar variables.

Shell supports a different type of variable called an array variable. This can hold multiple values at the same time. Arrays provide a method of grouping a set of variables. Instead of creating a new name for each variable that is required, you can use a single array variable that stores all the other variables.

An array can hold several values under one name. Array naming is the same as variables naming. An array is initialized by assign space-delimited values enclosed in `()`
``` bash
my_array=(apple banana "Fruit Basket" orange)
new_array[2]=apricot
```
Array members need not be consecutive or contiguous. Some members of the array can be left uninitialized.

The total number of elements in the array is referenced by `${#arrayname[@]}`
``` bash
my_array=(apple banana "Fruit Basket" orange)
echo  ${#my_array[@]}                   # 4
```
The array elements can be accessed with their numeric index. The index of the first element is 0.
``` bash
my_array=(apple banana "Fruit Basket" orange)
echo ${my_array[3]}                     # orange - note that curly brackets are needed
# adding another array element
my_array[4]="carrot"                    # value assignment without a $ and curly brackets
echo ${#my_array[@]}                    # 5
echo ${my_array[${#my_array[@]}-1]}     # carrot
```

## Defining Array Values
The difference between an array variable and a scalar variable can be explained as follows.

Suppose you are trying to represent the names of various students as a set of variables. Each of the individual variables is a scalar variable as follows −
``` bash
NAME01="Abcd"
NAME02="Efgh"
NAME03="Ijkl"
NAME04="Mnop"
NAME05="Qrst"
```
We can use a single array to store all the above mentioned names. Following is the simplest method of creating an array variable. This helps assign a value to one of its indices.
```
array_name[index]=value
```
Here **array_name** is the name of the array, index is the index of the item in the array that you want to set, and value is the value you want to set for that item.

As an example, the following commands −
``` bash
NAME[0]="Abcd"
NAME[1]="Efgh"
NAME[2]="Ijkl"
NAME[3]="Mnop"
NAME[4]="Qrst"
```
If you are using the **ksh shell**, here is the syntax of array initialization −
```
set -A array_name value1 value2 ... valuen
```
If you are using the **bash shell**, here is the syntax of array initialization −
```
array_name=(value1 ... valuen)
```

## Accessing Array Values
After you have set any array variable, you access it as follows −
```
${array_name[index]}
```
Here array_name is the name of the array, and index is the index of the value to be accessed. Following is an example to understand the concept −

``` bash
#!/bin/sh

NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
echo "First Index: ${NAME[0]}"
echo "Second Index: ${NAME[1]}"
```
The above example will generate the following result −
```
$./test.sh
First Index: Zara
Second Index: Qadir
```
You can access all the items in an array in one of the following ways −
```
${array_name[*]}
${array_name[@]}
```
Here array_name is the name of the array you are interested in. Following example will help you understand the concept −

``` bash
#!/bin/sh

NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
echo "First Method: ${NAME[*]}"
echo "Second Method: ${NAME[@]}"
```
The above example will generate the following result −
```
$./test.sh
First Method: Zara Qadir Mahnaz Ayan Daisy
Second Method: Zara Qadir Mahnaz Ayan Daisy
```


## Array-Comparison
Comparison of arrays Shell can handle arrays An array is a variable containing multiple values. Any variable may be used as an array. There is no maximum limit to the size of an array, nor any requirement that member variables be indexed or assigned contiguously. 

Arrays are zero-based: the first element is indexed with the number 0.
``` bash
# basic construct
# array=(value1 value2 ... valueN)
array=(23 45 34 1 2 3)
#To refer to a particular value (e.g. : to refer 3rd value)
echo ${array[2]}

#To refer to all the array values
echo ${array[@]}

#To evaluate the number of elements in an array
echo ${#array[@]}
```

# Basic Operators

There are various operators supported by each shell. We will discuss in detail about Bourne shell (default shell) in this chapter.

Bourne shell didn't originally have any mechanism to perform simple arithmetic operations but it uses external programs, either **awk** or **expr**.

The following example shows how to add two numbers −
``` bash
#!/bin/sh

val=`expr 2 + 2`
echo "Total value : $val"
```
The above script will generate the following result −
```
Total value : 4
```
The following points need to be considered while adding −

- There must be spaces between operators and expressions. For example, 2+2 is not correct; it should be written as **2 + 2**.

- The complete expression should be enclosed between **``**, called the backtick.

## Arithmetic Operators

Simple arithmetics on variables can be done using the arithmetic expression: `$((expression))`

``` bash
A=3
B=$((100 * $A + 5)) # 305
```
The basic operators are:

**`a + b` addition (a plus b)**

**`a - b` substraction (a minus b)**

**`a * b` multiplication (a times b)**

**`a / b` division (integer) (a divided by b)**

**`a % b` modulo (the integer remainder of a divided by b)**

**`a ** b` exponentiation (a to the power of b)**


The following arithmetic operators are supported by Bourne Shell.

Assume variable **a** holds **10** and variable **b** holds **20** then −

Operator|	Description	|Example
--|--|--
`+` (Addition)	|Adds values on either side of the operator	|**`expr $a + $b`** will give 30
`-` (Subtraction)	|Subtracts right hand operand from left hand operand|	**`expr $a - $b`** will give -10
`*` (Multiplication)	|Multiplies values on either side of the operator|	**`expr $a \* $b`** will give 200
`/` (Division)	|Divides left hand operand by right hand operand|	**`expr $b / $a`** will give 2
`%` (Modulus)	|Divides left hand operand by right hand operand and returns remainder|	**`expr $b % $a`** will give 0
`=` (Assignment)	|Assigns right operand in left operand	| **`a = $b`** would assign value of b into a
`==` (Equality)	|Compares two numbers, if both are same then returns true.	| **`[ $a == $b ]`** would return false.
`!=` (Not Equality)	|Compares two numbers, if both are different then returns true.|	**`[ $a != $b ]`** would return true.


## Relational Operators
Bourne Shell supports the following relational operators that are specific to numeric values. These operators do not work for string values unless their value is numeric.

For example, following operators will work to check a relation between 10 and 20 as well as in between "10" and "20" but not in between "ten" and "twenty".

Assume variable **a** holds 10 and variable **b** holds 20 then −

Operator|	Description|	Example
--|--|--
**`-eq`**|	Checks if the value of two operands are equal or not; if yes, then the condition becomes true.|	**`[ $a -eq $b ]`** is not true.
**`-ne`**|	Checks if the value of two operands are equal or not; if values are not equal, then the condition becomes true.|	**`[ $a -ne $b ]`** is true.
**`-gt`**|	Checks if the value of left operand is greater than the value of right operand; if yes, then the condition becomes true.| **`[ $a -gt $b ]`** is not true.
**`-lt`**|	Checks if the value of left operand is less than the value of right operand; if yes, then the condition becomes true.	| **`[ $a -lt $b ]`** is true.
**`-ge`**|	Checks if the value of left operand is greater than or equal to the value of right operand; if yes, then the condition becomes true.|	**`[ $a -ge $b ]`** is not true.
**`-le`**|	Checks if the value of left operand is less than or equal to the value of right operand; if yes, then the condition becomes true.|	**`[ $a -le $b ]`** is true.

It is very important to understand that all the conditional expressions should be placed inside square braces with spaces around them. For example, **`[ $a <= $b ]`** is correct whereas, `[$a <= $b]` is incorrect.


## Boolean Operators
The following Boolean operators are supported by the Bourne Shell.

Assume variable **a** holds **10** and variable **b** holds **20** then −

Operator|	Description|	Example
--|--|--
**`!`**	|This is logical negation. This inverts a true condition into false and vice versa.|	**`[ ! false ]`** is true.
**`-o`**	|This is logical OR. If one of the operands is true, then the condition becomes true.|	**`[ $a -lt 20 -o $b -gt 100 ]`** is true.
**`-a`**|	This is logical AND. If both the operands are true, then the condition becomes true otherwise false.|	**`[ $a -lt 20 -a $b -gt 100 ]`** is false.

## String Operators
The following string operators are supported by Bourne Shell.

Assume variable **a** holds **"abc"** and variable **b** holds **"efg"** then −

Operator|	Description|	Example
--|--|--
**`=`**	|Checks if the value of two operands are equal or not; if yes, then the condition becomes true.|	**`[ $a = $b ]`** is not true.
**`!=`**	|Checks if the value of two operands are equal or not; if values are not equal then the condition becomes true.|	**`[ $a != $b ]`** is true.
**`-z`**	|Checks if the given string operand size is zero; if it is zero length, then it returns true.|	**`[ -z $a ]`** is not true.
**`-n`**	|Checks if the given string operand size is non-zero; if it is nonzero length, then it returns true.|	**`[ -n $a ]`** is not false.
**`str`**	|Checks if str is not the empty string; if it is empty, then it returns false.|	**`[ $a ]`** is not false.


## File Test Operators
We have a few operators that can be used to test various properties associated with a Unix file.

Assume a variable file holds an existing file name "test" the size of which is 100 bytes and has read, write and execute permission on −

Operator|	Description|	Example
--|--|--
**`-b`**| file	Checks if file is a block special file; if yes, then the condition becomes true.|	**`[ -b $file ]`** is false.
**`-c`**| file	Checks if file is a character special file; if yes, then the condition becomes true.|	**`[ -c $file ]`** is false.
**`-d`**| file	Checks if file is a directory; if yes, then the condition becomes true.|	**`[ -d $file ]`** is not true.
**`-f`**| file	Checks if file is an ordinary file as opposed to a directory or special file; if yes, then the condition becomes true.|	**`[ -f $file ]`** is true.
**`-g`**| file	Checks if file has its set group ID (SGID) bit set; if yes, then the condition becomes true.|	**`[ -g $file ]`** is false.
**`-k`**| file	Checks if file has its sticky bit set; if yes, then the condition becomes true.|	**`[ -k $file ]`** is false.
**`-p`**| file	Checks if file is a named pipe; if yes, then the condition becomes true.|	**`[ -p $file ]`** is false.
**`-t`**| file	Checks if file descriptor is open and associated with a terminal; if yes, then the condition becomes true.|	**`[ -t $file ]`** is false.
**`-u`**| file	Checks if file has its Set User ID (SUID) bit set; if yes, then the condition becomes true.|	**`[ -u $file ]`** is false.
**`-r`**| file	Checks if file is readable; if yes, then the condition becomes true.|	**`[ -r $file ]`** is true.
**`-w`**| file	Checks if file is writable; if yes, then the condition becomes true.|	**`[ -w $file ]`** is true.
**`-x`**| file	Checks if file is executable; if yes, then the condition becomes true.|	**`[ -x $file ]`** is true.
**`-s`**| file	Checks if file has size greater than 0; if yes, then condition becomes true.|	**`[ -s $file ]`** is true.
**`-e`**| file	Checks if file exists; is true even if file is a directory but exists.|	**`[ -e $file ]`** is true.




# Basic String Operations
The shell allows some common string operations which can be very useful for script writing.

## String Length
``` bash
#       1234567890123456
STRING="this is a string"
echo ${#STRING}            # 16
```

## Index
Find the numerical position in $STRING of any single character in $SUBSTRING that matches. Note that the 'expr' command is used in this case.
``` bash
STRING="this is a string"
SUBSTRING="hat"
expr index "$STRING" "$SUBSTRING"     # 1 is the position of the first 't' in $STRING
```
## Substring Extraction
Extract substring of length `$LEN` from `$STRING` starting after position $POS. Note that first position is 0.
```bash
STRING="this is a string"
POS=1
LEN=3
echo ${STRING:$POS:$LEN}   # his
```
If `:$LEN` is omitted, extract substring from `$POS` to end of line
``` bash
STRING="this is a string"
echo ${STRING:1}           # $STRING contents without leading character
echo ${STRING:12}          # ring
```
## Simple data extraction example:
``` bash
# Code to extract the First name from the data record
DATARECORD="last=Clifford,first=Johnny Boy,state=CA"
COMMA1=`expr index "$DATARECORD" ','`  # 14 position of first comma
CHOP1FIELD=${DATARECORD:$COMMA1}       #
COMMA2=`expr index "$CHOP1FIELD" ','`
LENGTH=`expr $COMMA2 - 6 - 1`
FIRSTNAME=${CHOP1FIELD:6:$LENGTH}      # Johnny Boy
echo $FIRSTNAME
```
## Substring Replacement
``` bash
STRING="to be or not to be"
```
Replace first occurrence of substring with replacement
``` bash
STRING="to be or not to be"
echo ${STRING[@]/be/eat}        # to eat or not to be
```
Replace all occurrences of substring
``` bash
STRING="to be or not to be"
echo ${STRING[@]//be/eat}        # to eat or not to eat
```
Delete all occurrences of substring (replace with empty string)
``` bash
STRING="to be or not to be"
echo ${STRING[@]// not/}        # to be or to be
```
Replace occurrence of substring if at the beginning of $STRING
``` bash
STRING="to be or not to be"
echo ${STRING[@]/#to be/eat now}    # eat now or not to be
```
Replace occurrence of substring if at the end of $STRING
``` bash
STRING="to be or not to be"
echo ${STRING[@]/%be/eat}        # to be or not to eat
```
replace occurrence of substring with shell command output
``` bash
STRING="to be or not to be"
echo ${STRING[@]/%be/be on $(date +%Y-%m-%d)}    # to be or not to be on 2012-06-14
```

# Decision Making
As in popular programming languages, the shell also supports logical decision making.

## The if...fi statement
The basic conditional decision making construct is:
``` bash
if [ expression ];
then 
   Statement(s) to be executed if expression is true 

fi
```

The Shell expression is evaluated in the above syntax. If the resulting value is true, given statement(s) are executed. If the expression is false then no statement would be executed. Most of the times, comparison operators are used for making decisions.

It is recommended to be careful with the spaces between braces and expression. No space produces a syntax error.

If expression is a shell command, then it will be assumed true if it returns 0 after execution. If it is a Boolean expression, then it would be true if it returns true
``` bash
NAME="John"
if [ "$NAME" = "John" ]; then
  echo "True - my name is indeed John"
fi
```
It can be expanded with 'else'
``` bash
NAME="Bill"
if [ "$NAME" = "John" ]; then
  echo "True - my name is indeed John"
else
  echo "False"
  echo "You must mistaken me for $NAME"
fi
```
It can be expanded with 'elif' (else-if)
``` bash
NAME="George"
if [ "$NAME" = "John" ]; then
  echo "John Lennon"
elif [ "$NAME" = "George" ]; then
  echo "George Harrison"
else
  echo "This leaves us with Paul and Ringo"
fi
```
The expression used by the conditional construct is evaluated to either true or false. The expression can be a single string or variable. 

A empty string or a string consisting of spaces or an undefined variable name, are evaluated as false. The expression can be a logical combination of comparisons: negation is denoted by `!`, logical AND (conjunction) is denoted by &&, and logical OR (disjunction) is denoted by ||. Conditional expressions should be surrounded by double brackets [[ ]].

## The if...else...fi statement

The if...else...fi statement is the next form of control statement that allows Shell to execute statements in a controlled way and make the right choice.

Syntax
```
if [ expression ]
then
   Statement(s) to be executed if expression is true
else
   Statement(s) to be executed if expression is not true
fi
```
The Shell expression is evaluated in the above syntax. If the resulting value is true, given statement(s) are executed. If the expression is false, then no statement will be executed.

Example
The above example can also be written using the if...else statement as follows −
``` bash
#!/bin/sh

a=10
b=20

if [ $a == $b ]
then
   echo "a is equal to b"
else
   echo "a is not equal to b"
fi
```
Upon execution, you will receive the following result −
```
a is not equal to b
```

## The if...elif...fi statement

The if...elif...fi statement is the one level advance form of control statement that allows Shell to make correct decision out of several conditions.

**Syntax**
```
if [ expression 1 ]
then
   Statement(s) to be executed if expression 1 is true
elif [ expression 2 ]
then
   Statement(s) to be executed if expression 2 is true
elif [ expression 3 ]
then
   Statement(s) to be executed if expression 3 is true
else
   Statement(s) to be executed if no expression is true
fi
```
This code is just a series of if statements, where each if is part of the else clause of the previous statement. Here statement(s) are executed based on the true condition, if none of the condition is true then else block is executed.

**Example**
``` bash
#!/bin/sh

a=10
b=20

if [ $a == $b ]
then
   echo "a is equal to b"
elif [ $a -gt $b ]
then
   echo "a is greater than b"
elif [ $a -lt $b ]
then
   echo "a is less than b"
else
   echo "None of the condition met"
fi
```
Upon execution, you will receive the following result −
```
a is less than b
```


## Types of numeric comparisons

comparison  |  Evaluated to true when
--|--
**`$a -lt $b`**  |  **$a < $b**
**`$a -gt $b`**  |  **$a > $b**
**`$a -le $b`**  |  **$a <= $b**
**`$a -ge $b`**  |  **$a >= $b**
**`$a -eq $b`**  |  **$a is equal to $b**
**`$a -ne $b`**  |  **$a is not equal to $b**




## Types of string comparisons
comparison  |  Evaluated to true when
--|--
**`"$a" = "$b"`** |    **$a is the same as $b**
**`"$a" == "$b"`**    | **$a is the same as $b**
**`"$a" != "$b"`**    | **$a is different from $b**
**`-z "$a"`**         | **$a is empty**

> note1: whitespace around **=** is required

> note2: use **""** around string variables to avoid shell expansion of special characters as `*`

## Logical combinations
``` bash
if <a href='/en/_%24VAR_A_-eq_1_%26%26_%28%24VAR_B_%3D_%22bee%22_'>| $VAR_T = "tee") </a> ; then
    command...
fi
```

## The case...esac Statement

You can use multiple if...elif statements to perform a multiway branch. However, this is not always the best solution, especially when all of the branches depend on the value of a single variable.

Shell supports case...esac statement which handles exactly this situation, and it does so more efficiently than repeated if...elif statements.

**Syntax**
```
case word in
   pattern1)
      Statement(s) to be executed if pattern1 matches
      ;;
   pattern2)
      Statement(s) to be executed if pattern2 matches
      ;;
   pattern3)
      Statement(s) to be executed if pattern3 matches
      ;;
   *)
     Default condition to be executed
     ;;
esac
```

Here the string word is compared against every pattern until a match is found. The statement(s) following the matching pattern executes. If no matches are found, the case statement exits without performing any action.

There is no maximum number of patterns, but the minimum is one.

When statement(s) part executes, the command **;;** indicates that the program flow should jump to the end of the entire case statement. This is similar to break in the C programming language.

**Example**
``` bash
#!/bin/sh

FRUIT="kiwi"

case "$FRUIT" in
   "apple") echo "Apple pie is quite tasty." 
   ;;
   "banana") echo "I like banana nut bread." 
   ;;
   "kiwi") echo "New Zealand is famous for kiwi." 
   ;;
esac
```
Upon execution, you will receive the following result −
```
New Zealand is famous for kiwi.
```
A good use for a case statement is the evaluation of command line arguments as follows −
``` bash
#!/bin/sh

option="${1}" 
case ${option} in 
   -f) FILE="${2}" 
      echo "File name is $FILE"
      ;; 
   -d) DIR="${2}" 
      echo "Dir name is $DIR"
      ;; 
   *)  
      echo "`basename ${0}`:usage: [-f file] | [-d directory]" 
      exit 1 # Command to come out of the program with status 1
      ;; 
esac 
```
Here is a sample run of the above program −
```
$./test.sh
test.sh: usage: [ -f filename ] | [ -d directory ]
$ ./test.sh -f index.htm
$ vi test.sh
$ ./test.sh -f index.htm
File name is index.htm
$ ./test.sh -d unix
Dir name is unix
$
```

The basic syntax of the case...esac statement is to give an expression to evaluate and to execute several different statements based on the value of the expression.

The interpreter checks each case against the value of the expression until a match is found. If nothing matches, a default condition will be used.

``` bash
case "$variable" in
    "$condition1" )
        command...
    ;;
    "$condition2" )
        command...
    ;;
esac
```

## Simple case bash structure

> Note in this case **$case** is variable and does not have to be named case - this is just an example
``` bash
mycase=1
case $mycase in
    1) echo "You selected bash";;
    2) echo "You selected perl";;
    3) echo "You selected phyton";;
    4) echo "You selected c++";;
    5) exit
esac
```

# Loops

## The for Loop

The for loop operates on lists of items. It repeats a set of commands for every item in a list.

**Syntax**
```
for var in word1 word2 ... wordN
do
   Statement(s) to be executed for every word.
done
```
Here var is the name of a variable and word1 to wordN are sequences of characters separated by spaces (words). Each time the for loop executes, the value of the variable var is set to the next word in the list of words, word1 to wordN.

**Basic construct**
``` bash
# basic construct
for arg in [list]
do
 command(s)...
done
```
**Example**
Here is a simple example that uses the for loop to span through the given list of numbers −

``` bash
#!/bin/sh

for var in 0 1 2 3 4 5 6 7 8 9
do
   echo $var
done
```



For each pass through the loop, arg takes on the value of each successive value in the list. Then the command(s) are executed.
``` bash
# loop on array member
NAMES=(Joe Jenny Sara Tony)
for N in ${NAMES[@]} ; do
  echo "My name is $N"
done

# loop on command output results
for f in $( ls prog.sh /etc/localtime ) ; do
  echo "File is: $f"
done
```

### For loop with Directory & Files
The Following is the example to display all the files starting with .bash and available in your home. We will execute this script from my root −
``` bash
#!/bin/sh

for FILE in $HOME/.bash*
do
   echo $FILE
done
```
The above script will produce the following result −
```
/root/.bash_history
/root/.bash_logout
/root/.bash_profile
/root/.bashrc
```

## The while Loop

The while loop enables you to execute a set of commands repeatedly until some condition occurs. It is usually used when you need to manipulate the value of a variable repeatedly.

**Syntax**
```
while command
do
   Statement(s) to be executed if command is true
done
```
Here the Shell **command** is evaluated. If the resulting value is true, given statement(s) are executed. If command is false then no statement will be executed and the program will jump to the next line after the done statement.

**Example**

Here is a simple example that uses the while loop to display the numbers zero to nine −

``` bash
#!/bin/sh

a=0

while [ $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done
```
Upon execution, you will receive the following result −
```
0
1
2
3
4
5
6
7
8
9
```
Each time this loop executes, the variable a is checked to see whether it has a value that is less than 10. If the value of a is less than 10, this test condition has an exit status of 0. In this case, the current value of a is displayed and later a is incremented by 1.



``` bash
# basic construct
while [ condition ]
do
 command(s)...
done
```
The while construct tests for a condition, and if true, executes commands. It keeps looping as long as the condition is true.
``` bash
COUNT=4
while [ $COUNT -gt 0 ]; do
  echo "Value of count is: $COUNT"
  COUNT=$(($COUNT - 1))
done
```


## The until Loop

The while loop is perfect for a situation where you need to execute a set of commands while some condition is true. Sometimes you need to execute a set of commands until a condition is true.

**Syntax**
```
until command
do
   Statement(s) to be executed until command is true
done
```
Here the Shell command is evaluated. If the resulting value is false, given statement(s) are executed. If the command is true then no statement will be executed and the program jumps to the next line after the done statement.

**Basic Construct**
``` bash
# basic construct
until [ condition ]
do
 command(s)...
done
```

**Example**

Here is a simple example that uses the until loop to display the numbers zero to nine −
``` bash
#!/bin/sh

a=0

until [ ! $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done
```
Upon execution, you will receive the following result −
```
0
1
2
3
4
5
6
7
8
9
```

The until construct tests for a condition, and if false, executes commands. It keeps looping as long as the condition is false (opposite of while construct)
``` bash
COUNT=1
until [ $COUNT -gt 5 ]; do
  echo "Value of count is: $COUNT"
  COUNT=$(($COUNT + 1))
done
```

## The select Loop

The select loop provides an easy way to create a numbered menu from which users can select options. It is useful when you need to ask the user to choose one or more items from a list of choices.

**Syntax**
```
select var in word1 word2 ... wordN
do
   Statement(s) to be executed for every word.
done
```
Here var is the name of a variable and word1 to wordN are sequences of characters separated by spaces (words). Each time the for loop executes, the value of the variable var is set to the next word in the list of words, word1 to wordN.

For every selection, a set of commands will be executed within the loop. This loop was introduced in ksh and has been adapted into bash. It is not available in sh.

**Example**

Here is a simple example to let the user select a drink of choice −

``` bash
#!/bin/ksh

select DRINK in tea cofee water juice appe all none
do
   case $DRINK in
      tea|cofee|water|all) 
         echo "Go to canteen"
         ;;
      juice|appe)
         echo "Available at home"
      ;;
      none) 
         break 
      ;;
      *) echo "ERROR: Invalid selection" 
      ;;
   esac
done
```
The menu presented by the select loop looks like the following −
```
$./test.sh
1) tea
2) cofee
3) water
4) juice
5) appe
6) all
7) none
#? juice
Available at home
#? none
$
```
You can change the prompt displayed by the select loop by altering the variable PS3 as follows −
```
$PS3 = "Please make a selection => " ; export PS3
$./test.sh
1) tea
2) cofee
3) water
4) juice
5) appe
6) all
7) none
Please make a selection => juice
Available at home
Please make a selection => none
$
```

## The infinite Loop
All the loops have a limited life and they come out once the condition is false or true depending on the loop.

A loop may continue forever if the required condition is not met. A loop that executes forever without terminating executes for an infinite number of times. For this reason, such loops are called infinite loops.

**Example**
Here is a simple example that uses the while loop to display the numbers zero to nine −
``` bash
#!/bin/sh

a=10

until [ $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done
```
This loop continues forever because a is always greater than or equal to 10 and it is never less than 10.

## "break" and "continue" statements
break and continue can be used to control the loop execution of for, while and until constructs. continue is used to skip the rest of a particular loop iteration, whereas break is used to skip the entire rest of loop.


 A few examples:

``` bash
# Prints out 0,1,2,3,4

COUNT=0
while [ $COUNT -ge 0 ]; do
  echo "Value of COUNT is: $COUNT"
  COUNT=$((COUNT+1))
  if [ $COUNT -ge 5 ] ; then
    break
  fi
done

# Prints out only odd numbers - 1,3,5,7,9
COUNT=0
while [ $COUNT -lt 10 ]; do
  COUNT=$((COUNT+1))
  # Check if COUNT is even
  if [ $(($COUNT % 2)) = 0 ] ; then
    continue
  fi
  echo $COUNT
done
```

## The break Statement
The break statement is used to terminate the execution of the entire loop, after completing the execution of all of the lines of code up to the break statement. It then steps down to the code following the end of the loop.

**Syntax**
The following break statement is used to come out of a loop −
```
break
```
The break command can also be used to exit from a nested loop using this format −
```
break n
```
Here n specifies the nth enclosing loop to the exit from.

**Example**
Here is a simple example which shows that loop terminates as soon as a becomes 5 −
``` bash
#!/bin/sh

a=0

while [ $a -lt 10 ]
do
   echo $a
   if [ $a -eq 5 ]
   then
      break
   fi
   a=`expr $a + 1`
done
```
Upon execution, you will receive the following result −
```
0
1
2
3
4
5
```
Here is a simple example of nested for loop. This script breaks out of both loops if var1 equals 2 and var2 equals 0 −

``` bash
#!/bin/sh

for var1 in 1 2 3
do
   for var2 in 0 5
   do
      if [ $var1 -eq 2 -a $var2 -eq 0 ]
      then
         break 2
      else
         echo "$var1 $var2"
      fi
   done
done
```
Upon execution, you will receive the following result. In the inner loop, you have a break command with the argument 2. This indicates that if a condition is met you should break out of outer loop and ultimately from the inner loop as well.
```
1 0
1 5
```

## The continue statement
The continue statement is similar to the break command, except that it causes the current iteration of the loop to exit, rather than the entire loop.

This statement is useful when an error has occurred but you want to try to execute the next iteration of the loop.

**Syntax**
continue
Like with the break statement, an integer argument can be given to the continue command to skip commands from nested loops.

continue n
Here n specifies the nth enclosing loop to continue from.

Example
The following loop makes use of the continue statement which returns from the continue statement and starts processing the next statement −

``` bash
#!/bin/sh

NUMS="1 2 3 4 5 6 7"

for NUM in $NUMS
do
   Q=`expr $NUM % 2`
   if [ $Q -eq 0 ]
   then
      echo "Number is an even number!!"
      continue
   fi
   echo "Found odd number"
done
```
Upon execution, you will receive the following result −
```
Found odd number
Number is an even number!!
Found odd number
Number is an even number!!
Found odd number
Number is an even number!!
Found odd number
```

## Nesting Loops
All the loops support nesting concept which means you can put one loop inside another similar one or different loops. This nesting can go up to unlimited number of times based on your requirement.

Here is an example of nesting while loop. The other loops can be nested based on the programming requirement in a similar way −

## Nesting while Loops
It is possible to use a while loop as part of the body of another while loop.

**Syntax**
```
while command1 ; # this is loop1, the outer loop
do
   Statement(s) to be executed if command1 is true

   while command2 ; # this is loop2, the inner loop
   do
      Statement(s) to be executed if command2 is true
   done

   Statement(s) to be executed if command1 is true
done
```

**Example**

Here is a simple example of loop nesting. Let's add another countdown loop inside the loop that you used to count to nine −
``` bash
#!/bin/sh

a=0
while [ "$a" -lt 10 ]    # this is loop1
do
   b="$a"
   while [ "$b" -ge 0 ]  # this is loop2
   do
      echo -n "$b "
      b=`expr $b - 1`
   done
   echo
   a=`expr $a + 1`
done
```
This will produce the following result. It is important to note how echo -n works here. Here -n option lets echo avoid printing a new line character.
```
0
1 0
2 1 0
3 2 1 0
4 3 2 1 0
5 4 3 2 1 0
6 5 4 3 2 1 0
7 6 5 4 3 2 1 0
8 7 6 5 4 3 2 1 0
9 8 7 6 5 4 3 2 1 0
```

# Shell Functions
Like other programming languages, the shell may have functions. A function is a subroutine that implements a set of commands and operations. It is useful for repeated tasks.

## Creating a function
``` bash
# basic construct
function_name {
  command...
}
```

Functions are called simply by writing their names. A function call is equivalent to a command. Parameters may be passed to a function, by specifying them after the function name. 

The first parameter is referred to in the function as **`$1`**, the second as **`$2`** etc.
## Calling a function
``` bash
function function_B {
  echo "Function B."
}

function function_A {
  echo "$1"
}

function adder {
  echo "$(($1 + $2))"
}

# FUNCTION CALLS
# Pass parameter to function A
function_A "Function A."     # Function A.
function_B                   # Function B.
# Pass two parameters to function adder
adder 12 56                  # 68
```

## Pass Parameters to a Function
You can define a function that will accept parameters while calling the function. These parameters would be represented by **$1**, **$2** and so on.

Following is an example where we pass two parameters A1 and B2 and then we capture and print these parameters in the function.

``` bash
#!/bin/sh

# Define your function here
Hello () {
   echo "Hello World $1 $2"
}

# Invoke your function
Hello A1 B2
```
Upon execution, you will receive the following result −
```
$./test.sh
Hello World A1 B2
```
## Returning Values from Functions
If you execute an exit command from inside a function, its effect is not only to terminate execution of the function but also of the shell program that called the function.

If you instead want to just terminate execution of the function, then there is way to come out of a defined function.

Based on the situation you can return any value from your function using the return command whose syntax is as follows −
```
return code
```
Here code can be anything you choose here, but obviously you should choose something that is meaningful or useful in the context of your script as a whole.

Example
Following function returns **a** value **10** −

``` bash
#!/bin/sh

# Define your function here
Hello () {
   echo "Hello World $1 $2"
   return 10
}

# Invoke your function
Hello A1 B2

# Capture value returnd by last command
ret=$?

echo "Return value is $ret"
```
Upon execution, you will receive the following result −
```
$./test.sh
Hello World A1 B2
Return value is 10
```

## Nested Functions
One of the more interesting features of functions is that they can call themselves and also other functions. A function that calls itself is known as a recursive function.

Following example demonstrates nesting of two functions −

``` bash
#!/bin/sh

# Calling one function from another
number_one () {
   echo "This is the first function speaking..."
   number_two
}

number_two () {
   echo "This is now the second function speaking..."
}

# Calling function one.
number_one
```
Upon execution, you will receive the following result −
```
This is the first function speaking...
This is now the second function speaking...
```

## Function Call from Prompt
You can put definitions for commonly used functions inside your .profile. These definitions will be available whenever you log in and you can use them at the command prompt.

Alternatively, you can group the definitions in a file, say test.sh, and then execute the file in the current shell by typing −
``` bash
$. test.sh
```
This has the effect of causing functions defined inside test.sh to be read and defined to the current shell as follows −
``` bash
$ number_one
This is the first function speaking...
This is now the second function speaking...
$
```
To remove the definition of a function from the shell, use the unset command with the .f option. This command is also used to remove the definition of a variable to the shell.
```
$ unset -f function_name
```





# Bash Trap Command
It often comes the situations that you want to catch a special signal/interruption/user input in your script to prevent the unpredictables.

Trap is your command to try:
```
trap <arg/function> <signal>
```
Example
``` bash
#!/bin/bash
# traptest.sh
# notice you cannot make Ctrl-C work in this shell, 
# try with your local one, also remeber to chmod +x 
# your local .sh file so you can execute it!

trap "echo Booh!" SIGINT SIGTERM
echo "it's going to run until you hit Ctrl+Z"
echo "hit Ctrl+C to be blown away!"

while true        
do
    sleep 60       
done
```

Surely you can substitute the "echo Booh!" with a function:
``` bash
function booh {
    echo "booh!"
}
```
and call it in trap:
``` bash
trap booh SIGINT SIGTERM
```
Some of the common signal types you can trap:
- **SIGINT**: user sends an interrupt signal (Ctrl + C
- **SIGQUIT**: user sends a quit signal (Ctrl + C)
- **SIGFPE**: attempted an illegal mathematical operation

You can check out all signal types by entering the following command:
``` bash
kill -l
```
Notice the numbers before each signal name, you can use that number to avoid typing long strings in trap:
``` bash
#2 corresponds to SIGINT and 15 corresponds to SIGTERM
trap booh 2 15
```
one of the common usage of trap is to do cleanup temporary files:
``` bash
trap "rm -f folder; exit" 2
```

# File Testing
Often you will want to do some file tests on the file system you are running. In this case, shell will provide you with several useful commands to achieve it.

The command looks like the following

```
-<command> [filename]

- [filename1] -<command> [filename2]
```
We will briefly introduce some common commands you might encounter in your daily life.


## use "-e" to test if file exist
``` bash
#!/bin/bash
filename="sample.md"
if [ -e "$filename" ]; then
    echo "$filename exists as a file"
fi
```

## use "-d" to test if directory exists
``` bash
#!/bin/bash
directory_name="test_directory"
if [ -d "$directory_name" ]; then
    echo "$directory_name exists as a directory"
fi
```

## use "-r" to test if file has read permission for the user running the script/test
``` bash
#!/bin/bash
filename="sample.md"
if [ ! -f "$filename" ]; then
    touch "$filename"
fi
if [ -r "$filename" ]; then
    echo "you are allowed to read $filename"
else
    echo "you are not allowed to read $filename"
fi
```

# Pipelines
Pipelines, often called pipes, is a way to chain commands and connect output from one command to the input of the next. A pipeline is represented by the pipe character: `|`. It's particularly handy when a complex or long input is required for a command.
```
command1 | command2
```
By default pipelines redirects only the standard output, if you want to include the standard error you need to use the form `|&` which is a short hand for `2>&1 |`.


Imagine you quickly want to know the number of entries in a directory, you can use a pipe to redirect the output of the ls command to the wc command with option -l.
``` bash
ls / | wc -l
```
Then you want to see only the first 10 results
``` bash
ls / | head
```
> Note: head outputs the first 10 lines by default, use option -n to change this behavior

# Process Substitution
In the previous section we've seen how to chain output of one command to the next one. But what if you want to chain the output of two or more commands to the another one? What if you have a command that takes a file as argument but you would like to process whatever is send to that file?

Process substitution allows a process’s input or output to be referred to using a filename. It has two forms: output `<(cmd)`, and input `>(cmd)`.

## Output
Imagine you've two files for which you want to compare the content. Using diff file1 file2 could generate false positives in the case lines are not ordered. So if you want to compare those files you could create two new files, ordered, and compare those. It would look like:

``` bash
sort file1 > sorted_file1
sort file2 > sorted_file2
diff sorted_file1 sorted_file2
```
With process substitution you can do it in one line:
``` bash
diff <(sort file1) <(sort file2)
```
## Input
Imagine you want to store logs of an application into a file and at the same time print it on the console. A very handy command for that is `tee`.
``` bash
echo "Hello, world!" | tee /tmp/hello.txt
```
Now let say you want to have only lower case characters in the file but keep the regular case on the output. You could use process substitution that way:
``` bash
echo "Hello, world!" | tee >(tr '[:upper:]' '[:lower:]' > /tmp/hello.txt)
```




***
https://www.learnshell.org/en/Loops
