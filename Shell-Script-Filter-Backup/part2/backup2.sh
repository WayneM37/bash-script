#!/bin/bash
if [ "$UID" -ne 0 ]
then
echo "Please run as root"
exit 1 
fi

mkdir data
cd data
touch file{1..9}
cd ..
mkdir data2
cd data2
touch file{11..19}
cd ..
mkdir backup


# PATH=$(pwd)
backup_files="./data ./data2" # These are folders we want to back up
DEST="./backup" # This is the destination folder

# time=$(date+"%Y_%m_%d_%I_%M_%p")
# hostname=$(hostname -s)
archive_file="$(date +%Y_%m_%d_%I_%M_%p).$(hostname -s).tgz" # we want time and the hostname in the archive file. 

echo "archive process has started"

tar -czvf ${DEST}/${archive_file} ${backup_files}  # we create the back up. 

echo "backup finished" 