@prompt $G 

adb connect 192.168.8.1:5555

adb shell mount -o remount,rw /system /system

adb push atc.sh /system/etc
adb shell chmod 777 /system/etc/atc.sh

adb push add_param.sh /system/etc
adb shell chmod 777 /system/etc/add_param.sh

adb shell "busybox sed -i '/add_param.sh/d' /system/etc/autorun.sh"
adb shell "busybox echo -e '\n/system/etc/add_param.sh' >> /system/etc/autorun.sh"

adb shell mount -o remount,ro /system /system

@echo.
@echo После нажатия клавиши устройство будет перезагружено
@pause > nul

adb reboot

@echo.
@pause
