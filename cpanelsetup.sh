#!/bin/bash

#Assumes a fresh instance of cloudlinux and logged in as root. Make sure you have your CloudLinux license key handy.

#Update the system
echo "Updating packages..."
yum -y update &&

#License Cloudlinux
echo ""
echo ""
read -p 'Please paste your Cloudlinux license here and press enter:   ' key
echo ""
echo ""
echo "One moment..."
rhnreg_ks --activationkey=$key &&
clnreg_ks --force &&
echo ""
echo "Cloudlinux licensed successfully."
echo ""
sleep 2
#Update again
echo "Updating packages..."
sleep 2
yum -y update &&

#Install cPanel
echo "Installing cPanel..."
sleep 2
cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest &&

#Install WP-Toolkit
echo "Installing WP-Toolkit..."
sleep 2
mkdir /root/wp-toolkit && cd /root/wp-toolkit && sh <(curl https://wp-toolkit.plesk.com/cPanel/installer.sh || wget -O - https://wp-toolkit.plesk.com/cPanel/installer.sh) &&

#Install IONCube loader. This assumes php version 8.1.
echo "Installing IONCube..."
sleep 2
yum -y install ea-php81-php-ioncube12.x86_64 &&

#Install Softalicious
sleep 2
echo "Installing Softaculous..."
mkdir /root/softaculous && cd /root/softaculous && wget -N https://files.softaculous.com/install.sh && chmod 755 install.sh && ./install.sh &&

#Install LVEManager
echo "Installing LVEManager..."
sleep 2
yum -y install lvemanager &&

#Install CageFS
echo "Installing CageFS..."
sleep 2
yum -y install cagefs &&

#Initialise CageFS
echo "Initializing CageFS..."
sleep 2
/usr/sbin/cagefsctl --init &&

#Install ConfigServer Security & Firewall
echo "Install ConfigServer Security & Firewall..."
sleep 2
wget http://download.configserver.com/csf.tgz && tar -xzf csf.tgz && sh install.sh
