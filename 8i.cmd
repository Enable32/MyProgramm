<# :
@echo off
@SetLocal EnableExtensions EnableDelayedExpansion
@REM ��������� ������������
@set winup="false"
@echo "%~n0 %*" | findstr /ic:"winup" > NUL
@if %errorlevel% EQU 0 powershell -nop -ex Bypass -c "[ScriptBlock]::Create((gc '%~0') -join [Char]10).Invoke()"
@chcp 1251 >nul
@TITLE Realme 8i - Utility
@set FileName=.
@set whomenu=.
@set dialog="about:<input type=file id=FILE><script>FILE.click();new ActiveXObject
@set dialog=%dialog%('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);
@set dialog=%dialog%close();resizeTo(0,0);</script>"
@set don'tusemtkclient=0
@set adb="%~dp0\files\adb.exe"
@set logfile=.
@set fileapk=.
@set "adbr=."
@set "namephone=."
@taskkill /im adb.exe /f >nul 2>&1
@taskkill.exe /fi "WINDOWTITLE eq adb devices" /f >nul 2>&1
@set "modcon=mode con cols=93 lines=35"
@set "color=color 17"
@%color%
@%modcon%
@cd/d "%~dp0"
@set Thisversion=5.9.8
5.9.8

:1
@mode con cols=101 lines=10
@color 07
REM ��������� ��������-����������
ping www.google.nl -n 1 -w 100 |>nul find /i "TTL=" && goto CheckUpdate
call :EchoColor "                  ���������� ��������� ���������� ���������, ����������� ��������" Red & echo.     
echo.
call :EchoColor "   ������������� ������ ������ �� �������������, ������� ��� ������ ����������� �������� ���������" Red & echo.   
echo.
pause
goto continuation
REM �������� ���������� ���������
:CheckUpdate
cls
@mode con cols=72 lines=10
curl -g -k -L -# -o "%temp%\Version.bat" "https://pastebin.com/raw/KFtskTJR" >nul 2>&1
call "%temp%\Version.bat"
del /q /s "%temp%\Version.bat" >nul 2>&1 
if "%Thisversion%" lss "%Version%" (goto Update) else (goto continuation)
REM ���������� ���������
:Update
@color 0
@mode con cols=97 lines=17
cls
call :EchoColor "                            �� ����������� ������ ������ - %Thisversion%" red & echo.
call :EchoColor "                                 ���������� ������ - %Version%" Green & echo.
echo. 
call :EchoColor "                                       ������� ���������:" Green & echo. 
call :EchoColor "  5.9.8 ��������� �������������� � ��� ����������� � ���� ������,����������� ���� ��� 1773�����" Red & echo.  
call :EchoColor "            5.8.2-5.9.7 ���������� ������������� ��������� 1349�����" Red & echo.   
call :EchoColor "               4.5.5-5.8.1 �������� �������� �� mtkclient" Red & echo.   
call :EchoColor "                  3.5.3-4.5.4 �������� ����� �������������" Red & echo.   
call :EchoColor "                        3.5.2 ������� ������� ������" Red & echo. 
call :EchoColor "        2.0.1-3.5.1 ������� ��������� �����, � ��������� ����,������ ������ ���� 1286�����" Red & echo. 
call :EchoColor "                1.0.0-2.0.0 ������� �������� mtkclient(-�) 987�����" Red & echo.   
call :EchoColor "                     0.0.1 �������� ��������� 536�����" Red & echo.   
echo. 
call :EchoColor "               ������� ����� �������, ����� �������� ���������" Blue & echo.                   
del /q /s "%temp%\Version.bat" >nul 2>&1 
pause>nul
goto update
curl -g -k -L -# -o %0 "https://github.com/Enable32/MyProgramm/raw/main/8i-�����������.cmd" >nul 2>&1 & call %0
exit

rem ��� ��������� ����� ������ ��� ��� ��� �� ����� ������������ mtkclient
FOR /F "usebackq tokens=*" %%a IN (`more "setting.inf" ^| findstr /ic:"set don'tusemtkclient=1"`) DO (
set don'tusemtkclient=1
goto STARTS
)

:continuation
@%modcon%
@%color%
REM ������� ��� �������� �� ����� ���� ��... ��� ���� ���������
IF EXIST ".\files\boot_magisk_a20.img" (set flesh�20=flesh�20 & set c=c) ELSE set viewcoreerror=viewcoreerror & set errorviewcore1=�� ������� ���� a20, & set flesh�20=errorviewcoreerror
IF EXIST ".\files\boot_magisk_a21.img" (set flesh�21=flesh�21 & set a=a) ELSE set viewcoreerror=viewcoreerror & set errorviewcore2=�� ������� ���� a21, & set flesh�21=errorviewcoreerror
IF EXIST ".\files\boot_magisk_a32.img" (set flesh�32=flesh�32 & set l=l) ELSE set viewcoreerror=viewcoreerror & set errorviewcore3=�� ������� ���� a32, & set flesh�32=errorviewcoreerror
IF EXIST ".\files\boot_magisk_a46.img" (set flesh�46=flesh�46 & set l2=l) ELSE set viewcoreerror=viewcoreerror & set errorviewcore4=�� ������� ���� a46. & set flesh�46=errorviewcoreerror
%c%%a%%l%%l2% :settinginisetting
call :%viewcoreerror%
goto launch
exit /b
:settinginisetting
set verfile=setting.inf
set tmpfile=setting.inf.tmp
set "seek=set don'taskaboutthecore"
FOR /F "usebackq tokens=*" %%a IN (`more "setting.inf" ^| findstr /ic:"set don'taskaboutthecore=1"`) DO (goto settinginisetting0)
:settinginisetting0
if exist %tmpfile% (del /q %tmpfile%)
for /f "delims=" %%a in (%verfile%) do (
  (echo %%a)|>nul find /i "%seek%="&&((echo %seek%=0)>>%tmpfile%)
  (echo %%a)|>nul find /i "%seek%="||(echo %%a)>>%tmpfile%
)
copy /y %tmpfile% %verfile% >nul
del /f /q %tmpfile% >nul
exit /b
:viewcoreerror
goto viewcoreerror2
exit /b
:viewcoreerror2
cls
FOR /F "usebackq tokens=*" %%a IN (`more "setting.inf" ^| findstr /ic:"set don'taskaboutthecore=1"`) DO (set result=%%a)
if /i "%result%"=="set don'taskaboutthecore=1 " (goto launch)
cls
ECHO.
ECHO. ======================================================================================
Echo.      %errorviewcore1%%errorviewcore2%%errorviewcore3%%errorviewcore4%    
Echo.                    
Echo.  �� ������ ������� ������ ������ � ����� ������ 1, ��� ������ �� ��������� � ������ 2              
ECHO. ======================================================================================
ECHO.                 1.� �� ���� ������������ ��� ����(����) ��� ����� ��������
ECHO.                          (����� � ���� �����/������ ����� ���������)
ECHO.                 2.������ �� ���������� ��� ��� ����
ECHO.     (����� ������ � ����� � ���������� ���� setting.inf � �� ����� �������� �����)
ECHO.                 3.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto launch
if /i "%choice%"=="2" goto configsettinginf
if /i "%choice%"=="3" exit
goto viewcoreerror2
exit /b
:configsettinginf
@cd/d "%~dp0"
if not EXIST "setting.inf" (Echo set don'taskaboutthecore=^1>>setting.inf & goto launch)
:settinginisetting
set verfile=setting.inf
set tmpfile=setting.inf.tmp
set "seek=set don'taskaboutthecore"
FOR /F "usebackq tokens=*" %%a IN (`more "setting.inf" ^| findstr /ic:"set don'taskaboutthecore=0"`) DO (goto settinginisetting1)
:settinginisetting1
if exist %tmpfile% (del /q %tmpfile%)
for /f "delims=" %%a in (%verfile%) do (
  (echo %%a)|>nul find /i "%seek%="&&((echo %seek%=1)>>%tmpfile%)
  (echo %%a)|>nul find /i "%seek%="||(echo %%a)>>%tmpfile%
)
copy /y %tmpfile% %verfile% >nul
del /f /q %tmpfile% >nul
exit /b
exit /b
:launch
cls
for  /f "tokens=1*" %%i IN ('more ".\files\temp\error.txt" ^| findstr /ic:"python"') DO set python=%%i
if /I "%python%"=="python," (set launch2=:launch2)
for  /f "tokens=1*" %%i IN ('more ".\files\temp\error.txt" ^| findstr /ic:"Git"') DO set Git=%%i
if /I "%Git%"=="Git," (set launch2=:launch2)
for  /f "tokens=1*" %%i IN ('more ".\files\temp\error.txt" ^| findstr /ic:"UsbDk"') DO set UsbDk=%%i
if /I "%UsbDK%"=="UsbDK." (set launch2=:launch2)
if /I "%launch2%"==":launch2" (call :%launch2%)
if EXIST "%~dp0files\temp\mtkfolder.txt" (goto mtkpereizbranie)
goto launch2.5
exit /B
:launch2.5
cls
ECHO.
ECHO. ======================================================================================
ECHO.        
ECHO.                         � ��� ���������� mtkclient?
ECHO.                    
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto papka
if /i "%choice%"=="2" goto launch2.5.5
cls
goto launch2.5
:launch2.5.5
cls
ECHO.
ECHO. ======================================================================================
ECHO.                         
ECHO.                       �������� ���� �� ��������
ECHO.                    
ECHO. ======================================================================================
ECHO.                             1.������� ������� ��������
ECHO.                                  
ECHO.                             2.������� � ���������� mtkclient
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto downloadFile
if /i "%choice%"=="2" goto next
cls
goto launch2.5.5
exit /b
:launch2
cls
ECHO.
ECHO. ======================================================================================
ECHO. 
ECHO.          � ��� �� ���������� %python%%Git%%UsbDK%
Echo.                     
ECHO. ======================================================================================
ECHO.                    1.� ������ � ��������� ��� (������� � ���������� ����) 
ECHO.                                  
ECHO.                    2.��������� ������� ���������� ����� (������)
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto launch2.5
if /i "%choice%"=="2" goto downloadFileonlythesefiles
goto launch2
exit /b
:downloadFileonlythesefiles
2>nul Reg Query HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion |Find /i "Installer" >nul && ( for  /f "delims=" %%i IN ('echo x64') DO set bitdepth=%%i) || (for  /f "delims=" %%i IN ('echo x32') DO set bitdepth=%%i )
powershell Import-Module BitsTransfer
cls
if /I "%python%"=="python," (call :downloadPython )  else (Echo.)
if /I "%Git%"=="Git," (call :downloadGit )  else (Echo.)
if /I "%UsbDK%"=="UsbDK." (call :downloadUsbDK )  else (Echo.)
call :%errorAll%
goto downloadFileinstall
exit /b
:downloadPython
if /i %bitdepth%==x64 	(
call :64Python
) else (
call :32Python
)
exit /b
:64Python
md "downloadFile" >nul 2>&1
powershell Start-BitsTransfer -source "1https://www.python.org/ftp/python/3.9.8/python-3.9.8-amd64.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorpython=������ ���������� python & set errorAll=errorAll & set errornamepython=python,)
exit /b
:32Python
md "downloadFile" >nul 2>&1
powershell Start-BitsTransfer -source "1https://www.python.org/ftp/python/3.9.8/python-3.9.8.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok || (Echo.Error & set errorpython=������ ���������� python & set errorAll=errorAll & set errornamepython=python,)
exit /b
:downloadGit
if /i %bitdepth%==x64 	(
call :64Git
) else (
call :32Git
)
exit /b
:64Git
md "downloadFile" >nul 2>&1
powershell Start-BitsTransfer -source "1https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-64-bit.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorGit=������ ���������� Git & set errorAll=errorAll & set errornameGit=Git,)
exit /b
:32Git
md "downloadFile" >nul 2>&1
powershell Start-BitsTransfer -source "1https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-32-bit.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorGit=������ ���������� Git & set errorAll=errorAll & set errornameGit=Git,)
exit /b
:downloadUsbDK
if /i %bitdepth%==x64 	(
call :64UsbDK
) else (
call :32UsbDK
)
exit /b
:64UsbDK
md "downloadFile" >nul 2>&1
powershell Start-BitsTransfer -source "1https://github.com/daynix/UsbDk/releases/download/v1.00-22/UsbDk_1.0.22_x64.msi" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorUsbDk=������ ���������� UsbDk & set errorAll=errorAll & set errornameusbdk=UsbDk.)
exit /b
:32UsbDK
md "downloadFile" >nul 2>&1	
powershell Start-BitsTransfer -source "1https://github.com/daynix/UsbDk/releases/download/v1.00-22/UsbDk_1.0.22_x86.msi" -destination "downloadFile"  >nul 2>&1 && Echo Ok  || (Echo.Error & set errorUsbDk=������ ���������� UsbDk & set errorAll=errorAll & set errornameusbdk=UsbDk.)
exit /b
:mtkpereizbranie
for  /f "delims=" %%i IN ('more "%~dp0files\temp\mtkfolder.txt"') DO set Foldermtk=%%i
if not EXIST "%Foldermtk%\setup.py" (
del /s /q ."\files\temp\mtkfolder.txt"
rd  /s /q "%~dp0files\temp\mtkfolder.txt"
goto papka
)
goto STARTS
exit/b
:papka
%modcon%
set "choicefoldersinstall=�������� ����� � ������������ mtkclient"
:papka1
%modcon%
del /q "%~dp0files\temp\mtkfolder.txt"
cls
ECHO %choicefoldersinstall%
Echo ������: C:\Users\admin\git\mtkclient

for /f "usebackq delims=" %%i in (
    `@"%systemroot%\system32\mshta.exe" "javascript:var objShellApp = new ActiveXObject('Shell.Application');var Folder = objShellApp.BrowseForFolder(0, '�������� �����',1, '::{20D04FE0-3AEA-1069-A2D8-08002B30309D}');try {new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(Folder.Self.Path)};catch (e){};close();" ^
    1^|more`
) do set sFolderName=%%i

if defined sFolderName (
    echo ������� �����: %sFolderName%
) else (
    exit
)
for %%i in ("%sFolderName%") do set "name=%%~nxi"
Echo %sFolderName%>"%~dp0files\temp\mtkfolder.txt"
goto srawnenie
exit/b 
:srawnenie
if /I "%name%."=="mtkclient." (goto mtkpereizbranie)  else (set "choicefoldersinstall=�������� ��������� �����: mtkclient" & goto papka1)  >nul 2>&1
exit/b
:STARTS
@echo off
@%modcon%
@cd/d "%~dp0"
@taskkill /im adb.exe /f >nul 2>&1
@taskkill.exe /fi "WINDOWTITLE eq adb devices" /f >nul 2>&1
@del /q /s %sniffer%
@for  /f "delims=" %%i IN ('more "%~dp0files\temp\mtkfolder.txt"') DO set Foldermtk=%%i
@for  /f "delims=" %%i IN ('more "%~dp0files\temp\phoneversion.txt"') DO set phoneversion=%%i
@For %%f In (%Foldermtk%) Do (Set "FileName=%%~nxf")
@if /I "%don'tusemtkclient%"=="1" (set "Foldermtk=����������� ��-�� ��������") else (
@if /I "%FileName%."=="mtkclient." (Echo.)  else (goto papka)  
)
@if /I "%phoneversion%."=="." (echo.)  else (set phoneversiondisplay=���� ������ ��������: %phoneversion%, ���� ��� ������� 202)  
@del /s /q ".\files\temp\error.txt"
CLS
ECHO                            ��������� �������� �������!!
ECHO. ===========================================================================================
Echo                          (adb)-������������� ��������� adb
Echo                     (mtkclient)-������������� ��������� mtkclient
ECHO                          �� �������� ���������� ��������! 
REM ECHO. ����� �������� ������ ������� ��� ������������ ���� ���������� ������� 100 � ������� Enter
ECHO.                 ����� ������ ����� � ��� ������ �������� ������� 200 (adb)
ECHO.                        �������� ����� ����� ������ � ��������� ���
Echo                            ��������� ������� �� �����    
Echo                         ����� ����� ���������� ����������
Echo                      ������ ��� ����� � ���� ���� �� ����� ��
Echo                         ����� ��������� ������� �� �����
Echo                             ����� ���������:En32
Echo                       ����� � mtk: %Foldermtk%
Echo.                  %phoneversiondisplay%
ECHO. ===========================================================================================
ECHO.              1.������� ����� (boot,vbmeta � �.�) (mtkclient)
ECHO.
ECHO.              2.�������� �������� � �������� (mtkclient)
ECHO.           
ECHO.              3.�������������� ��������� (mtkclient)
ECHO.                    
ECHO.              4.�������� �������� ��� ���� (mtkclient)
ECHO.                    
ECHO.              6.������������ (adb)
ECHO.                    
ECHO.              7.������� �� ���� 4PDA
ECHO.
ECHO.              8.������������� (adb)+(mtkclient)
ECHO.
ECHO.              999.����������� ����� mtk
ECHO.
ECHO.              0.����� �� ���������
ECHO. ===========================================================================================
:CHO
set choice=
set /p choice= �������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" if /I "%don'tusemtkclient%"=="1" (goto errorsetting) else (goto damp)
if /i "%choice%"=="2" if /I "%don'tusemtkclient%"=="1" (goto errorsetting) else (goto deletuserdatametadata)
if /i "%choice%"=="3" if /I "%don'tusemtkclient%"=="1" (goto errorsetting) else (goto unlockseccfg) 
if /i "%choice%"=="4" if /I "%don'tusemtkclient%"=="1" (goto errorsetting) else (goto viboor recovery ili coremagiskB)  
if /i "%choice%"=="-5" goto miltizadacha
if /i "%choice%"=="6" goto reboot0.1
if /i "%choice%"=="7" goto Blog
if /i "%choice%"=="8" goto dopolnit
if /i "%choice%"=="999" if /I "%don'tusemtkclient%"=="1" (goto errorsetting) else (del /s /q "%~dp0files\temp\mtkfolder.txt" & goto papka) 
if /i "%choice%"=="100" goto errorstarts
if /i "%choice%"=="200" set whomenu=starts & goto versiaproshiwki
if /i "%choice%"=="202" goto phoneversiondisplay
if /i "%choice%"=="0" exit
GOTO STARTS
exit /b
:phoneversiondisplay

exit /b
:versiaproshiwki
@cd/d "%~dp0"
cls
Echo ������� � �������� �������� *#1234#, � ����� �� ������� ����� ��������
Echo �������� � ���� RMX3151_11_A.32 � A.32 
Echo ��� � ���� ����� ��������, �� ����� ��� �������� ���� �� ����
Echo.
Echo.%vershionphone%%vershionphone2%
Echo.
Echo.1)������������� �������� ����� ��������
Echo.2)������� �����-����
Echo.3)�����
Echo.
set choice=
set /p choice=��� �����:
if /i "%choice%"=="2" start "" "1https://youtu.be/5VMi5zI--6g" & GOTO %whomenu% 
if /i "%choice%"=="3" goto %whomenu% 
if /i "%choice%"=="1" goto versiaproshiwki1
GOTO versiaproshiwki
exit /b
:versiaproshiwki1
cls
cd/d "%~dp0files" 
adb devices -l | findstr /ic:"RMX3151" >nul 2>&1
if "%errorlevel%"=="1" (
call :EchoColor "�� �������� �������� ������� �� usb" Green & echo. & echo. & echo. & echo realme 8i �� ��������� � ����������  
echo. 
echo ���������� ������� ����� ������, ��������� ���� ������ ���
echo. 
ping -n 4 127.0.0.1>nul 
goto versiaproshiwki1
)
set "vershionphone=���� ������ ��������:"
for %%a in (a.46 a.21 a.20 a.32) do (
adb shell getprop ro.build.display.id | findstr /ic:"%%a" >nul 2>&1
if /i "!errorlevel!"=="0" set vershionphone2=%%a & set "vershionphone%%a=(�������������)" && echo %%a>"%~dp0files\temp\phoneversion.txt" & set phoneversiondisplay=���� ������ ��������: %phoneversion%, ���� ��� ������� 202
)
set "nocoretext=���� �������� �������� �������� �������������, �� ��� �������� ��� �� ��� ���������� ������"
GOTO versiaproshiwki 
exit /b
:damp
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                            1)���� boot.img � vbmeta.img 
ECHO.                   2)����� ����� ������ ��������(nvram,nvdata,nvcf)    
ECHO.                         
ECHO. ======================================================================================
ECHO.                             1.���� boot.img � vbmeta.img
ECHO.                                  
ECHO.                             2.����� ����� ������ ��������
ECHO.                                  
ECHO.                             3.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto damp1
if /i "%choice%"=="2" goto damp2
if /i "%choice%"=="3" goto STARTS
goto damp
exit /b
:damp1
CLS
@cd/d "%Foldermtk%"
Echo ������� �� ����������� �������� ��� ������ ���������
Echo ���������� �� 5 � ���������� ��� � ����������
Echo ����� ����������� ���������� ����� �� 5 � ��������� ������
Echo ������ ����� ��� � ���� ���� ���� ������ ������
del /q /s "boot.img" >nul 2>&1 
python mtk r boot,vbmeta boot.img,vbmeta.img >nul 2>&1 
cls
if not EXIST "boot.img" (goto errorfoldermtk) >nul 2>&1 
ECHO.	���� ���� � vbmeta(�) ����� ���������� �� ����� mtkclient � ����� � ����������
md backup >nul 2>&1 
ping -n 4 127.0.0.1>nul 
copy "boot.img" "%~dp0backup"
copy "vbmeta.img" "%~dp0backup"
GOTO STARTS 
exit /b 
:damp2
CLS
@cd/d "%Foldermtk%"
Echo ������� �� ����������� �������� ��� ������ ���������
Echo ���������� �� 5 � ���������� ��� � ����������
Echo ����� ����������� ���������� ����� �� 5 � ��������� ������
Echo ������ ����� ��� � ���� ���� ���� ������ ������
del /q /s "nvcfg.img" >nul 2>&1 
del /q /s "nvdata.img" >nul 2>&1 
del /q /s "nvram.img" >nul 2>&1 
python mtk r nvram,nvdata,nvcfg nvram.img,nvdata.img,nvcfg.img >"errordamp.txt"
if not EXIST "nvcfg.img" (goto errorfoldermtk) >nul 2>&1
if not EXIST "nvdata.img" (goto errorfoldermtk) >nul 2>&1
if not EXIST "nvram.img" (goto errorfoldermtk) >nul 2>&1
cls
ECHO.	����� ����� ���������� �� ����� mtkclient � ����� � ����������
md backup >nul 2>&1 
ping -n 4 127.0.0.1>nul 
FOR /F "usebackq tokens=*" %%a IN (`dir /b * ^|findstr /ic:"nv"`) DO (
copy "%%a" "%~dp0backup"
)
GOTO STARTS 
exit /b 
:deletuserdatametadata
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                    �� ����� ������ �������� �������� � ��������?
ECHO.                         ��� ����� ��� ������ � ��������!
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto zateret
if /i "%choice%"=="2" goto STARTS
goto deletuserdatametadata
exit /b
:zateret
CLS
@cd/d "%Foldermtk%"
Echo ������� �� ����������� �������� ��� ������ ���������
Echo ���������� �� 5 � ���������� ��� � ����������
Echo ����� ����������� ���������� ����� �� 5 � ��������� ������
Echo ������ ����� ��� � ���� ���� ��������� �������� � �������� ������ ������
python mtk e metadata,userdata >"errordeletusermetadata.txt"
more "%Foldermtk%\errordeletusermetadata.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=��������� �������� � �������� & goto errorfoldermtk
del /q "errordeletusermetadata.txt"
GOTO STARTS 
exit /b 
:viboor recovery ili coremagiskB
set rebo=viboor recovery ili coremagiskB
md "%Foldermtk%\vbmeta.img"  >nul 2>&1
rd "%Foldermtk%\vbmeta.img"  >nul 2>&1
if %errorlevel% == 1 goto viboor recovery ili coremagiskB2
if %errorlevel% == 0 Echo.
:viboornosdamp
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                   ��� ����� ����������� ������� ���� boot � vbmeta
ECHO.  
ECHO. ======================================================================================
ECHO.                             1.OK
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto damp
goto damp
exit /b
:viboor recovery ili coremagiskB2
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                            ��� ������ �������?
ECHO.  
ECHO. ======================================================================================
ECHO.                             1.��������
ECHO.                                  
ECHO.                             2.����
ECHO.                                  
ECHO.                             3.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto recovery
if /i "%choice%"=="2" goto coremagiskB
if /i "%choice%"=="3" goto STARTS
goto viboor recovery ili coremagiskB2
exit /b
:coremagiskB
set wayfilecoremagisk=
set filecoremagisk=
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                            ������ ������� ���� ����?
ECHO.       ��� �� ������ ������ ��� � ������� ���� ��� ������������ magisk-��
ECHO.  
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO.                                  
ECHO.                             3.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto core1
if /i "%choice%"=="2" goto nocore
if /i "%choice%"=="3" goto viboor recovery ili coremagiskB
goto coremagiskB
exit /b
:core1
for /f "tokens=* delims=" %%i in ('mshta.exe %dialog%') do set "wayfilecoremagisk=%%i" & set filecoremagisk=%%~xni
Echo %wayfilecoremagisk%
Echo %filecoremagisk%
CLS
:core1.5
cls
ECHO.
ECHO. ======================================================================================
ECHO.                       �� ����� ������� � ����� ���� ?
ECHO.           �������� ���� ����� ��������� � ��� ��� ������ �������?
ECHO.  %wayfilecoremagisk%
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto core2
if /i "%choice%"=="2" goto coremagiskB
goto core1.5
exit /b
:core2 
cls
copy "%wayfilecoremagisk%" "%Foldermtk%"
@cd/d "%Foldermtk%"
Echo ������� �� ����������� �������� ��� ������ ���������
Echo ���������� �� 5 � ���������� ��� � ����������
Echo ����� ����������� ���������� ����� �� 5 � ��������� ������
Echo ������ ����� ��� � ���� ���� �������� ���� ������ ������
python mtk w boot,vbmeta "%filecoremagisk%",vbmeta.img.empty >errorcore2.txt
more "%Foldermtk%\errorcore2.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=�������� ���� & goto errorfoldermtk
GOTO STARTS 
exit /b 
:nocore
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                      �������� ���� ��� ���������� ��������
ECHO.          ����� ������ ��� ������ ����� �������� ������� 200 � ������� Enter
ECHO. %nocoretext%
ECHO. 
ECHO. ======================================================================================
ECHO.                             1.�������� �32 %vershionphoneA.32%                     
ECHO.                                  
ECHO.                             2.�������� �20 %vershionphoneA.20%  
ECHO.                                  
ECHO.                             3.�������� �21 %vershionphoneA.21%  
ECHO.                                  
ECHO.                             4.�������� �46 %vershionphoneA.46%  
ECHO.                                  
ECHO.                             9.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto %flesh�32%
if /i "%choice%"=="2" goto %flesh�20%
if /i "%choice%"=="3" goto %flesh�21%
if /i "%choice%"=="4" goto %flesh�46%
if /i "%choice%"=="200" set whomenu=nocore & goto versiaproshiwki
if /i "%choice%"=="9" goto coremagiskB
goto nocore
echo.
exit /b
:flesh�32
set wayfilecoremagisk=%~dp0files\boot_magisk_a32.img
set filecoremagisk=boot_magisk_a32.img
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                       �� ����� ������� � ����� ���� ?
ECHO.                       �� ������ ������� ���� ��� �32?
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto core2
if /i "%choice%"=="2" goto nocore
echo.
exit /b
:flesh�20
set wayfilecoremagisk=%~dp0files\boot_magisk_a20.img
set filecoremagisk=boot_magisk_a20.img
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                       �� ����� ������� � ����� ���� ?
ECHO.                       �� ������ ������� ���� ��� �20?
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto core2
if /i "%choice%"=="2" goto nocore
echo.
exit /b
:flesh�21
set wayfilecoremagisk=%~dp0files\boot_magisk_a21.img
set filecoremagisk=boot_magisk_a21.img
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                       �� ����� ������� � ����� ���� ?
ECHO.                       �� ������ ������� ���� ��� �21?
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto core2
if /i "%choice%"=="2" goto nocore
echo.
exit /b
:flesh�46
set wayfilecoremagisk=%~dp0files\boot_magisk_a46.img
set filecoremagisk=boot_magisk_a46.img
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                       �� ����� ������� � ����� ���� ?
ECHO.                       �� ������ ������� ���� ��� �46?
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto core2
if /i "%choice%"=="2" goto nocore
echo.
exit /b

