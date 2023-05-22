#!/bin/bash

#Assumes a fresh instance of cloudlinux and logged in as root. Make sure you have your CloudLinux license key handy.

#License Cloudlinux
echo ""
echo ""
read -p 'Please paste your Cloudlinux license here and press enter:   ' key
echo ""
echo ""
rhnreg_ks --activationkey=$key &&
clnreg_ks --force &&

#Install cPanel
cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest &&

#Install WP-Toolkit
mkdir /root/wp-toolkit && cd /root/wp-toolkit && sh <(curl https://wp-toolkit.plesk.com/cPanel/installer.sh || wget -O - https://wp-toolkit.plesk.com/cPanel/installer.sh) &&

#Install IONCube loader. This assumes php version 8.1.
yum -y install ea-php81-php-ioncube12.x86_64 &&

#Install Softalicious
mkdir /root/softaculous && cd /root/softaculous && wget -N https://files.softaculous.com/install.sh && chmod 755 install.sh && ./install.sh &&

#Install LVEManager
yum -y install lvemanager &&

#Install CageFS
yum -y install cagefs &&

#Initialise CageFS

#Install ConfigServer Security & Firewall
wget http://download.configserver.com/csf.tgz && tar -xzf csf.tgz && sh install.sh
