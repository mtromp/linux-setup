# Configuring Ruby and rvm

2020-03-07

Followed the instructions from: https://github.com/rvm/ubuntu_rvm

Did discover that ruby 2.5.1p57 was installed globally on the system.

```
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm
echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc
```

Then I need to add myself to the rvm group since this is not done by the installer.
When I tried to run `sudo useradd rvm mtromp` it already had me in the group. Perhaps that's because
I installed the package.

Start a new terminal window. That was not sufficient. The recommendation is to reboot.

Rebooting allowed me to run the command: `rvm install ruby` successfully. It installed 2.6.3

Then I went into the tdd-bash working directory and tried to do a bundle exec rspec in ListChangedRepos. This hangs, whereas
the command runs as expected in mngdockerdev directory.
