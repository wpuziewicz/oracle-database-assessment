#!/bin/bash

PLATFORMHDR=
PLATFORMDATA=
PIPE='|'
for FNAME in /sys/class/dmi/id/product_name /sys/class/dmi/id/product_version /sys/class/dmi/id/bios_vendor /sys/class/dmi/id/sys_vendor /sys/class/dmi/id/chassis_asset_tag
 do
   if [[ -n ${PLATFORMHDR} ]]
     then
          PLATFORMHDR=${PLATFORMHDR}${PIPE}
          PLATFORMDATA=${PLATFORMDATA}${PIPE}
   fi
  HDR=$(echo ${FNAME} | rev | cut -d '/' -f 1 | rev)
  PLATFORMHDR=${PLATFORMHDR}${HDR}
  PLATFORMDATA=${PLATFORMDATA}'"'$(cat $FNAME)'"'
done
echo $PLATFORMHDR
echo $PLATFORMDATA

echo -n "Cloud platform is : "
if [[ $PLATFORMDATA == *"Google"* ]]
 then echo Google
 elif [[ $PLATFORMDATA == *"amazon"* ]]
 then echo Amazon
 elif [[ $PLATFORMDATA == *"Microsoft Corporation"* ]]
 then echo Azure
 elif [[ $PLATFORMDATA == *"OracleCloud"* ]]
 then echo Oracle
 elif [[ $PLATFORMDATA == *"DigitalOcean"* ]]
 then echo DigitalOcean
 elif [[ $PLATFORMDATA == *"Alibaba Cloud ECS"* ]]
 then echo Alibaba
else
 echo Unknown
fi

