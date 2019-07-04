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
## Configuring/Mounting the Hard disk

Don't know how to do this yet. POSTPONE UNTIL SPACE IS AN ISSUE

## Complete Yocto Quick start
Set up a yoctowork directory in the workspace directory for this. Documenting my work
in a separate markdown document.
