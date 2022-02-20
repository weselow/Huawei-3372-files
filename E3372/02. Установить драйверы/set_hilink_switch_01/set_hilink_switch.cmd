@title Управление переключением

@setlocal

@prompt $G 

@set VID=12D1
@set PID=1F01
@set REV=0102

@echo.
@echo Управление переключением HiLink-модемов и роутеров Huawei
@echo во вторичную USB-композицию в Windows
@echo.
@echo Выберите действие:
@echo 1 - включить переключение
@echo 2 - отключить переключение
@echo 0 - выход
@set choice=
@set /P choice=": "

@if "%choice%" == "0" goto :eof

@^
if not "%choice%" == "1" (
if not "%choice%" == "2" (
  echo.
  echo Неверный ввод
  goto quit
))

@if "%choice%" == "2" goto l1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbflags\%VID%%PID%%REV%" /v "osvc" /t REG_BINARY /d "01ee" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\usbflags\%VID%%PID%%REV%" /v "SkipContainerIdQuery" /t REG_BINARY /d "01000000" /f

@goto quit
:l1

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\usbflags\%VID%%PID%%REV%" /f

:quit

@echo.
@echo Работа скрипта завершена. Нажмите любую клавишу
@pause > nul
