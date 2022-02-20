#!/bin/sh

if busybox [ -f /system/xbin/atc ]; then
  atc_path=/system/xbin/atc
elif busybox [ -f /app/bin/atc ]; then
  atc_path=/app/bin/atc
elif busybox [ "$atc_path" == "" ]; then
  echo "atc not found"
  exit 127
fi

ex=`ps | busybox grep -c "add_param"`

if busybox [ $ex -ne 0 ] && busybox [ "${1}" != "" ]; then
  busybox killall add_param
fi

$atc_path "${1}"

res=${?}

if busybox [ $ex -ne 0 ] && busybox [ "${1}" != "" ]; then
  /app/webroot/WebApp/common/add_param &
fi

exit $res
