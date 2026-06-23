#!/bin/bash

# Mount Synology Drive
sudo apt install nfs-common
sudo mkdir -p /mnt/SynoloyDrive
sudo mount -t nfs 10.10.10.40:/volume1/SynoDrive /mnt/SynologyDrive

# Create a symlink to the Synology Drive at the home directory
ln -s /mnt/SynologyDrive ~/SynologyDrive

# Add the mount command to /etc/fstab
# Open /etc/fstab with sudo and add the following line at the end removing the # comment
# 10.10.10.40:volume1/SynoDrive /mnt/SynologyDrive nfs nfsvers=4.1,defaults 0 0