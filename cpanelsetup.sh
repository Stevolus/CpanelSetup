#!/bin/bash

#Assumes a fresh instance of cloudlinux and logged in as root

#Install cPanel
cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest

#Install WP-Toolkit
mkdir /root/wp-toolkit && cd /root/wp-toolkit && sh <(curl https://wp-toolkit.plesk.com/cPanel/installer.sh || wget -O - https://wp-toolkit.plesk.com/cPanel/installer.sh)

#Install Softalicious
mkdir /root/softaculous && cd /root/softaculous && wget -N https://files.softaculous.com/install.sh && chmod 755 install.sh && ./install.sh

#Install LVEManager
yum -y install lvemanager

