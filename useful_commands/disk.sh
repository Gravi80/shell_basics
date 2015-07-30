mount | column -t : Lists mounted file system, in nice formatting with specification.

To Find If Disk is SSD or HDD
------------------------------
cat /sys/block/sda/queue/rotational

You should get 1 for hard disks and 0 for a SSD.





