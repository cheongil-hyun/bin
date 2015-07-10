#!/bin/bash

display_usage() {
	echo "This script must be run with argument "
	echo -e "\nUsage :\n $0 [msm8974|msm8x26] $1 [lmap_l_release|lamp_l_mr1_release] \n"
}

if [[ $# -eq 0 ]] ; then
	display_usage
	exit 1
fi

case $2 in
	lamp_l_release | lamp_l_mr1_release )
		;;
	*)
		echo "Invalid arguments"
		exit 1
		;;
esac
case $1 in
	msm8974 | msm8x26 | msm8992 | msm8994 )	
		# set -e
		repolr -b $2 -m $1/$1.xml --reference=/home001/mirror/lr/
		sleep 2s
		repo sync -c -q -j16 --no-tags
		sleep 2s
		repo start $2 --all
		;;
	*)
		echo "Invalid arguments"
		;;
esac

