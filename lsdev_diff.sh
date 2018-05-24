#!/bin/bash

echo "Saving current list of connected devices..."

ls /dev/ > ~/.lsdev1.temp

echo "Done."

echo
echo "Please connect your device and press any key"

# block until some key is pressed
read -s -n 1 key x

echo
echo "Saving new list of connected devices..."

ls /dev/ > ~/.lsdev2.temp

echo "Done."

echo
echo "Compairing lists..."
# give device some time to wake up
sleep 1 
echo "These are the new connected devices that was found:"
echo "-------"
# send only the unique lines to screen
sort ~/.lsdev1.temp ~/.lsdev2.temp |uniq -u
echo "-------"

# clean temp files
rm ~/.lsdev1.temp ~/.lsdev2.temp
