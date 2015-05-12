#!/bin/bash
# Wes Dillingham
# wes_dillingham@harvard.edu
#
#DESCRIPTION:
#Make LVM PVs 1/disk, VGs 1/disk, and LVs 1/disk
#make xfs filesystems on all LVs.

for i in `lsblk --output KNAME | grep -i sd | grep -v sda`;
do
        #echo "Making a partition on /dev/$i - using all available space on disk"
        #(echo g; echo n; echo 1; echo ; echo ; echo w) | fdisk /dev/$i
	
	#Make LVM Physical Volume of the block device:
	echo "making /dev/$i an LVM physical volume"
	pvcreate /dev/$i
	
	#Make a Volume Group
	echo "Making a volume group, vg_dev_$i, and adding PV /dev/$i to it"
	vgcreate vg_dev_$i /dev/$i

	#Make the Logical Volume using 100% of the available space in the VG 
	lvcreate -l 100%FREE -n lv_dev_$i vg_dev_$I
	
        echo "making xfs filesystem on lv_dev_$i"
        mkfs.xfs -q /dev/vg_dev_$i/lv_dev_$i
done


#print out results:
echo "block device information: "
lsblk

echo "Locgical Volume Scan:"
lvscan
