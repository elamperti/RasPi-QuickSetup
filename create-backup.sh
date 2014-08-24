#!/bin/bash

BACKUP_FOLDER="backups/"`date +%Y%m%d`

mkdir -p ${BACKUP_FOLDER}

## Bash files
sudo cp $HOME/.bash* ${BACKUP_FOLDER}/

## Config files and other important stuff
## System
sudo cp /etc/network/interfaces ${BACKUP_FOLDER}/interfaces
sudo cp /etc/ntp.conf ${BACKUP_FOLDER}/ntp.conf
sudo cp /etc/fstab ${BACKUP_FOLDER}/fstab

## Services
sudo cp /etc/dnsmasq.conf ${BACKUP_FOLDER}/dnsmasq.conf
sudo cp /etc/ddclient.conf ${BACKUP_FOLDER}/ddclient.conf
sudo cp /etc/samba/smb.conf ${BACKUP_FOLDER}/smb.conf
sudo cp /etc/nginx/nginx.conf ${BACKUP_FOLDER}/nginx.conf
sudo cp /etc/monitorix.conf ${BACKUP_FOLDER}/monitorix.conf
sudo cp /etc/init.d/deluge ${BACKUP_FOLDER}/deluge
sudo cp $HOME/.config/deluge/auth ${BACKUP_FOLDER}/deluge.auth

## User stuff
#sudo cp $HOME/.bash_aliases ${BACKUP_FOLDER}/.bash_aliases


## Other
sudo cp /etc/rc.local ${BACKUP_FOLDER}/rc.local
