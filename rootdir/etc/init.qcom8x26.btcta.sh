#BT cta test script

#-------------------------------------------------------------------------------------------------------------
#this is for test BT  function
#-------------------------------------------------------------------------------------------------------------

echo "Open your BT first, and then in the adb shell input the following command into the DUT mode"
btconfig /dev/smd3 rawcmd 0x06  0x0003
btconfig /dev/smd3 rawcmd 0x03  0x0005  0x02  0x00  0x02
btconfig /dev/smd3 rawcmd 0x03  0x001A  0x03 
btconfig /dev/smd3 rawcmd 0x03  0x0020  0x00 
btconfig /dev/smd3 rawcmd 0x03  0x0022  0x00
echo "End of the script -- BT test"