:unlockseccfg
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO.              ����� �������������� ���������� ����� ����� ��� ������ � �������� 
ECHO.                  ��������� �� � ���������� �� sd-����� ����� �� ��������
ECHO.                     �� ����� ������ �������������� ���������? 
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto unlock1
if /i "%choice%"=="2" goto STARTS
goto unlockseccfg
echo.
exit /b
:unlock1
cls
@cd/d "%Foldermtk%"
Echo ������� �� ����������� �������� ��� ������ ���������
Echo ���������� �� 5 � ���������� ��� � ����������
Echo ����� ����������� ���������� ����� �� 5 � ��������� ������
Echo ������ ����� ��� � ���� ���� ������������� ���������� ������ ������
python mtk e metadata,userdata >"errordeletusermetadata.txt"
more "%Foldermtk%\errordeletusermetadata.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=��������� �������� � �������� & goto errorfoldermtk
del /q "errordeletusermetadata.txt"
python mtk da seccfg unlock >unlock1.txt
more "%Foldermtk%\unlock1.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=������������� ���������� & goto errorfoldermtk
del /q "unlock1.txt"
GOTO STARTS 
exit /b 
:Blog
start "" "1https://4pda.to/forum/index.php?showtopic=1046142&view=findpost&p=114440082q1"
GOTO STARTS 
exit /b 

