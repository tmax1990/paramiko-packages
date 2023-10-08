#!/bin/bash

mkdir /xmc/Extreme_Networks/NetSight/appdata/scripting/extensions
chown -R netsight:root /xmc/Extreme_Networks/NetSight/appdata/scripting/extensions
chmod -R 755 /xmc/Extreme_Networks/NetSight/appdata/scripting/extensions

# Lag mapper for tftpboot
mkdir /tftpboot/configs
mkdir /tftpboot/configs/tmp
chmod 777 /tftpboot/configs
chmod 777 /tftpboot/configs/tmp

# Installer GIT
yum install git

# Set username
OUTPUT=$(git config --global user.name "Thomas Axelsson (Admin)")
echo "${OUTPUT}"

# Set email
OUTPUT=$(git config --global user.email "admthoaxe@sikt.sykehuspartner.no")
echo "${OUTPUT}"

# Skru av SSL
OUTPUT=$(git config --global http.sslverify false)
echo "${OUTPUT}"

# Se på konfig
OUTPUT=$(git config --list)
echo "${OUTPUT}"

# Lag ssh-nøkkel
OUTPUT=$(ssh-keygen -o -t rsa -b 4096 -C "thoaxe@sykehuspartner.com")
echo "${OUTPUT}"

# Vis ssh-nøkkel
OUTPUT=$(cat /root/.ssh/id_rsa.pub)
echo "${OUTPUT}"

