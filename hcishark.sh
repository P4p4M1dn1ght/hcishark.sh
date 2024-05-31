#!/bin/bash
echo "Enter the bluetooth device name: "
read $device_name
if [ $device_name ]
then
	select configs in activate_bluetooth deactivate_bluetooth scan_for_devices scan_for_detailed_info
	do
		case $configs in
			activate_bluetooth )
				for command in hciconfig
				do
					sudo $command $device_name up

				done ;;

			deactivate_bluetooth )
				for command in hciconfig
				do
					sudo $command $device_name down

				done ;;

			scan_for_devices )
				for command in hcitool
				do
					sudo $command scan

				done ;;

			scan_for_detailed_info )
				for command in hcitool
				do
					sudo $command inq

				done ;;

			* )
				echo "Exiting!!" ;;
		esac

	done
else
	echo "Error Process!!"

fi


#Scripted by:~ P4p4M1dn1ght