:downloadFile
2>nul Reg Query HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion |Find /i "Installer" >nul && ( for  /f "delims=" %%i IN ('echo x64') DO set bitdepth=%%i) || (for  /f "delims=" %%i IN ('echo x32') DO set bitdepth=%%i )
powershell Import-Module BitsTransfer
if /i %bitdepth%==x64 	(
call :64
) else (
call :32
)
:downloadFileinstall
del .\files\temp\error.txt >nul 2>&1
cls
@cd/d "%~dp0downloadFile"
set NameInf="%~dp0files\�������� MTKClient\cdc-acm.inf"
for  /f "delims= " %%i IN ('dir /b ^| findstr /ic:"python"') DO set python=%%i
for  /f "delims= " %%i IN ('dir /b ^| findstr /ic:"Git"') DO set Git=%%i
for  /f "delims= " %%i IN ('dir /b ^| findstr /ic:"UsbDk"') DO set UsbDk=%%i
set nameintsalldrive=installdriver.cmd
echo @echo off>%nameintsalldrive%
echo TITLE driverinstall>>%nameintsalldrive%
echo @cd/d "%%~dp0">>%nameintsalldrive%
echo @chcp 1251 ^>nul >>%nameintsalldrive%
echo SetLocal EnableExtensions EnableDelayedExpansion >>%nameintsalldrive%
echo set NameInf="%~dp0files\�������� MTKClient\cdc-acm.inf" >>%nameintsalldrive%
echo echo ��� ��������� ��������� >>%nameintsalldrive%
echo set python=%%1 >>%nameintsalldrive%
echo set git=%%2 >>%nameintsalldrive%
echo set UsbDk=%%3 >>%nameintsalldrive%
echo "%%python%%" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 >>%nameintsalldrive%
echo echo.>>%nameintsalldrive%
echo echo ��� ��������� ������ >>%nameintsalldrive%
echo "%%Git%%" /VERYSILENT >>%nameintsalldrive%
echo rundll32 advpack,LaunchINFSection %%NameInf%%,DefaultInstall,0 ^&^& start "" "%~dp0files\�������� MTKClient\install.bat" >>%nameintsalldrive%
echo start "" "%%UsbDk%%">>%nameintsalldrive%
echo del "%%~0" ^& exit >>%nameintsalldrive%
powershell.exe -noprofile "Start-Process '%nameintsalldrive%' '%python%','%Git%','%UsbDk%' -WindowStyle Maximized -Verb RunAs" >nul 2>&1
if /I "%errorlevel%"=="1" (
echo �� ���������� ���������� �������� � �������
echo.
echo ������� ����� ������ ����� ��������� �������
pause>nul
goto downloadFileinstall
)
cls
:next1
@cd/d "%~dp0"
echo ��� �������� � ������� �����������!
echo.
set choice=
set /p choice=������� ����� next, ����� ���������� mtkclient, ��� ���� �� ���������� ������� back:
if /i "%choice%"=="next" rd /q /s "%~dp0downloadFile" & goto next
if /i "%choice%"=="back" rd /q /s "%~dp0downloadFile" & goto launch
goto downloadFileinstall
:next
cls
Echo �������� ����� ���� ����� ���������� mtkclient
ping -n 4 127.0.0.1>nul 
:nextfoldermtkinstall
 cls
 Echo �������� ����� ���� ����� ���������� mtkclient
