#!/bin/bash

LOAD_CMM=load.cmm
KCONFIG_FILE=kconfig.txt
CRASH_SH=doraw.sh
PHYS_BASE=0x0
CMD=
ARCH_BIT=32
#DUMP_INFO=$(grep 'd.load.binary' ${LOAD_CMM} | gawk '{print $2, $3}')
DUMP_INFO=$(grep 'd.load.binary DDRCS' ${LOAD_CMM} | gawk '{print $2, $3}')
# echo $DUMP_INFO

function show_info() {
	echo "do_crash.sh"
	echo " - version : 1.1 working with redhat crash utility 7.0.8 above version"
	echo " - version : 1.0 initial release"
	echo " - crated by hoyeon.jang (email : hoyeon.jang@lge.com)"
}

function get_phys_base() {
	if [ -f ${KCONFIG_FILE} ];
	then
		PHYS_BASE=$(grep 'CONFIG_PHYS_OFFSET' ${KCONFIG_FILE} | sed 's/CONFIG_PHYS_OFFSET=//')
	fi
}

function gen_sh() {
	echo "gen ${CRASH_SH}"
	touch ${CRASH_SH}
#	CMD="crash --rawdump" // for under 7.0.8
	CMD="crash"
	COMMA=" "

	# create load binary infomation
	while (($#));
	do
#		SIZE_HEX=0
#		SIZE_DEC=0
		FILE=$1
		shift
		OFFSET=$1
		shift

#		if [ -f ${FILE} ];
#		then
#			SIZE_DEC=$(stat -c%s ${FILE})
#			SIZE_HEX=0x$(echo "obase=16; ${SIZE_DEC}" | bc)
#		fi

#		CMD="${CMD}${COMMA}${FILE}@${OFFSET}-${SIZE_HEX}"
		CMD="${CMD}${COMMA}${FILE}@${OFFSET}"
		COMMA=","
	done

	CMD="${CMD} -p 4096 -m phys_base=${PHYS_BASE} --no_panic --smp vmlinux"
	echo "CMD=${CMD}"
	echo "${CMD}" >> ${CRASH_SH}
	chmod 555 ${CRASH_SH}
}

function link_crash() {
	echo "link crash"
	MODVERSIONS=$(strings vmlinux | grep 'modversions' | gawk '{print $6}')
	if [ ${MODVERSIONS} = "aarch64" ]
	then
		ARCH_BIT=64
	else
		ARCH_BIT=32
	fi
	echo "Making the link to crash_$ARCH_BIT"
	rm -rf ~/bin/crash
	ln -s ~/bin/crash_$ARCH_BIT ~/bin/crash
}

if [ -f ${CRASH_SH} ];
then
	rm -f ${CRASH_SH}
fi

echo "DUMP_INFO=${DUMP_INFO}"

show_info
# get_phys_base

echo "PHYS_BASE=${PHYS_BASE}"
gen_sh $DUMP_INFO

link_crash
# run crash
${CMD}
