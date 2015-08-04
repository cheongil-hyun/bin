#!/bin/bash

# sudo apt-get install -y ssh
# sudo apt-get install -y sshfs
# sudo apt-get install -y fuse-utils sshfs
# sleep 10

# sudo modprobe fuse
# mkdir ~/cloud

# chown cheongilhyun:cheongilhyun ~/cloud
# sudo usermod -a -G fuse cheongilhyun
# sudo chmod 0660 /dev/fuse

sshfs cheongil.hyun@10.168.178.78: ~/cloud
