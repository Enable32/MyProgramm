<# :
@echo off
@SetLocal EnableExtensions EnableDelayedExpansion
@REM Начальная конфигурация
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
REM Проверяем интернет-соединение
ping www.google.nl -n 1 -w 100 |>nul find /i "TTL=" && goto CheckUpdate
call :EchoColor "                  Невозможно проверить обновления программы, отсутствует интернет" Red & echo.     
echo.
call :EchoColor "   Использование старых версий не рекомендуется, поэтому при первой возможности обновите программу" Red & echo.   
echo.
pause
goto continuation
REM Проверка обновлений программы
:CheckUpdate
cls
@mode con cols=72 lines=10
curl -g -k -L -# -o "%temp%\Version.bat" "https://pastebin.com/raw/KFtskTJR" >nul 2>&1
call "%temp%\Version.bat"
del /q /s "%temp%\Version.bat" >nul 2>&1 
if "%Thisversion%" lss "%Version%" (goto Update) else (goto continuation)
REM Обновление программы
:Update
@color 0
@mode con cols=97 lines=17
cls
call :EchoColor "                            Вы используете старую версию - %Thisversion%" red & echo.
call :EchoColor "                                 Актуальная версия - %Version%" Green & echo.
echo. 
call :EchoColor "                                       История изменений:" Green & echo. 
call :EchoColor "  5.9.8 Добавлено автообновление и все прилигающие к нему пункты,максимально сжал код 1773строк" Red & echo.  
call :EchoColor "            5.8.2-5.9.7 Добавленна автоустановка драйверов 1349строк" Red & echo.   
call :EchoColor "               4.5.5-5.8.1 Улучшена проверка на mtkclient" Red & echo.   
call :EchoColor "                  3.5.3-4.5.4 Добавлен пункт дополнительно" Red & echo.   
call :EchoColor "                        3.5.2 Добавил просчёт ошибок" Red & echo. 
call :EchoColor "        2.0.1-3.5.1 добавил установку своих, и сторонних ядер,запуск поверх окон 1286строк" Red & echo. 
call :EchoColor "                1.0.0-2.0.0 добавил проверку mtkclient(-а) 987строк" Red & echo.   
call :EchoColor "                     0.0.1 Создание программы 536строк" Red & echo.   
echo. 
call :EchoColor "               Нажмите любую клавишу, чтобы обновить программу" Blue & echo.                   
del /q /s "%temp%\Version.bat" >nul 2>&1 
pause>nul
goto update
curl -g -k -L -# -o %0 "https://github.com/Enable32/MyProgramm/raw/main/8i-Инструменты.cmd" >nul 2>&1 & call %0
exit

rem Эта настройка нужна только для тех кто не хочет использовать mtkclient
FOR /F "usebackq tokens=*" %%a IN (`more "setting.inf" ^| findstr /ic:"set don'tusemtkclient=1"`) DO (
set don'tusemtkclient=1
goto STARTS
)

:continuation
@%modcon%
@%color%
REM Добавил ещё проверку на файлы ядер ну... мне лень объяснять
IF EXIST ".\files\boot_magisk_a20.img" (set fleshА20=fleshА20 & set c=c) ELSE set viewcoreerror=viewcoreerror & set errorviewcore1=Не найдено ядро a20, & set fleshА20=errorviewcoreerror
IF EXIST ".\files\boot_magisk_a21.img" (set fleshА21=fleshА21 & set a=a) ELSE set viewcoreerror=viewcoreerror & set errorviewcore2=Не найдено ядро a21, & set fleshА21=errorviewcoreerror
IF EXIST ".\files\boot_magisk_a32.img" (set fleshА32=fleshА32 & set l=l) ELSE set viewcoreerror=viewcoreerror & set errorviewcore3=Не найдено ядро a32, & set fleshА32=errorviewcoreerror
IF EXIST ".\files\boot_magisk_a46.img" (set fleshА46=fleshА46 & set l2=l) ELSE set viewcoreerror=viewcoreerror & set errorviewcore4=Не найдено ядро a46. & set fleshА46=errorviewcoreerror
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
Echo.  Вы можете скачать полную версию и после нажать 1, или можете не скачивать и нажать 2              
ECHO. ======================================================================================
ECHO.                 1.Я не буду использовать это ядро(ядра) для моего телефона
ECHO.                          (Пункт с этим ядром/ядрами будет нерабочим)
ECHO.                 2.Больше не спрашивать про это ядро
ECHO.     (будет создан в папке с программой файл setting.inf в нём будет хранится кофиг)
ECHO.                 3.Выход
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
ECHO.                         У вас установлен mtkclient?
ECHO.                    
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto papka
if /i "%choice%"=="2" goto launch2.5.5
cls
goto launch2.5
:launch2.5.5
cls
ECHO.
ECHO. ======================================================================================
ECHO.                         
ECHO.                       Выбирите одно из действий
ECHO.                    
ECHO. ======================================================================================
ECHO.                             1.Скачать сначала драйвера
ECHO.                                  
ECHO.                             2.Скачать и установить mtkclient
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
ECHO.          У вас не установлен %python%%Git%%UsbDK%
Echo.                     
ECHO. ======================================================================================
ECHO.                    1.Я скачал и установил сам (скачала и установила сама) 
ECHO.                                  
ECHO.                    2.Повторить попытку скачивания файла (файлов)
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
powershell Start-BitsTransfer -source "1https://www.python.org/ftp/python/3.9.8/python-3.9.8-amd64.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorpython=ошибка скачивания python & set errorAll=errorAll & set errornamepython=python,)
exit /b
:32Python
md "downloadFile" >nul 2>&1
powershell Start-BitsTransfer -source "1https://www.python.org/ftp/python/3.9.8/python-3.9.8.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok || (Echo.Error & set errorpython=ошибка скачивания python & set errorAll=errorAll & set errornamepython=python,)
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
powershell Start-BitsTransfer -source "1https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-64-bit.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorGit=ошибка скачивания Git & set errorAll=errorAll & set errornameGit=Git,)
exit /b
:32Git
md "downloadFile" >nul 2>&1
powershell Start-BitsTransfer -source "1https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-32-bit.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorGit=ошибка скачивания Git & set errorAll=errorAll & set errornameGit=Git,)
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
powershell Start-BitsTransfer -source "1https://github.com/daynix/UsbDk/releases/download/v1.00-22/UsbDk_1.0.22_x64.msi" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorUsbDk=ошибка скачивания UsbDk & set errorAll=errorAll & set errornameusbdk=UsbDk.)
exit /b
:32UsbDK
md "downloadFile" >nul 2>&1	
powershell Start-BitsTransfer -source "1https://github.com/daynix/UsbDk/releases/download/v1.00-22/UsbDk_1.0.22_x86.msi" -destination "downloadFile"  >nul 2>&1 && Echo Ok  || (Echo.Error & set errorUsbDk=ошибка скачивания UsbDk & set errorAll=errorAll & set errornameusbdk=UsbDk.)
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
set "choicefoldersinstall=Выберите папку с установленым mtkclient"
:papka1
%modcon%
del /q "%~dp0files\temp\mtkfolder.txt"
cls
ECHO %choicefoldersinstall%
Echo Пример: C:\Users\admin\git\mtkclient

