dd if=/dev/zero of=zfs-test-disk05.img bs=512M count=1
losetup /dev/loop5 zfs-test-disk05.img
zpool replace datastore loop1 loop5
zpool status

