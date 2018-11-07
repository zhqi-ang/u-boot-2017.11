#!/bin/bash

./clean.sh

cd ../

if [ ! -f .config ]
then
	make itop4412_defconfig
fi

make -j4

cp u-boot.bin mk_u-boot/
echo "copy u-boot.bin done."

cd spl/
if [ ! -f itop4412-spl.bin ] ; then
	echo "notice: not found itop4412-spl.bin !"
	exit 0
else
	echo "copying itop4412-spl.bin..."
fi

cp itop4412-spl.bin ../mk_u-boot/
echo "copy u-boot-spl.bin done."

cd ../mk_u-boot/
echo "check E4412_N.bl1.bin !!!"
if [ ! -f E4412_N.bl1.bin ] ; then
	echo "not find files: E4412_N.bl1.bin !!!"
	exit 0
fi

echo "check env.bin !!!"
if [ ! -f env.bin ] ; then
	echo "not find files: env.bin !!!"
	exit 0
fi

cat E4412_N.bl1.bin itop4412-spl.bin env.bin u-boot.bin > u-boot-iTOP-4412.bin

if [ -f u-boot-iTOP-4412.bin ] ; then
	echo "created u-boot-iTOP-4412.bin success!!!"
else
	echo "created u-boot-iTOP-4412.bin failed!!!"
	exit 0
fi

echo "make successful"
