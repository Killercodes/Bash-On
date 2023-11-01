apt update && apt upgrade -y

pkg install wget curl openssh git -y

pkg install ncurses-utils


wget https://raw.githubusercontent.com/gushmazuko/metasploit_in_termux/master/metasploit.sh

chmod +x metasploit.sh

./metasploit.sh


