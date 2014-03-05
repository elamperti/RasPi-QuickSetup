RasPi-QuickSetup
================

Raspbian is great, but it comes with a lot of bloatware. This scripts makes it lightweight and (hopefully) optimizes it to run 24/7.

This will be a constant WIP. Feedback and collaboration are welcome!

**You should customize it** to better fit your needs.


How to use
==========
The configuration files are stored in `config/`. Those files must be modified to fit your needs.
  * `setup-init.sh` is probably the most important script: it debloats Raspbian, removes the X windows system and replaces openSSH with Dropbear.
  * `setup-install.sh` will install some applications, copy configuration files and enable SPI and i2c.
  * `setup-webserver.sh` installs Nginx, PHP5 and MySQL. Fail2Ban is installed too, and iptables firewall rules are applied. It downloads and installs Monitorix, a great tool to monitor your RasPi's activity.
  * `create-backup.sh` does exactly what the name says. A directory is created under `backups/` to store the files. It's meant to be run no more than once a day (this can be changed easily).

ToDo
====
  * Enhance `create-backup.sh` so it also restores backups. It should be renamed `backup.sh` and called with `--create [DIRECTORY]` or `--restore BACKUP_DIRECTORY`.
  * Setup more symbolic links. I like symbolic links.
  * Store bash history in memory and save it at shutdown.
  * Ask before doing stuff. It runs as a steamroller and it could break stuff.
