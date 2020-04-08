#!/bin/bash
if [ -f ../sync-dailies.config ]; then
  . ../sync-dailies.config
  OLDCODENAME=${CODENAME}
else
  CODENAME=$1
  OLDCODENAME=${CODENAME}
fi
if [ "${CODENAME}" = "" ]; then
  echo "No codename provided!"
  exit 1
fi
if [ "${MIRROR}" = "" ]; then
  MIRROR=http://cdimage.ubuntu.com
fi
zsync ${MIRROR}/lubuntu/daily-live/current/${CODENAME}-desktop-amd64.iso.zsync -i ./${OLDCODENAME}-desktop-amd64.iso
rm *.zs-old

