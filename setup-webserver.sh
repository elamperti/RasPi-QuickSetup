#!/bin/sh

WWW_DIR=/var/www

## A pinch of hardening

sudo cp config/iptables.rules /etc/iptables.firewall.rules
sudo iptables-restore < /etc/iptables.firewall.rules

## Now I don't remember why I had this, but ... well, I hope it was not something important.
#sudo cp ifup-firewall.sh /etc/network/if-pre-up.d/firewall
#sudo chmod +x /etc/network/if-pre-up.d/firewall


sudo apt-get install fail2ban
echo "Remember to edit /etc/fail2ban/jail.conf"


## NGINX server + PHP + MySQL

sudo apt-get install nginx php5-fpm php5-curl php5-cli php5-mcrypt php-apc php5-mysql mysql-server # php5-gd

echo "Adding $USER to group www-data"
sudo usermod -a -G www-data $USER

sudo cp config/nginx.conf /etc/nginx/nginx.conf
sudo cp config/nginx-fastcgi_params /etc/nginx/fastcgi_params
sudo cp config/nginx-sites-enabled-default /etc/nginx/sites-enabled/default

# Let's secure the hell out of mysql.
# Well, or at least cover the basics:
sudo mysql_secure_installation

cat readme-php-fpm


## Monitorix
echo "This will download monitorix v3.4.0, it may not be the latest version and is NOT recomended to continue."
read -p "Press [Enter] if you are really sure about this. (or Ctrl+C to cancel)"
wget -P /tmp/ http://www.monitorix.org/monitorix_3.4.0-izzy1_all.deb

sudo apt-get install rrdtool libwww-perl libmailtools-perl libmime-lite-perl librrds-perl libxml-simple-perl libconfig-general-perl libhttp-server-simple-perl
echo "If this failed, execute apt-get -f install"
read -p "Press [Enter] to continue..."

sudo apt-get install fcgiwrap

sudo dpkg -i /tmp/monitorix_3.4.0-izzy1_all.deb
## It would be nice to removethe .deb after installing, but it's your call.

echo "Adding $USER to group www-data"
sudo usermod -a -G www-data $USER

sudo mkdir -p $WWW_DIR/monitorix
sudo mkdir -p /var/db/monitorix
sudo cp -r /usr/share/monitorix/* $WWW_DIR/monitorix/

echo "Changing ownership of $WWW_DIR to $USER:www-data"
sudo chown -R $USER:www-data $WWW_DIR

sudo cp config/monitorix.conf /etc/monitorix.conf



sudo service nginx restart
sudo service monitorix restart
