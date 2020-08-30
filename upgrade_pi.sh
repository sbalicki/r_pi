#!bin/bash

sudo su

#remove pi from sudoers
echo "Removing pi from sudoers group"
deluser pi sudo
rm /etc/sudoers.d/010_pi-nopasswd

#add new user
echo "Adding user sbalicki"
adduser sbalicki
echo "Done"
echo "Adding user sbalicki to sudoers group"
adduser sbalicki sudo

#update system
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

#upgrade from jessie to stretch
sed -i 's/jessie/stretch/g' /etc/apt/sources.list
sed -i 's/jessie/stretch/g' /etc/apt/sources.list.d/raspi.list
apt-get update
apt-get upgrade -y
apt-get dist-upgrade-y
rpi-update

#install additional packages
apt-get install emacs onboard

#add autostart for virtual keyboard
exit
mkdir $HOME/.config/autostart
touch $HOME/.config/autostart/onboard.desktop
echo "[Desktop Entry]
Type=Application
Name=Virtual Keyboard
Comment=Auto-start virtual keyboard
Exec=onboard" > $HOME/.config/autostart/onboard.desktop