for /f "usebackq delims=" %%i in (
    `@"%systemroot%\system32\mshta.exe" "javascript:var objShellApp = new ActiveXObject('Shell.Application');var Folder = objShellApp.BrowseForFolder(0, 'Выберите папку',1, '::{20D04FE0-3AEA-1069-A2D8-08002B30309D}');try {new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(Folder.Self.Path)};catch (e){};close();" ^
    1^|more`
) do set sFolderName=%%i

if defined sFolderName (
    echo Выбрана папка: %sFolderName%
) else (
    exit
)
for %%i in ("%sFolderName%") do set "name=%%~nxi"
Echo %sFolderName%>"%~dp0files\temp\mtkfolder.txt"
goto srawnenie
exit/b 
:srawnenie
if /I "%name%."=="mtkclient." (goto mtkpereizbranie)  else (set "choicefoldersinstall=Выберите правильно папку: mtkclient" & goto papka1)  >nul 2>&1
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
@if /I "%don'tusemtkclient%"=="1" (set "Foldermtk=Отсутствует из-за настроек") else (
@if /I "%FileName%."=="mtkclient." (Echo.)  else (goto papka)  
)
@if /I "%phoneversion%."=="." (echo.)  else (set phoneversiondisplay=Ваша версия телефона: %phoneversion%, если нет введите 202)  
@del /s /q ".\files\temp\error.txt"
CLS
ECHO                            Несколько полезных советов!!
ECHO. ===========================================================================================
Echo                          (adb)-использование программы adb
Echo                     (mtkclient)-использование программы mtkclient
ECHO                          Не забудьте установить драйвера! 
REM ECHO. Чтобы получить полную справку как пользоваться этой программой впишите 100 и нажмите Enter
ECHO.                 Чтобы узнать какая у вас версия прошивки введите 200 (adb)
ECHO.                        Выбираем какой нужен скрипт и запускаем его
Echo                            Отработка скрипта не видна    
Echo                         Нужно ждать завершения выполнения
Echo                      Скрипт вас вернёт в меню если всё будет ок
Echo                         затем отключаем телефон от компа
Echo                             Автор программы:En32
Echo                       Папка с mtk: %Foldermtk%
Echo.                  %phoneversiondisplay%
ECHO. ===========================================================================================
ECHO.              1.Сделать Бэкап (boot,vbmeta и т.д) (mtkclient)
ECHO.
ECHO.              2.Затиреть метадату и юзердату (mtkclient)
ECHO.           
ECHO.              3.Разблокировать загрузчик (mtkclient)
ECHO.                    
ECHO.              4.Прошивка Рекавери или Ядра (mtkclient)
ECHO.                    
ECHO.              6.Перезагрузка (adb)
ECHO.                    
ECHO.              7.Перейти на сайт 4PDA
ECHO.
ECHO.              8.Дополнительно (adb)+(mtkclient)
ECHO.
ECHO.              999.Переизбрать папку mtk
ECHO.
ECHO.              0.Выход из программы
ECHO. ===========================================================================================
:CHO
set choice=
set /p choice= Выберите действие, а затем нажмите Enter:
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
Echo Зайдите в звонилку набирите *#1234#, в конце вы увидите номер прошивки
Echo Например у меня RMX3151_11_A.32 и A.32 
Echo это и есть номер прошивки, он нужен для прошивки ядер от меня
Echo.
Echo.%vershionphone%%vershionphone2%
Echo.
Echo.1)Автоматически показать номер прошивки
Echo.2)Открыть видео-гайд
Echo.3)Назад
Echo.
set choice=
set /p choice=Ваш выбор:
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
call :EchoColor "Не забудьте включить отладку по usb" Green & echo. & echo. & echo. & echo realme 8i не подключён к компьютеру  
echo. 
echo Подключите телефон через кабель, программа сама увидит это
echo. 
ping -n 4 127.0.0.1>nul 
goto versiaproshiwki1
)
set "vershionphone=Ваша версия телефона:"
for %%a in (a.46 a.21 a.20 a.32) do (
adb shell getprop ro.build.display.id | findstr /ic:"%%a" >nul 2>&1
if /i "!errorlevel!"=="0" set vershionphone2=%%a & set "vershionphone%%a=(рекомендуется)" && echo %%a>"%~dp0files\temp\phoneversion.txt" & set phoneversiondisplay=Ваша версия телефона: %phoneversion%, если нет введите 202
)
set "nocoretext=Если напротив прошивки написано рекомендуется, то это означает что вы уже определяли версию"
GOTO versiaproshiwki 
exit /b
:damp
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                            1)Дамп boot.img и vbmeta.img 
ECHO.                   2)Бэкап ОСОБО ВАЖНЫХ РАЗДЕЛОВ(nvram,nvdata,nvcf)    
ECHO.                         
ECHO. ======================================================================================
ECHO.                             1.Дамп boot.img и vbmeta.img
ECHO.                                  
ECHO.                             2.Бэкап ОСОБО ВАЖНЫХ РАЗДЕЛОВ
ECHO.                                  
ECHO.                             3.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto damp1
if /i "%choice%"=="2" goto damp2
if /i "%choice%"=="3" goto STARTS
goto damp
exit /b
:damp1
CLS
@cd/d "%Foldermtk%"
Echo Зажмите на выключенном телефоне обе кнопки громкости
Echo досчитайте до 5 и подключите его к компьютеру
Echo после подключения досчитайте снова до 5 и отпустите кнопки
Echo Скрипт вернёт вас в меню если дамп пройдёт удачно
del /q /s "boot.img" >nul 2>&1 
python mtk r boot,vbmeta boot.img,vbmeta.img >nul 2>&1 
cls
if not EXIST "boot.img" (goto errorfoldermtk) >nul 2>&1 
ECHO.	Дамп ядра и vbmeta(ы) будет скопирован из папки mtkclient в папку с программой
md backup >nul 2>&1 
ping -n 4 127.0.0.1>nul 
copy "boot.img" "%~dp0backup"
copy "vbmeta.img" "%~dp0backup"
GOTO STARTS 
exit /b 
:damp2
CLS
@cd/d "%Foldermtk%"
Echo Зажмите на выключенном телефоне обе кнопки громкости
Echo досчитайте до 5 и подключите его к компьютеру
Echo после подключения досчитайте снова до 5 и отпустите кнопки
Echo Скрипт вернёт вас в меню если дамп пройдёт удачно
del /q /s "nvcfg.img" >nul 2>&1 
del /q /s "nvdata.img" >nul 2>&1 
del /q /s "nvram.img" >nul 2>&1 
python mtk r nvram,nvdata,nvcfg nvram.img,nvdata.img,nvcfg.img >"errordamp.txt"
if not EXIST "nvcfg.img" (goto errorfoldermtk) >nul 2>&1
if not EXIST "nvdata.img" (goto errorfoldermtk) >nul 2>&1
if not EXIST "nvram.img" (goto errorfoldermtk) >nul 2>&1
cls
ECHO.	Бэкап будет скопирован из папки mtkclient в папку с программой
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
ECHO.                    Вы точно хотите затиреть метадату и юзердату?
ECHO.                         Это сотрёт все данные с телефона!
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto zateret
if /i "%choice%"=="2" goto STARTS
goto deletuserdatametadata
exit /b
:zateret
CLS
@cd/d "%Foldermtk%"
Echo Зажмите на выключенном телефоне обе кнопки громкости
Echo досчитайте до 5 и подключите его к компьютеру
Echo после подключения досчитайте снова до 5 и отпустите кнопки
Echo Скрипт вернёт вас в меню если затерание метадаты и юзердаты пройдёт удачно
python mtk e metadata,userdata >"errordeletusermetadata.txt"
more "%Foldermtk%\errordeletusermetadata.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=затирания метадаты и юзердаты & goto errorfoldermtk
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
ECHO.                   Вам нужно ОБЯЗАТЕЛЬНО сделать дамп boot и vbmeta
ECHO.  
ECHO. ======================================================================================
ECHO.                             1.OK
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
ECHO.                            Что хотите прошить?
ECHO.  
ECHO. ======================================================================================
ECHO.                             1.Рекавери
ECHO.                                  
ECHO.                             2.Ядро
ECHO.                                  
ECHO.                             3.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
ECHO.                            Хотите выбрать файл ядра?
ECHO.       Или вы можете нажать нет и выбрать ядро уже пропатченное magisk-ом
ECHO.  
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO.                                  
ECHO.                             3.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
ECHO.                       Вы точно уверены в патче ядра ?
ECHO.           Название ядра точно совпадает с тем что хотите прошить?
ECHO.  %wayfilecoremagisk%
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto core2
if /i "%choice%"=="2" goto coremagiskB
goto core1.5
exit /b
:core2 
cls
copy "%wayfilecoremagisk%" "%Foldermtk%"
@cd/d "%Foldermtk%"
Echo Зажмите на выключенном телефоне обе кнопки громкости
Echo досчитайте до 5 и подключите его к компьютеру
Echo после подключения досчитайте снова до 5 и отпустите кнопки
Echo Скрипт вернёт вас в меню если прошивка ядра пройдёт удачно
python mtk w boot,vbmeta "%filecoremagisk%",vbmeta.img.empty >errorcore2.txt
more "%Foldermtk%\errorcore2.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=прошивки ядра & goto errorfoldermtk
GOTO STARTS 
exit /b 
:nocore
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                      Выберите ядро для правильной прошивки
ECHO.          Чтобы узнать как узнать номер прошивки введите 200 и нажмите Enter
ECHO. %nocoretext%
ECHO. 
ECHO. ======================================================================================
ECHO.                             1.Прошивка А32 %vershionphoneA.32%                     
ECHO.                                  
ECHO.                             2.Прошивка А20 %vershionphoneA.20%  
ECHO.                                  
ECHO.                             3.Прошивка А21 %vershionphoneA.21%  
ECHO.                                  
ECHO.                             4.Прошивка А46 %vershionphoneA.46%  
ECHO.                                  
ECHO.                             9.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto %fleshА32%
if /i "%choice%"=="2" goto %fleshА20%
if /i "%choice%"=="3" goto %fleshА21%
if /i "%choice%"=="4" goto %fleshА46%
if /i "%choice%"=="200" set whomenu=nocore & goto versiaproshiwki
if /i "%choice%"=="9" goto coremagiskB
goto nocore
echo.
exit /b
:fleshА32
set wayfilecoremagisk=%~dp0files\boot_magisk_a32.img
set filecoremagisk=boot_magisk_a32.img
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                       Вы точно уверены в патче ядра ?
ECHO.                       Вы хотите прошить ядро для А32?
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto core2
if /i "%choice%"=="2" goto nocore
echo.
exit /b
:fleshА20
set wayfilecoremagisk=%~dp0files\boot_magisk_a20.img
set filecoremagisk=boot_magisk_a20.img
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                       Вы точно уверены в патче ядра ?
ECHO.                       Вы хотите прошить ядро для А20?
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto core2
if /i "%choice%"=="2" goto nocore
echo.
exit /b
:fleshА21
set wayfilecoremagisk=%~dp0files\boot_magisk_a21.img
set filecoremagisk=boot_magisk_a21.img
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                       Вы точно уверены в патче ядра ?
ECHO.                       Вы хотите прошить ядро для А21?
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto core2
if /i "%choice%"=="2" goto nocore
echo.
exit /b
:fleshА46
set wayfilecoremagisk=%~dp0files\boot_magisk_a46.img
set filecoremagisk=boot_magisk_a46.img
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                       Вы точно уверены в патче ядра ?
ECHO.                       Вы хотите прошить ядро для А46?
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
ECHO.              Перед разблокировкой загрузчика будут стёрты все данные с телефона 
ECHO.                  Сохраните их и перенесите на sd-карту чтобы не потерять
ECHO.                     Вы точно хотите разблокировать загрузчик? 
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto unlock1
if /i "%choice%"=="2" goto STARTS
goto unlockseccfg
echo.
exit /b
:unlock1
cls
@cd/d "%Foldermtk%"
Echo Зажмите на выключенном телефоне обе кнопки громкости
Echo досчитайте до 5 и подключите его к компьютеру
Echo после подключения досчитайте снова до 5 и отпустите кнопки
Echo Скрипт вернёт вас в меню если разблокировка загрузчика пройдёт удачно
python mtk e metadata,userdata >"errordeletusermetadata.txt"
more "%Foldermtk%\errordeletusermetadata.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=затирания метадаты и юзердаты & goto errorfoldermtk
del /q "errordeletusermetadata.txt"
python mtk da seccfg unlock >unlock1.txt
more "%Foldermtk%\unlock1.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=разблокировки загрузчика & goto errorfoldermtk
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
set NameInf="%~dp0files\Драйвера MTKClient\cdc-acm.inf"
for  /f "delims= " %%i IN ('dir /b ^| findstr /ic:"python"') DO set python=%%i
for  /f "delims= " %%i IN ('dir /b ^| findstr /ic:"Git"') DO set Git=%%i
for  /f "delims= " %%i IN ('dir /b ^| findstr /ic:"UsbDk"') DO set UsbDk=%%i
set nameintsalldrive=installdriver.cmd
echo @echo off>%nameintsalldrive%
echo TITLE driverinstall>>%nameintsalldrive%
echo @cd/d "%%~dp0">>%nameintsalldrive%
echo @chcp 1251 ^>nul >>%nameintsalldrive%
echo SetLocal EnableExtensions EnableDelayedExpansion >>%nameintsalldrive%
echo set NameInf="%~dp0files\Драйвера MTKClient\cdc-acm.inf" >>%nameintsalldrive%
echo echo Идёт установка драйверов >>%nameintsalldrive%
echo set python=%%1 >>%nameintsalldrive%
echo set git=%%2 >>%nameintsalldrive%
echo set UsbDk=%%3 >>%nameintsalldrive%
echo "%%python%%" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 >>%nameintsalldrive%
echo echo.>>%nameintsalldrive%
echo echo Идёт установка утилит >>%nameintsalldrive%
echo "%%Git%%" /VERYSILENT >>%nameintsalldrive%
echo rundll32 advpack,LaunchINFSection %%NameInf%%,DefaultInstall,0 ^&^& start "" "%~dp0files\Драйвера MTKClient\install.bat" >>%nameintsalldrive%
echo start "" "%%UsbDk%%">>%nameintsalldrive%
echo del "%%~0" ^& exit >>%nameintsalldrive%
powershell.exe -noprofile "Start-Process '%nameintsalldrive%' '%python%','%Git%','%UsbDk%' -WindowStyle Maximized -Verb RunAs" >nul 2>&1
if /I "%errorlevel%"=="1" (
echo Не получилось установить драйвера и утилиты
echo.
echo Нажмите любую кнопку чтобы повторить попытку
pause>nul
goto downloadFileinstall
)
cls
:next1
@cd/d "%~dp0"
echo Все драйвера и утилиты установлены!
echo.
set choice=
set /p choice=Введите слово next, чтобы установить mtkclient, или если вы передумали введите back:
if /i "%choice%"=="next" rd /q /s "%~dp0downloadFile" & goto next
if /i "%choice%"=="back" rd /q /s "%~dp0downloadFile" & goto launch
goto downloadFileinstall
:next
cls
Echo Выбирите папку куда будет установлен mtkclient
ping -n 4 127.0.0.1>nul 
:nextfoldermtkinstall
 cls
 Echo Выберите папку куда будет установлен mtkclient
