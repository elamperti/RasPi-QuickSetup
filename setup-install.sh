#!/bin/bash

## Update package list first
sudo apt-get update

## Install apps
sudo apt-get -y install ddclient dnsmasq wakeonlan python-smbus 
sudo apt-get -y install samba-common-bin samba

## Config file for dnsdynamic
sudo cp config/ddclient.conf /etc/ddclient.conf

## Config file for DNS server
sudo cp config/dnsmasq.conf /etc/dnsmasq.conf
sudo touch /etc/resolv.dnsmasq

## Config for Samba
sudo cp config/smb.conf /etc/samba/smb.conf
echo "Set a password for Samba access. Try to make it different from the one you use for your linux user."
sudo smbpasswd -a $USER

## Setup i2c
sudo sed -i "s/^blacklist spi-bcm2708/#&/" /etc/modprobe.d/raspi-blacklist.conf ## Comments the line, enables SPI
sudo sed -i "s/^blacklist i2c-bcm2708/#&/" /etc/modprobe.d/raspi-blacklist.conf ## Comments the line, enables i2c
sudo sh -c "echo i2c-dev >> /etc/modules" ## Yes, this is ugly.

## Restart the services to apply changes
sudo service ddclient restart
sudo service dnsmasq restart

echo "You should reboot the system now."

