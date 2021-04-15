# codeblocks-installer
## A BASH-based installer for Code::Blocks, made using my SympleSys installer and nCurses.

This is a script for installing Code::Blocks via a terminal. I used `ncurses` to write the program, and it allows you to install a full version of Code::Blocks, along with all the bells and whistles, if you choose to add them.

### Pre-Requisites
You will need:
- a computer running an APT-compatible flavour of Linux
- a terminal emulator (I recommend LXTerminal)
- at least 1/2 gig RAM
- at least 800 mb of HDD space
- a good internet connection
- Python 3.0 or later (required for some addons)
- BASH
- `dialog` version 0.9 or later
- `curses` colour graphics libraries

### Running the Setup Assistant
Once you have the necessary pre requisites fulfilled, enter the directory where the scripts are located, and type: `./codeblocks-setup.sh` to start the Setup Assistant.

### Versions
There are three versions of the Setup Assistant available for install:
- The script files on their own
- a self-extractor for x86-64 machines
- a self-extractor for the Raspberry Pi or other compatible ARM-based computers.
