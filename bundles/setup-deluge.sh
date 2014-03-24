#!/bin/sh

sudo apt-get -y install deluge deluge-common deluged deluge-web deluge-console

## Setups config files
deluged
pkill deluged

## Adds user 'admin' with password 'password' as administrator ('10')
## Other user levels are '5' (normal), '1' (read only) and '0' (none)
echo "admin:password:10" >> ~/.config/deluge/auth

## Makes deluge behave like a service.
sudo cp ../config/deluge /etc/init.d/
sudo chmod 755 /etc/init.d/deluge
sudo update-rc.d deluge defaults

## And starts it
sudo service deluge start
