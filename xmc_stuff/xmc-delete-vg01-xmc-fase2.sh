#!/bin/bash
OUTPUT=$(fdisk -l)
echo "${OUTPUT}"

#lvchange -an /dev/mapper/vg01-xmc # for å suspendere LVM.
OUTPUT=$(lvchange -an /dev/mapper/vg01-xmc)
echo "${OUTPUT}"

#lvremove /dev/mapper/vg01-xmc # fjerne LVM
OUTPUT=$(lvremove /dev/mapper/vg01-xmc)
echo "${OUTPUT}"

#lvcreate  -l 100%free -n xmc vg01
OUTPUT=$(lvcreate  -l 100%free -n xmc vg01)
echo "${OUTPUT}"

#mkfs.xfs /dev/vg01/xmc
OUTPUT=$(mkfs.xfs -K /dev/vg01/xmc)
echo "${OUTPUT}"

echo "/dev/mapper/vg01-xmc    /xmc                    xfs     defaults        0 0"  >> /etc/fstab

# make /xmc directory
mkdir /xmc

#mount /xmc
OUTPUT=$(mount /xmc)
echo "${OUTPUT}"

# make main directory for Extreme_Networks
mkdir /xmc/Extreme_Networks
chmod 777 /xmc/Extreme_Networks/

# make shortcut in /usr/local/
ln -s /xmc/Extreme_Networks /usr/local/Extreme_Networks

# make directories
mkdir /xmc/temp/
chmod 777 /xmc/temp/
mkdir /xmc/temp/iparp
chmod 777 /xmc/temp/iparp
chown root:root /xmc/temp/iparp
mkdir /xmc/temp/iparp/temporary
chmod 777 /xmc/temp/iparp/temporary
chown root:root /xmc/temp/iparp/temporary

# ny struktur
mkdir /xmc/temp/workflow-output
mkdir /xmc/temp/workflow-output/VSP-IpArp-table-devices
mkdir /xmc/temp/workflow-output/VSP-IpArp-table-devices/temporary

mkdir /xmc/temp/workflow-output/VSP-Mac-address-table
mkdir /xmc/temp/workflow-output/VSP-Mac-address-table/temporary

mkdir /xmc/temp/workflow-output/ERS-Mac-address-table-devices
mkdir /xmc/temp/workflow-output/ERS-Mac-address-table-devices/temporary

mkdir /xmc/temp/workflow-output/EXOS-Mac-address-table-devices
mkdir /xmc/temp/workflow-output/EXOS-Mac-address-table-devices/temporary

mkdir /xmc/temp/workflow-output/104-status-switch
mkdir /xmc/temp/workflow-output/104-status-switch/temporary

mkdir /xmc/temp/workflow-output/VLAN-oversikt
mkdir /xmc/temp/workflow-output/VLAN-oversikt/temporary

mkdir /xmc/temp/workflow-output/ZTP-Custom-Script
mkdir /xmc/temp/workflow-output/ZTP-Custom-Script/temporary

mkdir /xmc/temp/workflow-output/id233-poe-ports-all-telekom
mkdir /xmc/temp/workflow-output/id233-poe-ports-all-telekom/temporary

mkdir /xmc/temp/workflow-output/MigrationTanking
mkdir /xmc/temp/workflow-output/MigrationTanking/temporary

mkdir /xmc/temp/workflow-output/create-vlan
mkdir /xmc/temp/workflow-output/create-vlan/temporary

mkdir /xmc/temp/workflow-output/VSP-findVlanIsid
mkdir /xmc/temp/workflow-output/VSP-findVlanIsid/temporary

mkdir /xmc/temp/workflow-output/VSP-findIpVpn
mkdir /xmc/temp/workflow-output/VSP-findIpVpn/temporary

mkdir /xmc/temp/workflow-output/VSP-findIpInterface
mkdir /xmc/temp/workflow-output/VSP-findIpInterface/temporary

mkdir /xmc/temp/workflow-output/ISE-Display-All-Authorization-Rules
mkdir /xmc/temp/workflow-output/ISE-Display-All-Authorization-Rules/temporary

find /xmc/temp/workflow-output -type d -exec chmod 755 {} \;
find /xmc/temp/workflow-output -type f -exec chmod 644 {} \;

chown -R netsight:root /xmc/temp/workflow-output