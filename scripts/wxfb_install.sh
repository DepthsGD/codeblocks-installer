#The wxFormBuilder BASH Installer
#Note that this Installer version is for the latest version (3.9.0).
#(C)1992-2020 wxWindows. All rights reserved.
#installer (c)2020 Benjamin Grant.
clear
sleep 3s
echo "The wxFormBuilder Installer for version 3.9.0"
sleep 1.9s
echo "(C)1992-2020 wxWindows. Installer (C) 2020 Benjamin Grant."
echo "WARNING: By installing wxFormBuilder, you run the risk of damaging your files. Note that WE ARE NOT RESPONSIBLE FOR ANY DAMAGE CAUSED TO YOUR COMPUTER DURING THE INSTALLATION PROCESS. THAT MEANS YOU ARE RESPONSIBLE FOR ANY DAMAGE DONE, OK?"
#bring up yes/no input
read -p "Do you wish to install this program? You will need to be connected to the Internet. (y/N)" yN
case $yN in
	[Yy]* ) ;; # if yes, continue
	[Nn]* ) echo "Cancelling..."; sleep 10s; exit;; # if no, exit to bash
esac
echo "Preparing to copy files..."
sleep 20s

#install pre-requisites for Ubuntu/Debian
echo "Installing pre-requisites for Ubuntu / Debian..."
sleep 10s
sudo apt install libwxgtk3.0-gtk3-dev libwxgtk-media3.0-gtk3-dev meson
sleep 10s

#install pre-requisites for Arch Linux
echo "Installing pre-requisites for Arch Linux..."
sleep 10s
sudo pacman -Syu --needed meson wxgtk2
sleep 10s

#download and install source code from GitHub
echo "Setting up source code..."
sleep 30s
cd ~
sudo rm --recursive wxFormBuilder
mkdir wxFormBuilder
echo "Downloading files..."
git clone --recursive --depth=1 https://github.com/wxFormBuilder/wxFormBuilder
sleep 5s
echo "Inflating files..."
sleep 30s

#make wxFormBuilder folder and enter it
echo "Creating install destination and switching to it..."
sleep 9s
cd ~/wxFormBuilder
sleep 6s

#use meson to build installer files
echo "Building install files with Meson..."
sleep 20s
meson _build --prefix $PWD/_install --buildtype=release
sleep 15s

#build source code and install app with ninja
echo "Building source code and installing app with Ninja..."
sleep 10s
ninja -C _build install
sleep 17s

#and, finalize.
echo "Finalizing installation..."
sleep 20s

#bring up dialog to create shortcut to wxfb on desktop
read -p "Create desktop shortcut? (Y/n)" Yn
case $Yn in
	[Yy]* ) sudo ln ./_install/bin/wxformbuilder ~/Desktop;;
	[Nn]* ) ;;
esac

#bring up dialog to run wxfb
read -p  "Do you want to run wxFormBuilder now? (Y/n)" Yn
case $Yn in
	[Yy]* ) ./_install/bin/wxformbuilder; exit;;
	[Nn]* ) echo "Thank you for choosing wxFormBuilder. \n Exiting..."; exit;;
esac
done
