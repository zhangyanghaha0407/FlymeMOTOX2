#!/bin/bash -x

# unpack_boot.sh
# Unpack the standard boot.img or recovery.img of Android
#
# @author: duanqizhi(duanqz@gmail.com)
#

BOOTDIR=$1
OUTPUT=$2

function usage()
{
	echo "Usage pack_boot.sh BOOTDIR [OUTPUT]"
	echo "   BOOTDIR: the directory containing boot files to be pack"
	echo "   OUTPUT:  the output directory. if not present, the out.img will be used"
}

function init_tools()
{
	local old_pwd=`pwd`
	TOOL_DIR=`cd $(dirname $0); pwd`
	REPACK_PL=$TOOL_DIR/repack.pl
	cd $old_pwd
}

function pack_bootimg()
{
	$REPACK_PL -boot $BOOTDIR/kernel $BOOTDIR/RAMDISK $OUTPUT
}

### Start Script ###

# Check parameters
[ $# -eq 0 ] && usage && exit 1;
[ -z $2 ] && OUTPUT=out.img;

init_tools;
pack_bootimg;
