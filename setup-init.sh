#!/bin/bash

#############
## Clean up #
#############

## Cleaning up things we don't need
sudo rm -rf /opt/sonic-pi
#sudo rm -rf /opt/vc

## And programs we don't need
sudo apt-get -y remove pcmanfm midori scratch leafpad galculator squeak-vm squeak-plugins-scratch xarchiver pistore qjackctl idle idle3 idle-python2.7 idle-python3.2 dillo netsurf-common netsurf-gtk sonic-pi xpdf timidity
sudo apt-get -y remove wolfram-engine
sudo apt-get -y remove `sudo dpkg --get-selections | grep "\-dev" | sed s/install//` 
sudo apt-get -y remove `sudo dpkg --get-selections | grep x11 | sed s/install//`
sudo apt-get -y remove `sudo dpkg --get-selections | grep "debian-reference" | sed s/install//`
sudo apt-get -y remove `sudo dpkg --get-selections | grep "oracle-java" | sed s/install//`

## LOL you have no desktop, we just removed X11.
## Well, if you leave X11, uncomment the following line.
#echo "Remember to remove dead launchers in your desktop" 

echo "Disabling swap"
#sudo swapoff -all
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
## not sure if this is necesary anymore:
sudo apt-get -y remove dphys-swapfile

###################
## Configuration! #
###################

## Timezone manual configuration
sudo dpkg-reconfigure tzdata

## Cure amnesia (and prevent time travel to a certain extent)
sudo cp config/etc/ntp.conf /etc/ntp.conf
echo "It's suggested to update /etc/ntp.conf with a pool near you"
echo "Visit http://www.pool.ntp.org/ for more information."


## Replace openssh with Dropbear, which is lightweight. And cool. Bears are cool.
sudo apt-get -y remove `sudo dpkg --get-selections | grep "deinstall" | grep openssh | sed s/install//` 
sudo apt-get -y remove `sudo dpkg --get-selections | grep "deinstall" | grep libssh | sed s/install//` 
sudo apt-get -y install dropbear


## After all this mess this becomes necessary
sudo apt-get autoremove
sudo apt-get --purge clean

## Let's remove unused terminals!
sudo sed -i "/[0-9] tty[3-7]/s/^/#/" /etc/inittab
sudo sed -i "/ttyAMA0/s/^/#/" /etc/inittab

## Configure nullmailer (incomplete and obsolete)
# read user-email
# echo $user-email >> /etc/nullmailer/adminaddr

## CALL THE INSTALLER NOW!

