# System 76 Meerkat

On Friday, June 28, 2019, I received a System 76 Meerkat with Ubuntu 18.04.
In this directory I will keep any configuration files. This README will
attempt to capture the commands I used to install and configure the machine.

I ordered this with a 1TB SSD and a 2TB disk.

I discovered that I cannot do much without a wired mouse. I have a wired
Apple keyboard but without the mouse there is not much that I can configure.
Purchased a LogiTech mouse with a wireless USB dongle. This allows me to pair
my Apple Mouse.

## TO DO
- mount hard disk on bootup
  - symlink ~/Downloads to the hard disk
  - POSTPONE: space is not yet an issue.
- add vim-config directory to the linux-setup repository.


## tmux
Set this up according to my instructions on github. CTRL-Q is the prefix.
Installed gnome-tweaks so that I could change the CAPS-LOCK key to be an extra CTRL key.

`CRTL-Q [` places tmux into mouse copy mode so that I can scroll through the content in
the tmux pane. Otherwise, it will scroll through history. Use `ESC` to exit that mode.

## Allow a simple password
I edited the /etc/pam.d/common-password file to remove the `obscure` from the
line that also included `sha512`. This was line #25.

## Configure VI
The arrow keys are printing out values in addition to moving the cursor.
Create ~/.vimrc and place the following in that file:
```
set nocompatible
```
That took care of that irritation.

Remove vim-tiny and install vim with more features.

```bash
sudo apt remove --assume-yes vim-tiny
sudo apt install --assume-yes vim
```

## changes to .bashrc
- increase HISTSIZE to 10000
- increate HISTFILESIZE to 2000000
- uncomment `force_color_promtp=yes`
- add function that will print the git branch if it exists
- load `.bash_PS1` if it exists.

## Install software

From the command line I first did the following:
```bash
sudo apt-get update
sudo apt-get upgrade  ## there was a lot to update

sudo apt install gnome-tweak-tool  ## to map caps lock to CTRL
```
### git: install and configure
```
sudo apt install git
ssh-keygen -t rsa -b 4096 -C"mtromp@mtromp.com"
ssh-add ~/.ssh/id_rsa
sudo apt install xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
### Paste this into my ssh key configuration on github.com
mkdir workspace
cd workspace
git clone git@github.com:mtromp/linux-setup.git

### copy the .gitconfig file into my home directory.
```

## Allow ssh from other machines
First I noticed that the `ifconfig` command was not available:
```bash
sudo apt install net-tools

## then install ssh
sudo apt install ssh
service ssh status  ## verify that the service is up and listening to port 22
```
The installation will start up the ssh service and now I can ssh into the machine from
my Mac Book Pro.

## prevent sleep when remote connection
According to the answer found here:
https://askubuntu.com/questions/521620/prevent-machine-from-sleeping-when-ssh-connections-are-on

I placed a file in `/etc/pm/sleep.d/` named `05_ssh_keepawake`. Its contents are:
```bash
#!/bin/sh
if [ "$(who | grep -cv "(:")" -gt 0 ]; then
    echo "SSH session(s) are on. Not suspending."
    exit 1
fi
```
I have **NOT** verified that this works.

## Wake up meerkat on network request
The next challenge is to wake up the meerkat when I want to ssh using my
MacBook Pro.

- I verified that the BIOS was setup to wake
- Then I needed to configure the system within ubuntu
  - I used `iw` commands to figure out the status and the configure for
    magic-packets.

```bash
iw dev # shows the interface information phy#0
iw phy0 wowlan show  # wakeup was disabled.
sudo iw phy0 wowlan enable magic-packet disconnect
```

On my MacBook Pro I did the following:
```
brew install wakeonlan
wakeonlan <MAC address of Meerkat network card>
```
Once I verified that worked, I placed a bash script in /usr/local/bin that
did the correct wakeonlan command. I did not want to memorize the MAC address.
I called the script wakeupMeerkat.

## Configuring/Mounting the Hard disk

Don't know how to do this yet. POSTPONE UNTIL SPACE IS AN ISSUE

## Complete Yocto Quick start
Set up a yoctowork directory in the workspace directory for this. Documenting my work
in a separate markdown document.
