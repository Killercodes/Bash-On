# How to enable SSH in raspbian first boot

I guess everyone knows this
> For headless setup, SSH can be enabled by placing a file named ssh, without any extension, onto the boot partition of the SD card from another computer. When the Pi boots, it looks for the ssh file. If it is found, SSH is enabled and the file is deleted. The content of the file does not matter; it could contain text, or nothing at all.

## But what if it dosen't work from your Windows system ?

Well you can look for **PiBakery** if that works for you. But in case you want to do the other way follow the steps


### The problem: `Ext4` format is not readable form windows

So once you burn Raspbian through any img burning tool it creates two partition `Boot` & `rootfs`. The `boot` partition is formatted in FAT and will be only visible to windows whereas the `rootfs` was with `Ext4` and will not be visible at all (*you can confirm it by viewing it in MiniTool partition Partition Wizard*)

---

### Mission: Editing the configuration from windows to force enable `ssh`

My mission was to force enable `ssh` as it was not working with the official instructions (*putting `ssh` file in the boot partition)*. So I downloaded the [Paragon ExtFS for Windows][1] which enables Windows 7 to browse/edit files in  `Ext4`partition by mounting it as new drive. 

Before that i also tried **Ext2Fsd-0.69** but it was not compatible with Windows 7 and the other **ext2explore-2.2.71** is only capable to view files not to edit them. Nothing worked for me

---

### The hack: Edit `/etc/rc.local` file from windows 7

After googling for almost the whole day i got to know two thing 

 1. Commands can be executed by editing the file `/etc/rc.local` in the `rootfs` partition
 2. Command to start `ssh` is `/etc/init.d/ssh start`

So i edited the `rc.local` file by placing the `/etc/init.d/ssh start` just before the `exit 0` so that it executes on every boot, as follows 

    #!/bin/sh -e
    #
    # rc.local
    #
    # This script is executed at the end of each multiuser runlevel.
    # Make sure that the script will "exit 0" on success or any other
    # value on error.
    #
    # In order to enable or disable this script just change the execution
    # bits.
    #
    # By default this script does nothing.
    
    # Print the IP address
    _IP=$(hostname -I) || true
    if [ "$_IP" ]; then
      printf "My IP address is %s\n" "$_IP"
    fi
    
    /etc/init.d/ssh start
    exit 0

And it worked!! I know it's not a neat way but it can be helpful for someone in need.

 [![raspbian with ssh][2]][2] 


  [1]: https://www.paragon-software.com/home/extfs-windows/
  [2]: https://i.stack.imgur.com/xAlSL.jpg
Please comment below if you see any issue that may arise because of it.