for /f "usebackq delims=" %%i in (
    `@"%systemroot%\system32\mshta.exe" "javascript:var objShellApp = new ActiveXObject('Shell.Application');var Folder = objShellApp.BrowseForFolder(0, '�������� ����� ���� ����� ���������� mtkclient',1, '::{20D04FE0-3AEA-1069-A2D8-08002B30309D}');try {new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(Folder.Self.Path)};catch (e){};close();" ^
    1^|more`
) do set mtkinstallfolder=%%i
if defined mtkinstallfolder (
    echo %mtkinstallfolder%
) else (
    goto nextfoldermtkinstall
)
cls 
:nextfoldermtkinstall2
Echo %mtkinstallfolder%mtkclient
set /p choice=��������� �� �� ������� ���� ��� ���������, �������� yes ��� no:
if /i "%choice%"=="yes" goto next2
if /i "%choice%"=="no" goto nextfoldermtkinstall
cls
goto nextfoldermtkinstall2
:next2
cls
del /q /s "%~dp0files\temp\mtkfolder.txt" >nul 2>&1
Echo ��� ���������� mtkclient ��������� �������
set nameinstallmtkclient="installmtkclient.cmd"
echo @echo off>%nameinstallmtkclient%
echo @TITLE installmtkclient>>%nameinstallmtkclient%
echo @cd/d "%%~dp0" >>%nameinstallmtkclient%
echo @chcp 1251 ^>nul >>%nameinstallmtkclient%
echo echo ��� ���������� mtkclient ��������� ������� >>%nameinstallmtkclient%
echo git clone "1https://github.com/bkerler/mtkclient" "%%1" ^>nul >>%nameinstallmtkclient%
echo del "%%~0" ^& exit >>%nameinstallmtkclient%
powershell.exe -noprofile "Start-Process '%nameinstallmtkclient%' '%mtkinstallfolder%mtkclient' -WindowStyle Maximized -Verb RunAs">nul 2>&1
if /I "%errorlevel%"=="1" (goto errormtkclient)
timeout 3 /nobreak >nul
Echo %mtkinstallfolder%mtkclient>"%~dp0files\temp\mtkfolder.txt"
@cd/d "%mtkinstallfolder%"
"C:\Program Files\Python39\python.exe" -m pip install --upgrade pip
cls
pip3 install -r requirements.txt
cls
@cd/d "%~dp0"
Echo %mtkinstallfolder%mtkclient>"%~dp0files\temp\mtkfolder.txt"
timeout 3 /nobreak >nul
rd /q /s "%~dp0downloadFile"
goto mtkpereizbranie
exit /b 
:errormtkclient
ping google.com >nul && (set errors1=���������� � ��������� ��������� ��� ���������� ������ & set errors2=���� ���� �������� mtkclient) || (set errors1=� ��� ����������� ����������� � ���������� & set errors2=�������� �������� � ��������� �������) >nul 2>&1
cls
Echo.������ ���������� mtkclient
Echo.������������� ���������, ���� ���������� �� ����������, ���������� � ��������� ��������� ��� ���������� ������
Echo.
Echo.%errors1%
Echo.%errors2%
ECHO. ======================================================================================
Echo.                       �������� ���� �� ��������
ECHO. ======================================================================================
ECHO.                    1.� ������ ��� (������� ����) 
ECHO.                                  
ECHO.                    2.��������� ������� ����������
ECHO. ======================================================================================   
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto papka
if /i "%choice%"=="2" goto next
goto errormtkclient
exit /b
:64
cls
Echo ��� ���������� python ��������� �������
@cd/d "%~dp0"
md "downloadFile" >nul 2>&1
powershell Start-BitsTransfer -source "1https://www.python.org/ftp/python/3.9.8/python-3.9.8-amd64.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorpython=������ ���������� python & set errorAll=errorAll & set errornamepython=python, & Echo python>>.\files\temp\error.txt)
Echo.
Echo ��� ���������� GIT ��������� �������
powershell Start-BitsTransfer -source "1https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-64-bit.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorGit=������ ���������� Git & set errorAll=errorAll & set errornameGit=Git, & Echo Git>>.\files\temp\error.txt)
Echo.
Echo ��� ���������� UsbDK ��������� �������
powershell Start-BitsTransfer -source "1https://github.com/daynix/UsbDk/releases/download/v1.00-22/UsbDk_1.0.22_x64.msi" -destination "downloadFile" >nul 2>&1 && Echo Ok   || (Echo.Error & set errorUsbDk=������ ���������� UsbDk & set errorAll=errorAll & set errornameusbdk=UsbDk. & Echo UsbDk>>.\files\temp\error.txt)
Echo.
cls
call :%errorAll%
exit /b 
:32
cls
Echo ��� ���������� python ��������� �������
@cd/d "%~dp0"
md "downloadFile" >nul 2>&1
powershell Start-BitsTransfer -source "1https://www.python.org/ftp/python/3.9.8/python-3.9.8.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok || (Echo.Error & set errorpython=������ ���������� python & set errorAll=errorAll & set errornamepython=python, & Echo python>>.\files\temp\error.txt)
Echo.
Echo ��� ���������� GIT ��������� �������
powershell Start-BitsTransfer -source "1https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-32-bit.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorGit=������ ���������� Git & set errorAll=errorAll & set errornameGit=Git, & Echo Git>>.\files\temp\error.txt)
Echo.
Echo ��� ���������� UsbDK ��������� �������
powershell Start-BitsTransfer -source "1https://github.com/daynix/UsbDk/releases/download/v1.00-22/UsbDk_1.0.22_x86.msi" -destination "downloadFile"  >nul 2>&1 && Echo Ok  || (Echo.Error & set errorUsbDk=������ ���������� UsbDk & set errorAll=errorAll & set errornameusbdk=UsbDk. & Echo UsbDk>>.\files\temp\error.txt)
cls
call :%errorAll%
exit /b
:errorAll
Echo %errornamepython%>.\files\temp\error.txt
Echo %errornameGit%>>.\files\temp\error.txt
Echo %errornameusbdk% >>.\files\temp\error.txt
ping google.com >nul && (set errors1=���������� � ��������� ��������� ��� ���������� ������ & set errors2=���� ���� �������� � ����������: %errornamepython%%errornameGit%%errornameusbdk%) || (set errors1=� ��� ����������� ����������� � ���������� & set errors2=��� ����� ����������: %errornamepython%%errornameGit%%errornameusbdk%) >nul 2>&1
cls
Echo.%errorpython%
Echo.%errorGit%
Echo.%errorUsbDk%
Echo.
Echo.����������� ����� �������: %bitdepth%
Echo.%errors1%
Echo.%errors2%
ECHO. ======================================================================================
Echo.                       �������� ���� �� ��������
ECHO. ======================================================================================
ECHO.                    1.� ������ � ��������� ��� (������� � ���������� ����) 
ECHO.                                  
ECHO.                    2.��������� ������� ����������
ECHO. ======================================================================================
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto next
if /i "%choice%"=="2" goto downloadFile
goto errorAll
exit /b

