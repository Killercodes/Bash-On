## Installing/Uninstalling with `apt-get`
To install or remove packages you need root user permissions, so your user needs to be in `sudoers` or you must be logged in as `root`.
APT keeps a list of software sources on your Pi in a file at  `/etc/apt/sources.list`. Before installing software, you should update your package list with `apt-get update`

To install a package use `sudo apt-get install packageName`

Typing `man packageName` gives the manual of the package

Typing `whereis packageName` shows the location of the package

To uninstall a package use `apt-get remove packageName` and to completely remove `apt-get purge packageName`

To get update all the packages installed type `apt-get update` or `apt update` for a full try `apt full-upgrade`

To install the update type `apt-get upgrade` or `apt update`

To update specific package type `apt-get install packageName`

To search archive of package type `apt-cache search packageName`

To resolve/fix a broken update use `apt-get uopdate --fix-missing`

To automatically removed the dependent module not required by the system use `apt autoremove`





