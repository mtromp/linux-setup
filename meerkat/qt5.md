# Qt5 development

On the meerkat I will install Qt creator

The following did not give me source code to help with debugging.

```bash
sudo apt install build-essential
sudo apt install qtcreator
sudo apt install qt5-default
## for documentation
sudo apt install qt5-doc # already installed
sudo apt install qt5-doc-html qtbase5-doc-html
sudo apt install qtbase5-examples
```

## 20190720: another try
Downloaded qt-unified-linux-x64-3.1.1-online.run from the qt.io website.
Followed instructions from: 
https://scribles.net/installing-the-latest-qt-creator-on-ubuntu-linux/

Entered my qt login credentials and installed into my home directory.

Used apt to remove and auto remove all the things from above.

## Installing Google Test

```bash
sudo apt install google-mock
```
## install cmake

This installs cmake 3.10.2
```bash
sudo apt install cmake
```

## Mac Project have googletest and googlemock in different location
### sudoku-analyzer
This is a qmake project. I focused on being able to build, run the application
and test on both Mac and Ubuntu. Committed changes that provide this
functionality.

On the Mac, the sysroot had been changed when I updated to Mojave. This involved
adding a parameter at the top of the main qmake .pro file. When running on a
different version of the Mac OS this value will likely need to change.