rem
ECHO ***************************************************************************************
ECHO *      ------------------------^< �������� ���������� ^>-------------------------      *
ECHO *                                                                                     *
ECHO *            ���� �� �������� �� ���� ����� - ���������� ���������� ��������.            *
ECHO ***************************************************************************************
ECHO.
ECHO. ...
ECHO.
rem

REM �� ������������ ����� ����
:installcoremagisk
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                      �� ����� ������� � ����� ���� �� �30
ECHO.            
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto coremagiskB
if /i "%choice%"=="2" goto STARTS
echo.
exit /b
REM 

:reboot0.1
@cd/d "%~dp0files\"
@IF EXIST "adb.exe" (cls) ELSE (cls & echo adb.exe ���� ����� & pause & exit)
ping -n 3 127.0.0.1>nul
call :adb_check_devices
@taskkill /im adb.exe /f >nul 2>&1
@taskkill.exe /fi "WINDOWTITLE eq adb devices" /f >nul 2>&1
ping -n 2 127.0.0.1>nul
tasklist | findstr /ic:"adb.exe" >nul 2>&1 
if /i "%errorlevel%"=="1" call :adb_check_devices
:reboot
cls
adb devices -l | findstr /ic:"device" >nul 2>&1
if "%errorlevel%"=="1" (
echo.%reboot1choise%  
call :EchoColor "�� �������� �������� ������� �� usb" Green & echo. & echo. & echo. & echo ������� �� ��������� � ���������� 
echo. 
echo ���������� ������� ����� ������, ��������� ���� ������ ���
echo. 
ping -n 3 127.0.0.1>nul 
goto reboot
)
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO. ����� ��������/��������� ���� � ������������� ������������ ������� "9", � ������� Enter
ECHO.           ��������� ��� �������� ����������� � ������� ����� ������� �� �������� 
ECHO.                               �������� ����� �������� 
ECHO.                            �������� ��� ����� �������������
ECHO. ======================================================================================
ECHO.                         1.������������� �������(���� �������)(adb)
ECHO.                                  
ECHO.                         2.������������� � �������� (adb)
ECHO.                                  
ECHO.                         3.��������� ������� (adb)
ECHO.                                  
ECHO.                         4.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" set "adbr=" & set "reboot1choise=������� ������������" & goto reboot1
if /i "%choice%"=="2" set "adbr=recovery" & set "reboot1choise=������� ������������ � ��������" & goto reboot1
if /i "%choice%"=="3" set "adbr=-p" & set "reboot1choise=������� ����������" & goto reboot1
if /i "%choice%"=="4" goto STARTS 
if /i "%choice%"=="9" IF NOT EXIST "adb devices.cmd" (call :adb_check_devices) ELSE (taskkill.exe /fi "WINDOWTITLE eq adb devices" /f >nul 2>&1 & del /q /s %sniffer% >nul 2>&1)
goto reboot
echo.
exit /b
:reboot1
IF EXIST "adb.exe" (cls) ELSE (echo adb.exe ���� ����� & pause & exit)
cls
adb devices -l | findstr /ic:"device" >nul 2>&1
if "%errorlevel%"=="1" (
echo.%reboot1choise%  
call :EchoColor "�� �������� �������� ������� �� usb" Green & echo. & echo. & echo. & echo ������� �� ��������� � ���������� 
echo. 
echo ���������� ������� ����� ������, ��������� ���� ������ ���
echo. 
ping -n 3 127.0.0.1>nul 
goto reboot1
)
del /q /s "device.txt" >nul 2>&1
for /f %%c in ('adb devices -l^|find/i /c "device"') do @if %%c==2 goto reboot1V1
for  /f "tokens=1* delims= " %%i IN ('adb devices -l ^| findstr /ic:"device"') DO set iddevices=%%i
adb -s %iddevices% shell reboot !adbr!
goto reboot
exit /b
:reboot1V1
set iddevices=.
for  /f "tokens=4* delims= " %%i IN ('adb.exe devices -l') DO echo %%i>>device.txt
echo �������� ������ �� ������:
for /f "tokens=1* delims=:" %%i in ('more device.txt') do ^
set/a c+=1 & set "v!c!=%%j" & set n=!n!!c!&echo !c!. %%j
del /q /s "device.txt" >nul 2>&1
>nul choice/n /c !n!
echo �� ������� !v%errorlevel%!.
set "namephone=!v%errorlevel%!"
if "%namephone%"=="" set "namephone=."
>nul timeout 2&cls&set c=&set n=
for  /f "tokens=1* delims= " %%i IN ('adb devices -l ^| findstr /ic:"%namephone%"') DO set iddevices=%%i
adb -s %iddevices% shell reboot !adbr!
goto reboot
exit /b

