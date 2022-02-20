#!/bin/sh

if busybox [ ! -f /app/webroot/WebApp/common/add_param ]; then
  exit
fi

/app/webroot/WebApp/common/add_param &

if busybox [ ! -f /system/xbin/atc ]; then
  if busybox [ ! -f /app/bin/atc ]; then
    exit
  fi
fi

busybox cp /system/etc/atc.sh /sbin/atc
