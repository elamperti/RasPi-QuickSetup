#!/bin/bash

BACKUP_FOLDER="backups/"`date +%Y%m%d`

mkdir -p ${BACKUP_FOLDER}
## Bash files
sudo cp $HOME/.bash* ${BACKUP_FOLDER}/

## Config files and other important stuff
sudo cp /etc/network/interfaces ${BACKUP_FOLDER}/interfaces
sudo cp /etc/dnsmasq.conf ${BACKUP_FOLDER}/dnsmasq.conf
sudo cp /etc/ddclient.conf ${BACKUP_FOLDER}/ddclient.conf
sudo cp /etc/ntp.conf ${BACKUP_FOLDER}/ntp.conf
sudo cp /etc/fstab ${BACKUP_FOLDER}/fstab
sudo cp /etc/samba/smb.conf ${BACKUP_FOLDER}/smb.conf

sudo cp /etc/rc.local ${BACKUP_FOLDER}/rc.local