:adb_check_devices
set "sniffer="adb devices.cmd""
del /q %sniffer% >nul 2>&1 
cmd.exe /c (
echo ^<# :>%sniffer%
echo @echo off>>%sniffer%
echo @cd/d "%%~dp0">>%sniffer%
echo @chcp 1251 ^>nul >>%sniffer%
echo powershell -nop -ex Bypass -c "[ScriptBlock]::Create((gc '%%~0') -join [Char]10).Invoke()">>%sniffer%
echo ^title adb devices>>%sniffer%
echo :1 >>%sniffer%
echo ^mode con cols=48 lines=20>>%sniffer%
echo cls >>%sniffer%
echo echo ������������ ���������� � adb >>%sniffer%
echo echo. >>%sniffer%
echo adb devices ^| findstr /ic:"device" >>%sniffer%
echo tasklist.exe /fi "WINDOWTITLE eq Realme 8i - Utility" ^| findstr /ic:"cmd.exe" ^>nul 2>&1 >>%sniffer%
echo if /i "%%errorlevel%%"=="1" (del /q /s "adb devices.cmd" ^& exit)>>%sniffer%
echo ping -n 4 127.0.0.1^>nul  >>%sniffer%
echo goto 1 >>%sniffer%
echo #^> >>%sniffer%
echo $setTOP = @' >>%sniffer%
echo [DllImport("user32.dll")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags); >>%sniffer%
echo '@ >>%sniffer%
echo (Add-Type -MemberDefinition $setTOP -name WinApiCall -passthru)::SetWindowPos((ps cmd^|Sort StartTime^|Select -Last 1).MainWindowHandle,-1,1200,0,0,67,0x4000) >>%sniffer%
)
ping -n 2 127.0.0.1>nul
start "" %sniffer%
exit /b
:dopolnit
@cd/d "%~dp0files\"
@taskkill /im adb.exe /f >nul 2>&1
@IF EXIST "adb.exe" (cls) ELSE (cls & echo adb.exe ���� ����� & pause & goto STARTS)
cls
Echo.
CLS
ECHO                              ��������� �������� �������!!
ECHO. =========================================================================================
ECHO                          �� �������� ���������� �������� adb! 
ECHO                               �������� ������� �� USB
ECHO. =========================================================================================
ECHO.                1.���������� ����������(���) (adb)
ECHO.                                  
ECHO.                2.������� ����� ���������� � �� ������ / ������������ (�� ��������) (adb)
ECHO.                                  
ECHO.                3.������������� ��� ��������
ECHO.                                  
ECHO.                4.������������� ��������� (mtkclient)
ECHO.                       
ECHO.                5.��������/��������� ����������(root) (adb)
ECHO.                                                    
ECHO.                6.������ ���������� �� ������������� ��������(google photo) (adb)
ECHO.                                  
ECHO.                9.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto installapplication
if /i "%choice%"=="2" goto dopolnit
if /i "%choice%"=="3" goto Additionallyforfirmware
if /i "%choice%"=="4" if /I "%don'tusemtkclient%"=="1" (goto errorsetting) else (goto lockseccfg)
if /i "%choice%"=="5" goto start on/off update
if /i "%choice%"=="6" goto deletegooglephoto
if /i "%choice%"=="9" goto STARTS
goto dopolnit
exit /b
:deletegooglephoto
cls
adb devices -l | findstr /ic:"device" >nul 2>&1
if "%errorlevel%"=="1" (
echo.%reboot1choise%  
call :EchoColor "�� �������� �������� ������� �� usb" Green & echo. & echo. & echo. & echo ������� �� ��������� � ���������� 
echo. 
echo ���������� ������� ����� ������, ��������� ���� ������ ���
echo. 
ping -n 3 127.0.0.1>nul 
goto deletegooglephoto
)
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.         �� ����� ������ ������ ���������� �� ������������� �������� �� google photo?
ECHO.                 ��� ��������� ���� � ��� google photo ��� ���� � ��������    
ECHO.                                
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto deletegooglephoto1
if /i "%choice%"=="2" goto dopolnit
goto deletegooglephoto
exit /b
:deletegooglephoto1
adb devices -l | findstr /ic:"device" >nul 2>&1
if "%errorlevel%"=="1" (
echo.%reboot1choise%  
call :EchoColor "�� �������� �������� ������� �� usb" Green & echo. & echo. & echo. & echo ������� �� ��������� � ���������� 
echo. 
echo ���������� ������� ����� ������, ��������� ���� ������ ���
echo. 
ping -n 3 127.0.0.1>nul 
goto deletegooglephoto1
)
del /q /s "device.txt" >nul 2>&1
for /f %%c in ('adb devices -l^|find/i /c "device"') do @if %%c==2 goto deletegooglephoto1V1
for /f "tokens=1* delims= " %%i IN ('adb devices -l ^| findstr /ic:"device"') DO set iddevices=%%i
adb -s %iddevices% shell "cmd role add-role-holder android.app.role.SYSTEM_GALLERY com.google.android.apps.photos"
goto dopolnit
exit /b
:deletegooglephoto1V1
set iddevices=.
for  /f "tokens=4* delims= " %%i IN ('adb.exe devices -l') DO echo %%i>>device.txt
cls
echo �������� ������ �� ������:
for /f "tokens=1* delims=:" %%i in ('more device.txt') do ^
set/a c+=1 & set "v!c!=%%j" & set n=!n!!c!&echo !c!. %%j
del /q /s "device.txt" >nul 2>&1
>nul choice/n /c !n!
echo �� ������� !v%errorlevel%!.
set "namephone=!v%errorlevel%!"
if "%namephone%"=="" set "namephone=."
>nul timeout 2&cls&set c=&set n=
for  /f "tokens=1* delims= " %%i IN ('adb devices -l ^| findstr /ic:"%namephone%"') DO set iddevices=%%i
adb -s %iddevices% shell "cmd role add-role-holder android.app.role.SYSTEM_GALLERY com.google.android.apps.photos"
goto dopolnit
exit /b

:start on/off update
cls
adb devices -l | findstr /ic:"RMX3151" >nul 2>&1
if "%errorlevel%"=="1" (
call :EchoColor "�� �������� �������� ������� �� usb" Green & echo. & echo. & echo. & echo realme 8i �� ��������� � ����������  
echo. 
echo ���������� ������� ����� ������, ��������� ���� ������ ���
echo. 
ping -n 3 127.0.0.1>nul 
goto start
)
for  /f "tokens=1* delims= " %%i IN ('adb devices -l ^| findstr /ic:"RMX3151"') DO set iddevices=%%i