for /f "usebackq delims=" %%i in (
    `@"%systemroot%\system32\mshta.exe" "javascript:var objShellApp = new ActiveXObject('Shell.Application');var Folder = objShellApp.BrowseForFolder(0, 'Выберите папку куда будет установлен mtkclient',1, '::{20D04FE0-3AEA-1069-A2D8-08002B30309D}');try {new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(Folder.Self.Path)};catch (e){};close();" ^
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
set /p choice=Правильно ли вы выбрали путь для установки, выбирите yes или no:
if /i "%choice%"=="yes" goto next2
if /i "%choice%"=="no" goto nextfoldermtkinstall
cls
goto nextfoldermtkinstall2
:next2
cls
del /q /s "%~dp0files\temp\mtkfolder.txt" >nul 2>&1
Echo Идёт скачивание mtkclient подождите немного
set nameinstallmtkclient="installmtkclient.cmd"
echo @echo off>%nameinstallmtkclient%
echo @TITLE installmtkclient>>%nameinstallmtkclient%
echo @cd/d "%%~dp0" >>%nameinstallmtkclient%
echo @chcp 1251 ^>nul >>%nameinstallmtkclient%
echo echo Идёт скачивание mtkclient подождите немного >>%nameinstallmtkclient%
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
ping google.com >nul && (set errors1=Обратитесь к создателю программы для обновления ссылки & set errors2=Либо сами скачайте mtkclient) || (set errors1=У вас отсутствует подключение к интеренету & set errors2=Включите интернет и повторите попытку) >nul 2>&1
cls
Echo.Ошибка скачивания mtkclient
Echo.Перезапустите программу, если скачивание не получилось, обратитесь к создателю программы для обновления ссылки
Echo.
Echo.%errors1%
Echo.%errors2%
ECHO. ======================================================================================
Echo.                       Выбирите одно из действий
ECHO. ======================================================================================
ECHO.                    1.Я скачал сам (скачала сама) 
ECHO.                                  
ECHO.                    2.Повторить попытку скачивания
ECHO. ======================================================================================   
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto papka
if /i "%choice%"=="2" goto next
goto errormtkclient
exit /b
:64
cls
Echo Идёт скачивание python подождите немного
@cd/d "%~dp0"
md "downloadFile" >nul 2>&1
powershell Start-BitsTransfer -source "1https://www.python.org/ftp/python/3.9.8/python-3.9.8-amd64.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorpython=ошибка скачивания python & set errorAll=errorAll & set errornamepython=python, & Echo python>>.\files\temp\error.txt)
Echo.
Echo Идёт скачивание GIT подождите немного
powershell Start-BitsTransfer -source "1https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-64-bit.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorGit=ошибка скачивания Git & set errorAll=errorAll & set errornameGit=Git, & Echo Git>>.\files\temp\error.txt)
Echo.
Echo Идёт скачивание UsbDK подождите немного
powershell Start-BitsTransfer -source "1https://github.com/daynix/UsbDk/releases/download/v1.00-22/UsbDk_1.0.22_x64.msi" -destination "downloadFile" >nul 2>&1 && Echo Ok   || (Echo.Error & set errorUsbDk=ошибка скачивания UsbDk & set errorAll=errorAll & set errornameusbdk=UsbDk. & Echo UsbDk>>.\files\temp\error.txt)
Echo.
cls
call :%errorAll%
exit /b 
:32
cls
Echo Идёт скачивание python подождите немного
@cd/d "%~dp0"
md "downloadFile" >nul 2>&1
powershell Start-BitsTransfer -source "1https://www.python.org/ftp/python/3.9.8/python-3.9.8.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok || (Echo.Error & set errorpython=ошибка скачивания python & set errorAll=errorAll & set errornamepython=python, & Echo python>>.\files\temp\error.txt)
Echo.
Echo Идёт скачивание GIT подождите немного
powershell Start-BitsTransfer -source "1https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-32-bit.exe" -destination "downloadFile" >nul 2>&1 && Echo Ok  || (Echo.Error & set errorGit=ошибка скачивания Git & set errorAll=errorAll & set errornameGit=Git, & Echo Git>>.\files\temp\error.txt)
Echo.
Echo Идёт скачивание UsbDK подождите немного
powershell Start-BitsTransfer -source "1https://github.com/daynix/UsbDk/releases/download/v1.00-22/UsbDk_1.0.22_x86.msi" -destination "downloadFile"  >nul 2>&1 && Echo Ok  || (Echo.Error & set errorUsbDk=ошибка скачивания UsbDk & set errorAll=errorAll & set errornameusbdk=UsbDk. & Echo UsbDk>>.\files\temp\error.txt)
cls
call :%errorAll%
exit /b
:errorAll
Echo %errornamepython%>.\files\temp\error.txt
Echo %errornameGit%>>.\files\temp\error.txt
Echo %errornameusbdk% >>.\files\temp\error.txt
ping google.com >nul && (set errors1=Обратитесь к создателю программы для обновления ссылки & set errors2=Либо сами скачайте и установите: %errornamepython%%errornameGit%%errornameusbdk%) || (set errors1=У вас отсутствует подключение к интеренету & set errors2=Вам нужно установить: %errornamepython%%errornameGit%%errornameusbdk%) >nul 2>&1
cls
Echo.%errorpython%
Echo.%errorGit%
Echo.%errorUsbDk%
Echo.
Echo.Разрядность вашей системы: %bitdepth%
Echo.%errors1%
Echo.%errors2%
ECHO. ======================================================================================
Echo.                       Выбирите одно из действий
ECHO. ======================================================================================
ECHO.                    1.Я скачал и установил сам (скачала и установила сама) 
ECHO.                                  
ECHO.                    2.Повторить попытку скачивания
ECHO. ======================================================================================
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto next
if /i "%choice%"=="2" goto downloadFile
goto errorAll
exit /b

rem
ECHO ***************************************************************************************
ECHO *      ------------------------^< ожидание устройства ^>-------------------------      *
ECHO *                                                                                     *
ECHO *            Если вы застряли на этом этапе - необходимо установить драйверы.            *
ECHO ***************************************************************************************
ECHO.
ECHO. ...
ECHO.
rem

REM не используемая часть кода
:installcoremagisk
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                      Вы точно уверены в патче ядра от А30
ECHO.            
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto coremagiskB
if /i "%choice%"=="2" goto STARTS
echo.
exit /b
REM 

:reboot0.1
@cd/d "%~dp0files\"
@IF EXIST "adb.exe" (cls) ELSE (cls & echo adb.exe нету рядом & pause & exit)
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
call :EchoColor "Не забудьте включить отладку по usb" Green & echo. & echo. & echo. & echo Телефон не подключён к компьютеру 
echo. 
echo Подключите телефон через кабель, программа сама увидит это
echo. 
ping -n 3 127.0.0.1>nul 
goto reboot
)
cls
Echo.
CLS
ECHO.
ECHO. ======================================================================================
ECHO. Чтобы включить/отключить окно с подключёнными устройствами введите "9", и нажмите Enter
ECHO.           Убедитесь что драйвера установлены и включён режим отладки на телефоне 
ECHO.                               Включите экран телефона 
ECHO.                            Выберите как нужно перезагрузить
ECHO. ======================================================================================
ECHO.                         1.Перезагрузить систему(Весь телефон)(adb)
ECHO.                                  
ECHO.                         2.Перезагрузить в рекавери (adb)
ECHO.                                  
ECHO.                         3.Выключить телефон (adb)
ECHO.                                  
ECHO.                         4.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" set "adbr=" & set "reboot1choise=Выбрана перезагрузка" & goto reboot1
if /i "%choice%"=="2" set "adbr=recovery" & set "reboot1choise=Выбрана перезагрузка в рекавери" & goto reboot1
if /i "%choice%"=="3" set "adbr=-p" & set "reboot1choise=Выбрано выключение" & goto reboot1
if /i "%choice%"=="4" goto STARTS 
if /i "%choice%"=="9" IF NOT EXIST "adb devices.cmd" (call :adb_check_devices) ELSE (taskkill.exe /fi "WINDOWTITLE eq adb devices" /f >nul 2>&1 & del /q /s %sniffer% >nul 2>&1)
goto reboot
echo.
exit /b
:reboot1
IF EXIST "adb.exe" (cls) ELSE (echo adb.exe нету рядом & pause & exit)
cls
adb devices -l | findstr /ic:"device" >nul 2>&1
if "%errorlevel%"=="1" (
echo.%reboot1choise%  
call :EchoColor "Не забудьте включить отладку по usb" Green & echo. & echo. & echo. & echo Телефон не подключён к компьютеру 
echo. 
echo Подключите телефон через кабель, программа сама увидит это
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
echo Выберите модель по номеру:
for /f "tokens=1* delims=:" %%i in ('more device.txt') do ^
set/a c+=1 & set "v!c!=%%j" & set n=!n!!c!&echo !c!. %%j
del /q /s "device.txt" >nul 2>&1
>nul choice/n /c !n!
echo Вы выбрали !v%errorlevel%!.
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
echo echo Подключённые устройства к adb >>%sniffer%
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
@IF EXIST "adb.exe" (cls) ELSE (cls & echo adb.exe нету рядом & pause & goto STARTS)
cls
Echo.
CLS
ECHO                              Несколько полезных советов!!
ECHO. =========================================================================================
ECHO                          Не забудьте установить драйвера adb! 
ECHO                               Включите отладку по USB
ECHO. =========================================================================================
ECHO.                1.Установить приложение(ния) (adb)
ECHO.                                  
ECHO.                2.Сделать Бекап приложений и их данных / Восстановить (НЕ РАБОТАЕТ) (adb)
ECHO.                                  
ECHO.                3.Дополнительно для прошивки
ECHO.                                  
ECHO.                4.Заблокировать загрузчик (mtkclient)
ECHO.                       
ECHO.                5.Включить/Отключить обновления(root) (adb)
ECHO.                                                    
ECHO.                6.Убрать разрешение на подтверждение удаления(google photo) (adb)
ECHO.                                  
ECHO.                9.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
call :EchoColor "Не забудьте включить отладку по usb" Green & echo. & echo. & echo. & echo Телефон не подключён к компьютеру 
echo. 
echo Подключите телефон через кабель, программа сама увидит это
echo. 
ping -n 3 127.0.0.1>nul 
goto deletegooglephoto
)
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.         Вы точно хотите убрать разрешение на подтверждение удаления из google photo?
ECHO.                 Это сработает если у вас google photo уже было в прошивке    
ECHO.                                
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto deletegooglephoto1
if /i "%choice%"=="2" goto dopolnit
goto deletegooglephoto
exit /b
:deletegooglephoto1
adb devices -l | findstr /ic:"device" >nul 2>&1
if "%errorlevel%"=="1" (
echo.%reboot1choise%  
call :EchoColor "Не забудьте включить отладку по usb" Green & echo. & echo. & echo. & echo Телефон не подключён к компьютеру 
echo. 
echo Подключите телефон через кабель, программа сама увидит это
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
echo Выберите модель по номеру:
for /f "tokens=1* delims=:" %%i in ('more device.txt') do ^
set/a c+=1 & set "v!c!=%%j" & set n=!n!!c!&echo !c!. %%j
del /q /s "device.txt" >nul 2>&1
>nul choice/n /c !n!
echo Вы выбрали !v%errorlevel%!.
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
call :EchoColor "Не забудьте включить отладку по usb" Green & echo. & echo. & echo. & echo realme 8i не подключён к компьютеру  
echo. 
echo Подключите телефон через кабель, программа сама увидит это
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
echo Root не обнаружен 
pause 
exit
)
:on/off update
echo подождите...
adb -s %iddevices% shell "pm list packages -d | grep 'sau'" | findstr /x /c:"package:com.oplus.sau" >nul 2>&1
if %errorlevel% == 1 (set sau=Включён & set number1=1) else (set sau=Выключен & set number1=0)
adb -s %iddevices% shell "pm list packages -d | grep 'romupdate'" | findstr /x /c:"package:com.oplus.romupdate" >nul 2>&1
if %errorlevel% == 1 (set romupdate=Включён & set number2=1) else (set romupdate=Выключен & set number2=0)
adb -s %iddevices% shell "pm list packages -d | grep 'ota'" | findstr /x /c:"package:com.oplus.ota" >nul 2>&1
if %errorlevel% == 1 (set ota=Включён & set number3=1) else (set ota=Выключен & set number3=0)
set /a otvet=%number1%+%number2%+%number3%
if %otvet% == 3 (set allupdate=Обновления включены & set color=Red) else (
if %otvet% == 2 (set allupdate=Две службы обновления включены & set color=Red)
if %otvet% == 1 (set allupdate=Одна служба обновления включена & set color=Red)
if %otvet% == 0 (set allupdate=Обновления выключены & set color=Green)
)
cls
echo.У вас %root%
echo.
echo Примечание: 
echo.1) При включении/отключении обновлений будет отправлен запрос root на телефон
echo.2) Если у вас нечего не изменилось после отключения, то скорее всего рут права отклонены,
echo    зайдите в управление и включите их для приложения "Оболочка" 
echo                   Автор программы:En32
echo.
echo.
call :EchoColor "%allupdate%" %color% & echo.
echo.
echo 1) Включить обновления
echo 2) Отключить обновления
echo 3) Включить/Отключить выборочно службы
echo 4) Обновить информацию
echo 5) Назад
choice /c 12345 /n /m "Введите цифру:"
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
echo обновления отключены
ping -n 2 127.0.0.1>nul 
goto on/off update
exit /b
:updateON
echo.
adb -s %iddevices% shell "su -c pm enable com.oplus.sau" >nul 2>&1 && echo ok
adb -s %iddevices% shell "su -c pm enable com.oplus.romupdate" >nul 2>&1 && echo ok
adb -s %iddevices% shell "su -c pm enable com.oplus.ota" >nul 2>&1 && echo ok
echo.
echo обновления включены
ping -n 2 127.0.0.1>nul 
goto on/off update
exit /b
:choiceupdate
adb -s %iddevices% shell "pm list packages -d | grep 'sau'" | findstr /x /c:"package:com.oplus.sau" >nul 2>&1
if %errorlevel% == 1 (set sau=Включён) else (set sau=Выключен)
adb -s %iddevices% shell "pm list packages -d | grep 'romupdate'" | findstr /x /c:"package:com.oplus.romupdate" >nul 2>&1
if %errorlevel% == 1 (set romupdate=Включён) else (set romupdate=Выключен)
adb -s %iddevices% shell "pm list packages -d | grep 'ota'" | findstr /x /c:"package:com.oplus.ota" >nul 2>&1
if %errorlevel% == 1 (set ota=Включён) else (set ota=Выключен)
cls
echo Если все параметры включены то обновления включены.
echo Если все параметры выключены то обновления выключены.
echo.
echo Включить/Отключить выборочно
echo 1)Пакет com.oplus.sau - %sau%
echo 2)Пакет com.oplus.romupdate - %romupdate%
echo 3)Пакет com.oplus.ota - %ota%
echo 4)Назад
choice /c 1234 /n /m "Введите цифру:"
if "%errorlevel%" == "4" goto on/off update
if "%errorlevel%" == "1" (if "Включён" == "%sau%" (
adb -s %iddevices% shell "su -c pm disable com.oplus.sau" >nul 2>&1 & goto choiceupdate
) else (
adb -s %iddevices% shell "su -c pm enable com.oplus.sau" >nul 2>&1 & goto choiceupdate
))

if "%errorlevel%" == "2" (if "Включён" == "%romupdate%" (
adb -s %iddevices% shell "su -c pm disable com.oplus.romupdate" >nul 2>&1 & goto choiceupdate
) else (
adb -s %iddevices% shell "su -c pm enable com.oplus.romupdate" >nul 2>&1 & goto choiceupdate
))

if "%errorlevel%" == "3" (if "Включён" == "%ota%" (
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
ECHO.                   Вы точно хотите заблокировать загрузчик?
ECHO.            
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto lock1
if /i "%choice%"=="2" goto dopolnit
goto lockseccfg
exit /b
:lock1
cls
@cd/d "%Foldermtk%"
Echo Зажмите на выключенном телефоне обе кнопки громкости
Echo досчитайте до 5 и подключите его к компьютеру
Echo после подключения досчитайте снова до 5 и отпустите кнопки
Echo Скрипт вернёт вас в меню если блокировка загрузчика пройдёт удачно
python mtk da seccfg lock >lock1.txt
more "%Foldermtk%\lock1.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=заблокировать загрузчика & goto errorfoldermtk
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
ECHO.                      В корне программы была создана папка application
ECHO.       в неё можете положить apk файлы которые хотите установить в телефон 
ECHO.          не обязательно класть приложения в папку, можно выбрать 3 или 4 пункт
Echo.                       Выбирите одно из действий
ECHO. ======================================================================================
ECHO.                    1.Установить одно приложение
ECHO.                                  
ECHO.                    2.Установить все приложения из папки 
ECHO.                                  
ECHO.                    3.Выбрать приложение для установки
ECHO.                                  
ECHO.                    4.Выбрать папку с приложениями для установки
ECHO.                       (будут установленны все приложения из папки)      
ECHO.                                        
ECHO.                    5.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
    Echo Выбирайте нужный файл: &Echo.
    For %%i In ("%FileIn%") Do (
        Call Set /A Num+=1
        Call Set "@@%%Num%%=%%i"
        Call :Checklist "%%i" %%Num%%
    )
    If %Num% EQU -1 (Echo Файлы %FileIn% не найдены. &Pause &goto installapplication1.5)
    Echo.
    Set /A Num+=1
    Call Set "Sele=%%Str:~0,%Num%%%"
    Choice /N /C 0%Sele% /M "0-(нуль)- вернуться назад >"
    Set /A Out=%ErrorLevel%
    If %Out% EQU 1 goto installapplication1.5
    Set /A Out-=2
    Call Set "Sele=%%@@%Out%%%" 
Echo %Sele%
cls
Echo Включите экран телефона, а так-же отладку по usb
%adb% install "%Sele%">Logfile.txt
for  /f "tokens=*" %%j IN ('more Logfile.txt') DO set Logfile=%%j 
if /I "%Logfile%" == "Success " (Echo. & Echo Приложение установленно & ping -n 3 127.0.0.1>nul )  else (Echo. & Echo Приложение НЕ установленно & ping -n 3 127.0.0.1>nul )
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
    `@"%systemroot%\system32\mshta.exe" "javascript:var objShellApp = new ActiveXObject('Shell.Application');var Folder = objShellApp.BrowseForFolder(0, 'Выберите папку',1, '::{20D04FE0-3AEA-1069-A2D8-08002B30309D}');try {new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write(Folder.Self.Path)};catch (e){};close();" ^
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
Echo.                         Выбирите одно из действий
ECHO. ======================================================================================
ECHO.                             1.Создать Бекап приложений и их данных 
ECHO.                                  
ECHO.                             2.Восстановить бекап приложений и их данных 
ECHO.                                  
ECHO.                             9.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto createbackup
if /i "%choice%"=="2" goto recoverbackup
if /i "%choice%"=="9" goto dopolnit
goto backupappanddata
echo.
exit /b
:createbackup
Echo Включите экран телефона
adb backup "-all -apk -nosystem" -f backup3.ab>Logfile.txt
for  /f "tokens=*" %%j IN ('more Logfile.txt') DO set Logfile=%%j 
if /I "%Logfile%" == "* daemon started successfully * " (Echo. & Echo Приложение установленно & ping -n 3 127.0.0.1>nul )  else (Echo. & Echo Приложение НЕ установленно & ping -n 3 127.0.0.1>nul )
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
ECHO.                            Хотите выбрать файл рекавери?
ECHO.            Или вы можете нажать нет и выбрать уже скаченное рекавери
ECHO.  
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO.                                  
ECHO.                             3.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
ECHO.                       Вы точно уверены в патче рекавери ?
ECHO.                      Название рекавери точно совпадает ?
ECHO.  %wayfilerecovery%
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto recovery2
if /i "%choice%"=="2" goto recovery
goto recovery1.5
exit /b
:recovery2
cls
copy "%wayfilerecovery%" "%Foldermtk%" > NUL
@cd/d "%Foldermtk%"
Echo Зажмите на выключенном телефоне обе кнопки громкости
Echo досчитайте до 5 и подключите его к компьютеру
Echo после подключения досчитайте снова до 5 и отпустите кнопки
Echo Скрипт вернёт вас в меню если прошивка рекавери пройдёт удачно
python mtk w recovery "%filerecovery%" >errorflashrecovery.txt
more "%Foldermtk%\errorflashrecovery.txt" | findstr /ic:"Failed" > NUL
if %errorlevel% EQU 0 set errorerrorfoldermtk=прошивки рекавери & goto errorfoldermtk
del /q "errorflashrecovery.txt"
GOTO STARTS 
exit /b 
:norecovery
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                     
ECHO.                           Выберите recovery 
ECHO.            
ECHO. ======================================================================================
ECHO.                             1.TWRP                    
ECHO.                                  
ECHO.                             2.OrangeFox                     
ECHO.                                  
ECHO.                             9.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
ECHO.                       Вы точно уверены в патче рекавери ?
ECHO.                        Вы хотите прошить TWRP?
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
ECHO.                       Вы точно уверены в патче рекавери ?
ECHO.                        Вы хотите прошить OrangeFox?
ECHO. ======================================================================================
ECHO.                             1.Да
ECHO.                                  
ECHO.                             2.Нет
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="1" goto recovery2
if /i "%choice%"=="2" goto recovery
echo.
exit /b

REM Пока не реализовано
:miltizadacha
cls
Echo Эта функция не работает :(
pause
goto STARTS
exit /b
CLS
ECHO.
ECHO. ======================================================================================
ECHO.                    
ECHO.                      Вы хотите рут с тврп или без него
ECHO.            
ECHO. ======================================================================================
ECHO.                             1.С TWRP    
ECHO.                                  
ECHO.                             2.без TWRP   (рекомендуется)
ECHO.                                  
ECHO.                             9.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
ECHO.                         Какая у вас версия прошивки?
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
ECHO.                             9.Назад
ECHO. ======================================================================================
:CHO
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
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
Echo Ошибка %errorerrorfoldermtk%
Echo Возможно у вас плохой кабель, который не передаёт информацию 
Echo Или вы прошиваете не то что нужно!
 pause & GOTO STARTS 
exit /b
REM >errordamp.txt
REM for  /f "delims=" %%i IN ('more "%Foldermtk%errordamp.txt"') DO set errordamp=%%i
 REM echo "%errordamp%" | findstr /ic:"Failed" > NUL
REM if %errorlevel% EQU 0 goto errorfoldermtk
:Additionallyforfirmware
explorer "%~dp0files\Additionally for firmware"
goto dopolnit
REM пока хз может что-нибудь лучше придумаю
REM CLS
REM ECHO.
REM ECHO. ======================================================================================
REM ECHO.                    
REM ECHO.                        Дополнительные файлы для прошивки
REM ECHO.            
REM ECHO. ======================================================================================
REM ECHO.                             1.Отключение меню подтверждения входа в систему    
REM ECHO.                                  
REM ECHO.                             2.Просто мод на чтение/запись системных разделов
REM ECHO.                               
REM ECHO.                             9.Назад
REM ECHO. ======================================================================================
REM :CHO
REM set choice=
REM set /p choice=Выберите действие, а затем нажмите Enter:
REM if /i "%choice%"=="1" goto miltizadachaA30
REM if /i "%choice%"=="2" goto miltizadachaA32
REM if /i "%choice%"=="3" goto miltizadachaA20
REM if /i "%choice%"=="4" goto miltizadachaA21
REM if /i "%choice%"=="9" goto STARTS
REM echo.
REM exit /b
:errorstarts
cls
Echo Эта функция пока что не работает :(
pause
goto STARTS
exit /b
:errorviewcoreerror
cls
Echo Вы согласились что это ядро вы не будете использовать, но если захотели, 
Echo то скачайте полную версию программы
pause
goto nocore
exit /b
:errorsetting
cls
Echo Эта функция отключена
Echo Из-за настроеек
Echo.
Echo Нажмите любую кнопку чтобы вернуться назад
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