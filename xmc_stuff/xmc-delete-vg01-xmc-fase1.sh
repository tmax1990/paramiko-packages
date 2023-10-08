#!/bin/bash

# Installer pakker som er nodvendig
yum install unzip
yum install htop
yum install libXext.x86_64
yum install libXrender.x86_64
yum install libXtst.x86_64
yum install libXpm.x86_64
yum install libXft.x86_64
yum install libXdamage.x86_64
yum install libXcursor.x86_64

# Fjerner /xmc fra oppstart
sed -i -e 's#/dev/mapper/vg01-xmc    /xmc                    xfs     defaults        0 0##g' /etc/fstab

# Disabler selinux, nodvendig for installasjon. 
sed -i -e 's/SELINUX=enabled/SELINUX=disabled/g' /etc/selinux/config
sed -i -e 's/SELINUX=permissive/SELINUX=disabled/g' /etc/selinux/config

# Restart
reboot
