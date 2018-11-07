#!/bin/bash



echo "writting ..."

chmod 777 sd_fusing_exynos4x12.sh -R
		
echo "Fuse iTOP-4412 trustzone uboot file into SD card"

if [ -z $1 ]
then
	./sd_fusing_exynos4x12.sh /dev/sdb u-boot-iTOP-4412.bin
else
	./sd_fusing_exynos4x12.sh $1 u-boot-iTOP-4412.bin
fi


echo "writting success"



