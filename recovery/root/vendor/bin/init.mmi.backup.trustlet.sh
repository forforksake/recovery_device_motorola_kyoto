#!/vendor/bin/sh

PATH=/sbin:/vendor/sbin:/vendor/bin:/vendor/xbin
export PATH

scriptname=${0##*/}

notice()
{
	echo "$*"
	echo "$scriptname: $*" > /dev/kmsg
}

# Check if we are in the first bootup sequence.
hardware_state=$(getprop ro.boot.secure_hardware)
vendor_build_type=$(getprop ro.vendor.build.type)
backup_state_prop=$(getprop persist.vendor.tl.already_backup)
if [[ "$hardware_state" == "0" ]]; then
	notice "Do not need trustlet backup, skip!"
	exit 0
fi
if [[ "$hardware_state" == "1" && "$vendor_build_type" == "userdebug" ]]; then
	notice "Do not need trustlet backup, skip!"
	exit 0
fi
if [[ "$backup_state_prop" == "true" ]]; then
	notice  "Trustlet already backed up, skip!"
	exit 0
fi

# For Trustonic tl and drv backup.
if [ -d /vendor/app/mcRegistry/ ]; then
	notice "Detecting trustonic path, syncing up.."
	cp -af /vendor/app/mcRegistry/* /mnt/vendor/tzapp/
fi

# TODO: Add more TEE vendor support if required.

setprop persist.vendor.tl.already_backup true

notice  "Trustlet backup success!"
