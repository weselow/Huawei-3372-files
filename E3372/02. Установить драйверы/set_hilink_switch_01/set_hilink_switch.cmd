@title ��ࠢ����� ��४��祭���

@setlocal

@prompt $G 

@set VID=12D1
@set PID=1F01
@set REV=0102

@echo.
@echo ��ࠢ����� ��४��祭��� HiLink-������� � ���஢ Huawei
@echo �� ������ USB-��������� � Windows
@echo.
@echo �롥�� ����⢨�:
@echo 1 - ������� ��४��祭��
@echo 2 - �⪫���� ��४��祭��
@echo 0 - ��室
@set choice=
@set /P choice=": "

@if "%choice%" == "0" goto :eof

@^
if not "%choice%" == "1" (
if not "%choice%" == "2" (
  echo.
  echo ������ ����
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
@echo ����� �ਯ� �����襭�. ������ ���� �������
@pause > nul