set uid=.
set root=.
for /f "delims=" %%a in ('adb -s %iddevices% shell "su 0 id -u"') do set uid=%%a
if "0"=="%uid%" (set root=SuperSU & goto on/off update)
for /f "delims=" %%a in ('adb -s %iddevices% shell "su 0 id -u" ^| findstr /ic:"Su"') do set uid=%%a & if "MagiskSU "=="!uid!" (set root=MagiskSU & goto on/off update)
if not "."=="%root%" (
cls 
echo Root �� ��������� 
pause 
exit
)
:on/off update
echo ���������...
adb -s %iddevices% shell "pm list packages -d | grep 'sau'" | findstr /x /c:"package:com.oplus.sau" >nul 2>&1
if %errorlevel% == 1 (set sau=������� & set number1=1) else (set sau=�������� & set number1=0)
adb -s %iddevices% shell "pm list packages -d | grep 'romupdate'" | findstr /x /c:"package:com.oplus.romupdate" >nul 2>&1
if %errorlevel% == 1 (set romupdate=������� & set number2=1) else (set romupdate=�������� & set number2=0)
adb -s %iddevices% shell "pm list packages -d | grep 'ota'" | findstr /x /c:"package:com.oplus.ota" >nul 2>&1
if %errorlevel% == 1 (set ota=������� & set number3=1) else (set ota=�������� & set number3=0)
set /a otvet=%number1%+%number2%+%number3%
if %otvet% == 3 (set allupdate=���������� �������� & set color=Red) else (
if %otvet% == 2 (set allupdate=��� ������ ���������� �������� & set color=Red)
if %otvet% == 1 (set allupdate=���� ������ ���������� �������� & set color=Red)
if %otvet% == 0 (set allupdate=���������� ��������� & set color=Green)
)
cls
echo.� ��� %root%
echo.
echo ����������: 
echo.1) ��� ���������/���������� ���������� ����� ��������� ������ root �� �������
echo.2) ���� � ��� ������ �� ���������� ����� ����������, �� ������ ����� ��� ����� ���������,
echo    ������� � ���������� � �������� �� ��� ���������� "��������" 
echo                   ����� ���������:En32
echo.
echo.
call :EchoColor "%allupdate%" %color% & echo.
echo.
echo 1) �������� ����������
echo 2) ��������� ����������
echo 3) ��������/��������� ��������� ������
echo 4) �������� ����������
echo 5) �����
choice /c 12345 /n /m "������� �����:"
if errorlevel 5 goto dopolnit
if errorlevel 4 goto on/off update
if errorlevel 3 goto choiceupdate
if errorlevel 2 goto updateOFF
if errorlevel 1 goto updateON
:updateOFF
echo.
adb -s %iddevices% shell "su -c pm disable com.oplus.sau" >nul 2>&1 && echo ok
adb -s %iddevices% shell "su -c pm disable com.oplus.romupdate" >nul 2>&1 && echo ok
adb -s %iddevices% shell "su -c pm disable com.oplus.ota" >nul 2>&1 && echo ok
echo.
echo ���������� ���������
ping -n 2 127.0.0.1>nul 
goto on/off update
exit /b
:updateON
echo.
adb -s %iddevices% shell "su -c pm enable com.oplus.sau" >nul 2>&1 && echo ok
adb -s %iddevices% shell "su -c pm enable com.oplus.romupdate" >nul 2>&1 && echo ok
adb -s %iddevices% shell "su -c pm enable com.oplus.ota" >nul 2>&1 && echo ok
echo.
echo ���������� ��������
ping -n 2 127.0.0.1>nul 
goto on/off update
exit /b
:choiceupdate
adb -s %iddevices% shell "pm list packages -d | grep 'sau'" | findstr /x /c:"package:com.oplus.sau" >nul 2>&1
if %errorlevel% == 1 (set sau=�������) else (set sau=��������)
adb -s %iddevices% shell "pm list packages -d | grep 'romupdate'" | findstr /x /c:"package:com.oplus.romupdate" >nul 2>&1
if %errorlevel% == 1 (set romupdate=�������) else (set romupdate=��������)
adb -s %iddevices% shell "pm list packages -d | grep 'ota'" | findstr /x /c:"package:com.oplus.ota" >nul 2>&1
if %errorlevel% == 1 (set ota=�������) else (set ota=��������)
cls
echo ���� ��� ��������� �������� �� ���������� ��������.
echo ���� ��� ��������� ��������� �� ���������� ���������.
echo.
echo ��������/��������� ���������
echo 1)����� com.oplus.sau - %sau%
echo 2)����� com.oplus.romupdate - %romupdate%
echo 3)����� com.oplus.ota - %ota%
echo 4)�����
choice /c 1234 /n /m "������� �����:"
if "%errorlevel%" == "4" goto on/off update
if "%errorlevel%" == "1" (if "�������" == "%sau%" (
adb -s %iddevices% shell "su -c pm disable com.oplus.sau" >nul 2>&1 & goto choiceupdate
) else (
adb -s %iddevices% shell "su -c pm enable com.oplus.sau" >nul 2>&1 & goto choiceupdate
))

if "%errorlevel%" == "2" (if "�������" == "%romupdate%" (
adb -s %iddevices% shell "su -c pm disable com.oplus.romupdate" >nul 2>&1 & goto choiceupdate
) else (
adb -s %iddevices% shell "su -c pm enable com.oplus.romupdate" >nul 2>&1 & goto choiceupdate
))

if "%errorlevel%" == "3" (if "�������" == "%ota%" (
adb -s %iddevices% shell "su -c pm disable com.oplus.ota" >nul 2>&1 & goto choiceupdate
) else (
adb -s %iddevices% shell "su -c pm enable com.oplus.ota" >nul 2>&1 & goto choiceupdate
))
exit /b
:lockseccfg
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                   �� ����� ������ ������������� ���������?
ECHO.            
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto lock1
if /i "%choice%"=="2" goto dopolnit
goto lockseccfg
exit /b
:lock1
cls
@cd/d "%Foldermtk%"
Echo ������� �� ����������� �������� ��� ������ ���������
Echo ���������� �� 5 � ���������� ��� � ����������
Echo ����� ����������� ���������� ����� �� 5 � ��������� ������
Echo ������ ����� ��� � ���� ���� ���������� ���������� ������ ������
python mtk da seccfg lock >lock1.txt
more "%Foldermtk%\lock1.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=������������� ���������� & goto errorfoldermtk
del /q "lock1.txt"
GOTO STARTS 
exit /b
:installapplication
@cd/d "%~dp0"
@md "%~dp0application" >nul 2>&1
:installapplication1.5
@taskkill /im adb.exe /f >nul 2>&1
@cd/d "%~dp0application"
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                      � ����� ��������� ���� ������� ����� application
ECHO.       � �� ������ �������� apk ����� ������� ������ ���������� � ������� 
ECHO.          �� ����������� ������ ���������� � �����, ����� ������� 3 ��� 4 �����
Echo.                       �������� ���� �� ��������
ECHO. ======================================================================================
ECHO.                    1.���������� ���� ����������
ECHO.                                  
ECHO.                    2.���������� ��� ���������� �� ����� 
ECHO.                                  
ECHO.                    3.������� ���������� ��� ���������
ECHO.                                  
ECHO.                    4.������� ����� � ������������ ��� ���������
ECHO.                       (����� ������������ ��� ���������� �� �����)      
ECHO.                                        
ECHO.                    5.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto installapplication1
if /i "%choice%"=="2" goto installapplication2
if /i "%choice%"=="3" goto installapplication3
if /i "%choice%"=="4" goto installapplication4
if /i "%choice%"=="5" goto dopolnit
goto installapplication1.5
echo.
exit /b
:installapplication1
cls
@cd/d "%~dp0application"
    Set "FileIn=*.apk"
    Set "Str=123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 
    Set /A Num=-1
    Echo ��������� ������ ����: &Echo.
    For %%i In ("%FileIn%") Do (
        Call Set /A Num+=1
        Call Set "@@%%Num%%=%%i"
        Call :Checklist "%%i" %%Num%%
    )
    If %Num% EQU -1 (Echo ����� %FileIn% �� �������. &Pause &goto installapplication1.5)
    Echo.
    Set /A Num+=1
    Call Set "Sele=%%Str:~0,%Num%%%"
    Choice /N /C 0%Sele% /M "0-(����)- ��������� ����� >"
    Set /A Out=%ErrorLevel%
    If %Out% EQU 1 goto installapplication1.5
    Set /A Out-=2
    Call Set "Sele=%%@@%Out%%%" 
Echo %Sele%
cls
Echo �������� ����� ��������, � ���-�� ������� �� usb
%adb% install "%Sele%">Logfile.txt
for  /f "tokens=*" %%j IN ('more Logfile.txt') DO set Logfile=%%j 
if /I "%Logfile%" == "Success " (Echo. & Echo ���������� ������������ & ping -n 3 127.0.0.1>nul )  else (Echo. & Echo ���������� �� ������������ & ping -n 3 127.0.0.1>nul )
goto installapplication1.5
cls
Exit /B 0
:Checklist
    Call Echo %%Str:~%2,1%%. %1
Exit /B
:installapplication2
@cd/d "%~dp0application"
	:installapplication4.1
cls
    Set "FileIn=*.apk"
    Set "Pgm=%adb% install"
    For %%i In ("%FileIn%") Do %Pgm% "%%i">Logfile.txt
