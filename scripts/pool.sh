for i in 0 1 2 3; do dd if=/dev/zero of=zfs-test-disk0${i}.img bs=512M count=1; done
for i in 0 1 2 3; do losetup /dev/loop${i} zfs-test-disk0${i}.img; done
losetup -a
zpool create datastore /dev/loop0 /dev/loop1 /dev/loop2 /dev/loop3
zpool status
zpool destroy datastore
zpool create datastore mirror /dev/loop0 /dev/loop1 mirror /dev/loop2 /dev/loop3
zpool status
zpool destroy datastore
zpool create datastore raidz1 /dev/loop0 /dev/loop1 /dev/loop2 /dev/loop3
zpool status
zpool destroy datastore
