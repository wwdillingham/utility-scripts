#!/bin/bash
# Wes Dillingham
# wes_dillingham@harvard.edu
#
#DESCRIPTION:
#Make GPT partitions using max space on disk and
#make xfs filesystems on all /dev/sd block devices except /dev/sda

for i in `lsblk --output KNAME | grep -i sd | grep -v sda`;
do
        echo "Making a partition on /dev$i - using all available space on disk"
        (echo g; echo n; echo 1; echo ; echo ; echo w) | fdisk /dev/$i
        echo "making xfs filesystem on $i"
        mkfs.xfs $i1
done
