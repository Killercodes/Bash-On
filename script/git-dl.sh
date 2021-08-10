#!/bin/bash

_repository_=$1
_directory_=$2
_filename_=$3

#figlet "rawgit downloader"
#Killercodes/code-blub/Python3/ caesar-encrypter.py

banner="# \033[1;33m RAWGIT dwlder \033[0m # ~"
echo -e $banner

usage=".  .\033[1;36m rawgit.sh \033[0m <path> <filename> \n"
usage+=".  .\033[1;36m <path> \033[0m = <username>/<repo>/<directory> Ex: Killercodes/code-blub/Python3 \n"
usage+=".  .\033[1;36m <filename> \033[0m = filename"

# coammnd line argument
if [ -z "$1" ]; then    
    echo -e $usage
elif [ $1 == "--help" ]; then
    echo -e $usage
else
    #https://raw.githubusercontent.com/Killercodes/code-blub/master/Python3/color-demo.py
    giturl="DOWNLOADING: https://raw.githubusercontent.com/$_repository_/master/$_directory_/$_filename_"
    wget -q $giturl
fi
