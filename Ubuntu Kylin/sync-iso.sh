#!/bin/bash
if [ "${OLDCODENAME}" = "" ]; then
  if [ -f ../sync-dailies.config ]; then
    . ../sync-dailies.config
    OLDCODENAME=${CODENAME}
  else
    CODENAME=$1
    OLDCODENAME=${CODENAME}
  fi
fi
if [ "${CODENAME}" = "" ]; then
  echo "No codename provided!"
  exit 1
fi
if [ "${MIRROR}" = "" ]; then
  MIRROR=http://cdimage.ubuntu.com
fi
if [ "$1" = "-i" ]; then
  zsync ${MIRROR}/ubuntukylin/daily-live/current/${CODENAME}-desktop-amd64.iso.zsync -i $2
else
  zsync ${MIRROR}/ubuntukylin/daily-live/current/${CODENAME}-desktop-amd64.iso.zsync -i ./${OLDCODENAME}-desktop-amd64.iso
fi
rm *.zs-old

