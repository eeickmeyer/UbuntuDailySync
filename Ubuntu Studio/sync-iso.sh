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
zsync ${MIRROR}/ubuntustudio/dvd/current/${CODENAME}-dvd-amd64.iso.zsync -i ./${OLDCODENAME}-dvd-amd64.iso
rm *.zs-old

