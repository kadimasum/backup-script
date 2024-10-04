#! /usr/bin/bash

echo "Backup Script"

read -p "Enter source path: " SOURCE
if [ -z $SOURCE ]
then 
    echo "Error: Source path not provided"
    exit 1
fi
SOURCE=$(eval echo "$SOURCE")

read -p "Enter destination path: " DESTINATION
if [ -z $DESTINATION ]
then
    echo "Error: Destination path not provided"
    exit 1
fi
DESTINATION=$(eval echo "$DESTINATION")

read -p "Do you want to zip files in the desination location?(yes/no): " ZIPFILES
if [ -z $ZIPFILES ]
then
    ZIPFILES=yes
fi
echo "Backing up files from Source: $SOURCE in the Destination: $DESTINATION, Zip Status: $ZIPFILES ..."

function backup(){
    echo "Step 1: Locating files..."
    if [[ ! -d "$SOURCE" ]]
    then
        echo "Error: Invalid source path, kindly provide a valid source path"
        exit 1
    fi
    echo "Source successfully matched!"
    find $DESTINATION

    if [ $? -eq 1 ]
    then
        echo "Error: Invalid destination path, kindly provide a valid destination path, exit code: $?"
        exit 1
    fi
    echo "Destination successfully matched"
    echo "Step 2: Copying files..."
    cp -r $SOURCE $DESTINATION
    echo "Files successfully copied to the destination!"
    echo "Step 3: Archiving files in desination"
    if [[ "$ZIPFILES" -eq "yes" ]]
    then
        echo "Zipping files..."
        zip -r "$DESTINATION/backup.zip" "$DESTINATION"
        echo "Files successfully archived in the $DESTINATION/backup.zip!"
    fi
}

backup