goto installapplication1.5
Exit /B 0
:installapplication3
cls
for /f "tokens=* delims=" %%i in ('mshta.exe %dialog%') do set "fileapk=%%i"
%adb% install "%fileapk%" >nul
goto installapplication1.5
exit /b 
:installapplication4
cls
for /f "usebackq delims=" %%i in (
    `@"%systemroot%\system32\mshta.exe" "javascript:var objShellApp = new ActiveXObject('Shell.Application');var Folder = objShellApp.BrowseForFolder(0, '�������� �����',1, '::{20D04FE0-3AEA-1069-A2D8-08002B30309D}');try {new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(Folder.Self.Path)};catch (e){};close();" ^
    1^|more`
) do set sFolderName=%%i
if defined sFolderName (
    echo %sFolderName%

	cls
@cd/d "%sFolderName%"
goto installapplication4.1
) else (
    goto installapplication4.1
)
goto installapplication4.1
exit /b
:backupappanddata
@cd/d "%~dp0files\"
@taskkill /im adb.exe /f >nul 2>&1
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
Echo.                         �������� ���� �� ��������
ECHO. ======================================================================================
ECHO.                             1.������� ����� ���������� � �� ������ 
ECHO.                                  
ECHO.                             2.������������ ����� ���������� � �� ������ 
ECHO.                                  
ECHO.                             9.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto createbackup
if /i "%choice%"=="2" goto recoverbackup
if /i "%choice%"=="9" goto dopolnit
goto backupappanddata
echo.
exit /b
:createbackup
Echo �������� ����� ��������
adb backup "-all -apk -nosystem" -f backup3.ab>Logfile.txt
for  /f "tokens=*" %%j IN ('more Logfile.txt') DO set Logfile=%%j 
if /I "%Logfile%" == "* daemon started successfully * " (Echo. & Echo ���������� ������������ & ping -n 3 127.0.0.1>nul )  else (Echo. & Echo ���������� �� ������������ & ping -n 3 127.0.0.1>nul )
goto backupappanddata
exit /b
:recovery
set wayfilerecovery=
set filecoremagisk=
set filerecovery=
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                            ������ ������� ���� ��������?
ECHO.            ��� �� ������ ������ ��� � ������� ��� ��������� ��������
ECHO.  
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO.                                  
ECHO.                             3.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto recovery1
if /i "%choice%"=="2" goto norecovery
if /i "%choice%"=="3" goto viboor recovery ili coremagiskB2
goto recovery
echo.
exit /b
:recovery1
for /f "tokens=* delims=" %%i in ('mshta.exe %dialog%') do set "wayfilerecovery=%%i" & set filerecovery=%%~xni
Echo %wayfilerecovery%
Echo %filerecovery%
cls
Echo.
CLS
:recovery1.5
cls
ECHO.
ECHO. ======================================================================================
ECHO.                       �� ����� ������� � ����� �������� ?
ECHO.                      �������� �������� ����� ��������� ?
ECHO.  %wayfilerecovery%
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto recovery2
if /i "%choice%"=="2" goto recovery
goto recovery1.5
exit /b
:recovery2
cls
copy "%wayfilerecovery%" "%Foldermtk%" > NUL
@cd/d "%Foldermtk%"
Echo ������� �� ����������� �������� ��� ������ ���������
Echo ���������� �� 5 � ���������� ��� � ����������
Echo ����� ����������� ���������� ����� �� 5 � ��������� ������
Echo ������ ����� ��� � ���� ���� �������� �������� ������ ������
python mtk w recovery "%filerecovery%" >errorflashrecovery.txt
more "%Foldermtk%\errorflashrecovery.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=�������� �������� & goto errorfoldermtk
del /q "errorflashrecovery.txt"
GOTO STARTS 
exit /b 
:norecovery
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                           �������� recovery 
ECHO.            
ECHO. ======================================================================================
ECHO.                             1.TWRP                    
ECHO.                                  
ECHO.                             2.OrangeFox                     
ECHO.                                  
ECHO.                             9.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto fleshTWRP
if /i "%choice%"=="2" goto fleshOrangeFox
if /i "%choice%"=="9" goto recovery
goto norecovery
exit /b
:fleshTWRP
CLS
set wayfilerecovery=%~dp0files\twrp.img
set filerecovery=twrp.img
ECHO.
ECHO. ======================================================================================
ECHO.                       �� ����� ������� � ����� �������� ?
ECHO.                        �� ������ ������� TWRP?
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto recovery2
if /i "%choice%"=="2" goto recovery
echo.
exit /b
:fleshOrangeFox
CLS
set wayfilerecovery=%~dp0files\OrangeFox.img
set filerecovery=OrangeFox.img
ECHO.
ECHO. ======================================================================================
ECHO.                       �� ����� ������� � ����� �������� ?
ECHO.                        �� ������ ������� OrangeFox?
ECHO. ======================================================================================
ECHO.                             1.��
ECHO.                                  
ECHO.                             2.���
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto recovery2
if /i "%choice%"=="2" goto recovery
echo.
exit /b

REM ���� �� �����������
:miltizadacha
cls
Echo ��� ������� �� �������� :(
pause
goto STARTS
exit /b
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                    
ECHO.                      �� ������ ��� � ���� ��� ��� ����
ECHO.            
ECHO. ======================================================================================
ECHO.                             1.� TWRP    
ECHO.                                  
ECHO.                             2.��� TWRP   (�������������)
ECHO.                                  
ECHO.                             9.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto yestwrt
if /i "%choice%"=="2" goto notwrp
if /i "%choice%"=="9" goto STARTS
echo.
exit /b
:notwrp
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                    
ECHO.                         ����� � ��� ������ ��������?
ECHO.            
ECHO. ======================================================================================
ECHO.                             1.A30    
ECHO.                                  
ECHO.                             2.A32
ECHO.                                  
ECHO.                             3.A20
ECHO.                                 
ECHO.                             4.A21
ECHO.                               
ECHO.                             9.�����
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=�������� ��������, � ����� ������� Enter:
if /i "%choice%"=="1" goto miltizadachaA30
if /i "%choice%"=="2" goto miltizadachaA32
if /i "%choice%"=="3" goto miltizadachaA20
if /i "%choice%"=="4" goto miltizadachaA21
if /i "%choice%"=="9" goto STARTS
echo.
exit /b
REM .

:errorfoldermtk
cls
@cd/d "%Foldermtk%"
Echo ������ %errorerrorfoldermtk%
Echo �������� � ��� ������ ������, ������� �� ������� ���������� 
Echo ��� �� ���������� �� �� ��� �����!
 pause & GOTO STARTS 
exit /b
REM >errordamp.txt
REM for  /f "delims=" %%i IN ('more "%Foldermtk%errordamp.txt"') DO set errordamp=%%i
 REM echo "%errordamp%" | findstr /ic:"Failed" > NUL
REM if %errorlevel% EQU 0 goto errorfoldermtk
:Additionallyforfirmware
explorer "%~dp0files\Additionally for firmware"
goto dopolnit
REM ���� �� ����� ���-������ ����� ��������
REM CLS
REM ECHO.
REM ECHO. ======================================================================================
REM ECHO.                    
REM ECHO.                        �������������� ����� ��� ��������
REM ECHO.            
REM ECHO. ======================================================================================
REM ECHO.                             1.���������� ���� ������������� ����� � �������    
REM ECHO.                                  
REM ECHO.                             2.������ ��� �� ������/������ ��������� ��������
REM ECHO.                               
REM ECHO.                             9.�����
REM ECHO. ======================================================================================
REM :CHO
REM set choice=
REM set /p choice=�������� ��������, � ����� ������� Enter:
REM if /i "%choice%"=="1" goto miltizadachaA30
REM if /i "%choice%"=="2" goto miltizadachaA32
REM if /i "%choice%"=="3" goto miltizadachaA20
REM if /i "%choice%"=="4" goto miltizadachaA21
REM if /i "%choice%"=="9" goto STARTS
REM echo.
REM exit /b
:errorstarts
cls
Echo ��� ������� ���� ��� �� �������� :(
pause
goto STARTS
exit /b
:errorviewcoreerror
cls
Echo �� ����������� ��� ��� ���� �� �� ������ ������������, �� ���� ��������, 
Echo �� �������� ������ ������ ���������
pause
goto nocore
exit /b
:errorsetting
cls
Echo ��� ������� ���������
Echo ��-�� ���������
Echo.
Echo ������� ����� ������ ����� ��������� �����
pause>nul
goto STARTS
exit /b
:EchoColor [text] [color]
powershell "'%~1'.GetEnumerator()|%%{Write-Host $_ -NoNewline -ForegroundColor %~2}"
exit /B
#>
$setTOP = @'
[DllImport("user32.dll")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);
'@
(Add-Type -MemberDefinition $setTOP -name WinApiCall -passthru)::SetWindowPos((ps cmd|Sort StartTime|Select -Last 1).MainWindowHandle,-1,0,0,0,0,0x4000)