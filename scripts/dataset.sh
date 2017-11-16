zpool create datastore raidz1 /dev/loop0 /dev/loop1 /dev/loop2 /dev/loop3
# Creating
zfs create datastore/pictures
zfs create datastore/to-delete
zfs destroy datastore/to-delete
zfs list

# Setting properties
zfs get all datastore/pictures
zfs set quota=2G datastore/pictures
zfs set compression=lz4 datastore/pictures
zfs get compression datastore/pictures
# Compression and quota are set

