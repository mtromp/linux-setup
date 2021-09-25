# Upgrade Meerkat to Ubuntu 20.04LTS

Performed the upgrade from Ubuntu 18.04LTS to Ubuntu 20.04LTS using the
updating packages which does turn off 3rd part updates.

## Enable 3rd Party Repositories

I ran the following commands from a terminal session:
```bash
sudo apt-add-repository -ys ppa:ubuntu-toolchain-r/test
sudo apt-add-repository -ys ppa:rael-gc/rvm
sudo apt-add-repository -ys ppa:system76-dev/stable

sudo apt update
sudo apt upgrade
```

## Update rust

```bash
rustup update
```

## Verifications

* Verified that `git` pull worked. I believe my ssh key is ok.
* updated packages in Atom and restarted.

## QT Projects building

Am not able to build projects in QT. The message is that
`:-1: error: No rule to make target '/usr/src/googletest/googletest/include/gtest/internal/gtest-tuple.h', needed by 'gtest-all.o'.  Stop.`

That file definitely does not exist.

**Need to do a clean build.**
