#!/bin/sh

## Restores symlinks
sudo rm -rf /home/pi
sudo ln -s /mnt/helper/home/pi/ /home/pi

sudo rm -rf /var/db
sudo ln -s /mnt/helper/var/db/ /var/db

sudo rm -rf /var/www
sudo ln -s /mnt/helper/var/www/ /var/www

sudo rm -rf /var/log
sudo ln -s /mnt/helper/var/log/ /var/log

