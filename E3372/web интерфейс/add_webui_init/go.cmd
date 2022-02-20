@prompt $G 

bin\adb connect 192.168.8.1:5555

bin\adb shell mount -o remount,rw /system /system

bin\adb shell "busybox sed -i '/webui_init.sh/d' /system/etc/autorun.sh"
bin\adb shell "busybox echo -e '\n/app/webroot/webui_init.sh' >> /system/etc/autorun.sh"

bin\adb shell mount -o remount,ro /system /system

@echo.
@echo После нажатия клавиши устройство будет перезагружено
@pause > nul

bin\adb reboot

@echo.
@pause
