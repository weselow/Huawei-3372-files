@prompt $G 

adb connect 192.168.8.1:5555

adb shell mount -o remount,rw /system /system

adb shell "busybox sed -i '/add_param.sh/d' /system/etc/autorun.sh"

adb shell mount -o remount,ro /system /system

@echo.
@echo ��᫥ ������ ������ ���ன�⢮ �㤥� ��१���㦥��
@pause > nul

adb reboot

@echo.
@pause
