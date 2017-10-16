#!/bin/bash

# Finding the TouchPad device ID
# and invisibly store "id" variable
get_id_1="xinput | grep 'TouchPad' | awk '{ print \$6 }'"
get_id_2=`eval $get_id_1`
eval $get_id_2

# Finding the TouchPad current status
get_enabled_1="xinput list-props $id | grep 'Device Enabled' | awk '{ print \$4 }'"
get_enabled_2=`eval $get_enabled_1`

# Making some magic
if [ $get_enabled_2 -eq 1 ]
then
  xinput disable $id
  notify-send -u low -i mouse "Trackpad disabled"
else
  xinput enable $id
  notify-send -u low -i mouse "Trackpad enabled"
fi
