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

- Install git
- Install tmux
- create ssh key for git account


## Allow a simple password
I edited the /etc/pam.d/common-password file to remove the `obscure` from the
line that also included `sha512`. This was line #25.

## Configure VI
The arrow keys are printing out values rather than moving the cursor. there


## Install software

From the command line I first did the following:
```bash
sudo apt-get update
sudo apt-get upgrade  ## there was a lot to update
```

## Configuring/Mounting the Hard disk

Don't know how to do this yet.
