# Snapshots
touch /datastore/pictures/foo
zfs snapshot datastore/pictures@first-snapshot
zfs list -t all
rm /datastore/pictures/foo
zfs rollback datastore/pictures@first-snapshot

# Diffing
zfs diff datastore/pictures@first-snapshot

# Creating writeable clone dataset
zfs clone datastore/pictures@first-snapshot datastore/snapshot-clone

# Sending and recieving
zfs send datastore/pictures@first-snapshot  > /tmp/first-snapshot
dd if=/dev/zero of=zfs-test-disk04.img bs=512M count=1
losetup /dev/loop4 zfs-test-disk04.img
zpool create restorepool /dev/loop4
cat /tmp/first-snapshot | zfs receive restorepool/pictures@first-snapshot
zfs list -t all
# New dataset has snapshot




