@echo off
@chcp 1251 >nul
@cd/d "%~dp0"
@setlocal enableextensions enabledelayedexpansion

rem Переменные
@set edgeupdatem=.
@set edgeupdate=.
@set WarpJITSvc=.
@set "info1=Этот шаг должен длиться не более минуты"
@set "info2=Если у Вас зависла надпись "ok", то запустите диспетчер задач и завершите вручную процесс Unlocker.exe"
rem Текущая версия
@set Thisversion=1.4.0



:1
rem Проверяем интернет-соединение
ping www.google.nl -n 1 -w 1000 |>nul find /i "TTL=" && goto CheckUpdate

echo                  Невозможно проверить обновления программы, отсутствует интернет
echo.
echo    Использование старых версий не рекомендуется, поэтому при первой возможности обновите программу
pause>nul 
cls 
goto MainMenu
rem Проверка обновлений программы
:CheckUpdate
curl -g -k -L -# -o "%temp%\Version.bat" "https://pastebin.com/raw/udrSrrYN" >nul 2>&1
call "%temp%\Version.bat"
if "%Thisversion%" lss "%Version%" (goto Update) else (goto MainMenu)
rem Обновление программы
:Update
echo вы обновитесь
pause
curl -g -k -L -# -o %0 "https://raw.githubusercontent.com/Enable32/MyProgramm/main/fuckMicrosoftegde.cmd" >nul 2>&1
call %0
exit

:MainMenu
pause
if not exist "Unlocker.exe" (
echo Unlocker.exe Не обнаружен рядом с программой!
echo Пожалуйста положите Unlocker.exe рядом с программой
del /q /s "SID.inf" >nul 2>&1 
pause
exit
)
powershell whoami | findstr /ic:"nt authority">nul 2>&1  
if %errorlevel% == 1 (
@mode con cols=111 lines=40
call :EchoColor "Произошла ошибка,перезапустите программу" Red & echo.
del /q /s "SID.inf" >nul 2>&1 
pause>nul 2>&1 
exit 
)
for  /f "delims=" %%i IN ('more "SID.inf"') DO set sidinf=%%i
del /q /s "SID.inf" >nul 2>&1 
:menu
@mode con cols=111 lines=41
cls
set edgeupdatem=.
set edgeupdate=.
set WarpJITSvc=.
echo Пользователь:Система
echo Имя пользователя который запустил программу: %username%
echo Сид пользователя который запустил программу: %sidinf%
echo. 
echo.Для минимальной версии:
if not exist "C:\Program Files (x86)\Microsoft\Edge\*" (
call :EchoColor "Папка Edge удалена из Windows" Green & echo.
) else (
call :EchoColor "Папка Edge не удалена из Windows" Red & echo.
)
if not exist "C:\Program Files (x86)\Microsoft\EdgeCore\*" (
call :EchoColor "Папка EdgeCore удалена из Windows" Green & echo.
) else (
call :EchoColor "Папка EdgeCore не удалена из Windows" Red & echo.
)
if not exist "C:\Program Files (x86)\Microsoft\EdgeUpdate\*" (
call :EchoColor "Папка EdgeUpdate удалена из Windows" Green & echo.
) else (
call :EchoColor "Папка EdgeUpdate не удалена из Windows" Red & echo.
)
if not exist "C:\Program Files (x86)\Microsoft\EdgeWebView\*" (
call :EchoColor "Папка EdgeWebView удалена из Windows" Green & echo.
) else (
call :EchoColor "Папка EdgeWebView не удалена из Windows" Red & echo.
)
if not exist "C:\Program Files (x86)\Microsoft\Temp\*" (
call :EchoColor "Папка EdgeTemp удалена из Windows" Green & echo.
) else (
call :EchoColor "Папка EdgeTemp не удалена из Windows" Red & echo.
)
echo.
call :EchoColor "Ярлык edge" 03 & echo.
2>nul dir  /b "%userprofile%\desktop\*edge*" | findstr /ic:"Microsoft Edge." >nul 2>&1 
if %errorlevel%==0 (call :EchoColor "Ярлык на рабочем столе найден" Red & echo.)
if %errorlevel%==1 (call :EchoColor "Ярлык на рабочем столе не найден" Green & echo.)
echo.
call :EchoColor "Состояние служб edge:" 03 & echo.
sc query edgeupdatem >nul 2>&1
if ERRORLEVEL 1 (set edgeupdatem=Green & set edgeupdatem1=Не существует) else (
sc query edgeupdatem | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (set edgeupdatem=Red & set edgeupdatem1=Отключена) ELSE (set edgeupdatem=Red & set edgeupdatem1=Запущена))
call :EchoColor "Служба edgeupdate-%edgeupdatem1%" %edgeupdatem% & echo.

sc query edgeupdate >nul 2>&1
if ERRORLEVEL 1 (set edgeupdate=Green & set edgeupdate1=Не существует) else (
sc query edgeupdate | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (set edgeupdate=Red & set edgeupdate1=Отключена) ELSE (set edgeupdate=Red & set edgeupdate1=Запущена))
call :EchoColor "Служба edgeupdate-%edgeupdate1%" %edgeupdate% & echo.

sc query WarpJITSvc >nul 2>&1
if ERRORLEVEL 1 (set WarpJITSvc=Green & set WarpJITSvc1=Не существует) else (
sc query WarpJITSvc | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (set WarpJITSvc=Red & set WarpJITSvc1=Отключена) ELSE (set WarpJITSvc=Red & set WarpJITSvc1=Запущена))
call :EchoColor "Служба WarpJITSvc-%WarpJITSvc1%" %WarpJITSvc% & echo.

set "pathedge1=\MicrosoftEdgeUpdateTaskMachineCore"
set "pathedge2=\MicrosoftEdgeUpdateTaskMachineUA"
for /f "delims=, tokens=3" %%I in (' 2^>nul SCHTASKS /QUERY /FO CSV /NH /TN "%pathedge1%" ') do set "replyTaskDef1=%%~I"
for /f "delims=, tokens=3" %%I in (' 2^>nul SCHTASKS /QUERY /FO CSV /NH /TN "%pathedge2%" ') do set "replyTaskDef2=%%~I"

if not "!replyTaskDef1!"=="" (
	if "!replyTaskDef1!"=="Отключена" ( set "TaskDefResult11=Red" & set "TaskDefResult1=Отключена" ) else ( set "TaskDefResult11=Red" & set "TaskDefResult1=Включена" )
) else ( set TaskDefResult11=Green & set "TaskDefResult1=Не существует" )
if not "!replyTaskDef2!"=="" (
	if "!replyTaskDef2!"=="Отключена" ( set "TaskDefResult22=Red" & set "TaskDefResult2=Отключена" ) else ( set "TaskDefResult22=Red" & set "TaskDefResult2=Включена" )
) else ( set TaskDefResult22=Green & set "TaskDefResult2=Не существует" )

echo.
call :EchoColor "Состояние заданий в планировщике:" 03 & echo.
call :EchoColor "MicrosoftEdgeUpdateTaskMachineCore- %TaskDefResult1%" %TaskDefResult11% & echo.
call :EchoColor "MicrosoftEdgeUpdateTaskMachineUA- %TaskDefResult1%" %TaskDefResult11% & echo.
echo. 
echo.
echo.Для максимальной версии(в неё входит и минимальная):
2>nul dir  /b "C:\Windows\SystemApps" | findstr /ic:"edge" >nul 2>&1 
if %errorlevel%==0 (call :EchoColor "В папке SystemApps ecть edge" Red & echo.)
if %errorlevel%==1 (call :EchoColor "В папке SystemApps нету edge" Green & echo.)
2>nul dir  /b "C:\Program Files\WindowsApps" | findstr /ic:"edge" >nul 2>&1 
if %errorlevel%==0 (call :EchoColor "В папке WindowsApps ecть edge" Red & echo.)
if %errorlevel%==1 (call :EchoColor "В папке WindowsApps нету edge" Green & echo.)
2>nul dir  /b "%userprofile%\appdata\Local\Microsoft\WindowsApps" | findstr /ic:"edge" >nul 2>&1 
if %errorlevel%==0 (call :EchoColor "В папке Local\Microsoft\WindowsApps ecть edge" Red & echo.)
if %errorlevel%==1 (call :EchoColor "В папке Local\Microsoft\WindowsApps нету edge" Green & echo.)
2>nul dir  /b "%userprofile%\appdata\Local\Packages" | findstr /ic:"edge" >nul 2>&1 
if %errorlevel%==0 (call :EchoColor "В папке Local\Packages ecть edge" Red & echo.)
if %errorlevel%==1 (call :EchoColor "В папке Local\Packages нету edge" Green & echo.)
2>nul dir  /b "C:\ProgramData\Microsoft\Windows\AppRepository\Packages" | findstr /ic:"edge" >nul 2>&1 
if %errorlevel%==0 (call :EchoColor "В папке Windows\AppRepository\Packages ecть edge" Red & echo.)
if %errorlevel%==1 (call :EchoColor "В папке Windows\AppRepository\Packages нету edge" Green & echo.)
2>nul dir  /b "C:\Windows\WinSxS\Manifests" | findstr /ic:"edge" >nul 2>&1 
if %errorlevel%==0 (call :EchoColor "В папке WinSxS\Manifests ecть edge" Red & echo.)
if %errorlevel%==1 (call :EchoColor "В папке WinSxS\Manifests нету edge" Green & echo.)
2>nul dir  /b "C:\Windows\WinSxS\FileMaps" | findstr /ic:"edge" >nul 2>&1 
if %errorlevel%==0 (call :EchoColor "В папке WinSxS\FileMaps ecть edge" Red & echo.)
if %errorlevel%==1 (call :EchoColor "В папке WinSxS\FileMaps нету edge" Green & echo.)
2>nul dir  /b "C:\Windows\WinSxS" | findstr /ic:"edge" >nul 2>&1 
if %errorlevel%==0 (call :EchoColor "В папке WinSxS ecть edge" Red & echo.)
if %errorlevel%==1 (call :EchoColor "В папке WinSxS нету edge" Green & echo.)
2>nul dir  /b "%userprofile%\appdata\Local\Microsoft" | findstr /ic:"edge" >nul 2>&1 
if %errorlevel%==0 (call :EchoColor "В папке Local\Microsoft ecть edge" Red & echo.)
if %errorlevel%==1 (call :EchoColor "В папке Local\Microsoft нету edge" Green & echo.)
echo. 



echo Выберите одно из действий:
echo 1.Режим Минимальный
echo 2.Режим МАКСИМАЛЬНЫЙ всё что можно найти в системе(Пока не стабильно)
echo 3.Exit
choice /c 1234 /n /m "Введите цифру:"
if errorlevel 4 goto menu
if errorlevel 3 goto exit
if errorlevel 2 goto max
if errorlevel 1 goto min
exit /b
:min
cls
Echo Выбран режим удаления "Минимальный"
ECHO. Введите YES , чтобы продолжить:
ECHO. Введите 2 , чтобы выйти назад
ECHO. 
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="YES" goto min2
if /i "%choice%"=="2" goto menu
goto min
exit /b
:min2
cls
for /f "usebackq tokens=2 delims==" %%i in (`wmic.exe LogicalDisk where "Name='c:'" get FreeSpace /value`) do set sFreeSize=%%i
if defined sFreeSize (set sFreeSizePseudoMb=%sFreeSize:~0,-7%)
ping -n 2 127.0.0.1>nul
echo %info1% & echo %info2%
powershell -command "Get-AppxPackage -AllUsers *edge* | Remove-AppxPackage -AllUsers -ErrorAction Continue">nul 2>&1 && echo ok
powershell -command "Get-AppxPackage *edge* | Remove-AppxPackage -ErrorAction Continue">nul 2>&1 && echo ok
powershell -command "Get-AppxPackage *edge* | Remove-AppxPackage" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files (x86)\Microsoft\*"') DO "Unlocker.exe"  "C:\Program Files (x86)\Microsoft\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files (x86)\Microsoft\*"') DO rd /q /s "C:\Program Files (x86)\Microsoft\%%i">nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\ProgramData\Microsoft\" ^| findstr /ic:"edge"') DO rd /q /s "C:\ProgramData\Microsoft\%%i">nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\ProgramData\Microsoft\" ^| findstr /ic:"edge"') DO del /q /s "C:\ProgramData\Microsoft\%%i">nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Users\All Users\Microsoft\" ^| findstr /ic:"edge"') DO rd /q /s "%%i">nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Users\All Users\Microsoft\" ^| findstr /ic:"edge"') DO del /q /s "%%i">nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\desktop\*edge*" ^| findstr /ic:"Microsoft Edge."') DO del /q /s "%userprofile%\desktop\%%i" >nul 2>&1 && echo ok
echo %info1% & echo %info2%
ping -n 3 127.0.0.1>nul
echo.>"C:\Program Files (x86)\Microsoft\Edge"
echo.>"C:\Program Files (x86)\Microsoft\EdgeCore"
echo.>"C:\Program Files (x86)\Microsoft\EdgeUpdate"
echo.>"C:\Program Files (x86)\Microsoft\EdgeWebView"
echo.>"C:\Program Files (x86)\Microsoft\Temp"
echo.>"C:\ProgramData\Microsoft\EdgeUpdate"
echo.>"C:\Users\All Users\Microsoft\EdgeUpdate"
echo %info1% & echo %info2%
ping -n 3 127.0.0.1>nul
echo Удаление заданий в планировщике
SchTasks /Delete /TN "\MicrosoftEdgeUpdateTaskMachineCore" /F >nul 2>&1 & echo ok
SchTasks /Delete /TN "\MicrosoftEdgeUpdateTaskMachineUA" /F >nul 2>&1 & echo ok
echo Задания удалены
echo.
ping -n 5 127.0.0.1>nul 
echo Удаление служб
sc delete edgeupdatem >nul 2>&1 & echo ok
sc delete edgeupdate >nul 2>&1 & echo ok
sc delete WarpJITSvc >nul 2>&1 & echo ok
sc delete MicrosoftEdgeElevationService >nul 2>&1 && echo ok
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\edgeupdate" /f >nul 2>&1 && echo ok
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\edgeupdatem" /f >nul 2>&1 && echo ok
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WarpJITSvc" /f >nul 2>&1 && echo ok
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MicrosoftEdgeElevationService" /f >nul 2>&1 && echo ok
echo Службы удалены
echo.
echo Отключаем обновления
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d "0x0" /f >nul 2>&1 && echo ok
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SleepingTabsEnabled" /t REG_DWORD /d "0x0" /f >nul 2>&1 && echo ok
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d "0x0" /f >nul 2>&1 && echo ok
echo Обновления отключены
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /v "{29647474-E788-474B-B47A-E1322527A818}" /f >nul 2>&1 && echo ok
REM Reg.exe add "HKEY_USERS\%sidinf%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d "00a80100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1200000035f2e4a647cbd8013e5876ed47cbd8016ecd9f0fbdd0d801140056003100000000003955624711005461736b42617200400009000400efbe32554052395562472e000000c5910100000004000000000000000000000000000000926e2e005400610073006b00420061007200000016001601320097010000874f0749200046494c4545587e322e4c4e4b0000840009000400efbe39556247395562472e000000639b00000000020000000000000000005a0000000000589c4400460069006c00650020004500780070006c006f0072006500720020002800320029002e006c006e006b00000040007300680065006c006c00330032002e0064006c006c002c002d003200320030003600370000001c00120000002b00efbe1428a20fbdd0d8011c00420000001d00efbe02004d006900630072006f0073006f00660074002e00570069006e0064006f00770073002e004500780070006c006f0072006500720000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c000000ff" /f >nul 2>&1 && echo ok
REM Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d "00a80100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1200000035f2e4a647cbd8013e5876ed47cbd8016ecd9f0fbdd0d801140056003100000000003955624711005461736b42617200400009000400efbe32554052395562472e000000c5910100000004000000000000000000000000000000926e2e005400610073006b00420061007200000016001601320097010000874f0749200046494c4545587e322e4c4e4b0000840009000400efbe39556247395562472e000000639b00000000020000000000000000005a0000000000589c4400460069006c00650020004500780070006c006f0072006500720020002800320029002e006c006e006b00000040007300680065006c006c00330032002e0064006c006c002c002d003200320030003600370000001c00120000002b00efbe1428a20fbdd0d8011c00420000001d00efbe02004d006900630072006f0073006f00660074002e00570069006e0064006f00770073002e004500780070006c006f0072006500720000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c000000ff" /f >nul 2>&1 && echo ok
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d "ff" /f
Reg.exe add "HKEY_USERS\%sidinf%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d "ff" /f
REM AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar
for /f "usebackq tokens=2 delims==" %%i in (`wmic.exe LogicalDisk where "Name='c:'" get FreeSpace /value`) do set sFreeSize=%%i
if defined sFreeSize (set sFreeSizePseudoMb1=%sFreeSize:~0,-7%)
set /a Freed=!sFreeSizePseudoMb1! - !sFreeSizePseudoMb!
taskkill /im explorer.exe /f>nul 2>&1
ping -n 2 127.0.0.1>nul
del /q /a "%userprofile%\AppData\Local\IconCache.db" >nul 2>&1
del /q /a /s "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*.db" >nul 2>&1
ping -n 2 127.0.0.1>nul
start explorer.exe
cls
echo.
Echo.    !Freed!  мегабайт освобождено
Echo.
pause
pause
exit
exit /b
:max
cls
Echo Выбран режим удаления "МАКСИМАЛЬНЫЙ"(Пока не стабильный)
ECHO. Введите YES , чтобы продолжить:
ECHO. Введите 2 , чтобы выйти назад
ECHO. 
set choice=
set /p choice=Выберите действие, а затем нажмите Enter:
if /i "%choice%"=="YES" goto max2
if /i "%choice%"=="2" goto menu
goto max
exit /b
:max2
cls
Echo Идёт подсчёт места
dir /b /s "C:\" | findstr /ic:"edge" >"C:\before.txt"
cls
Echo Если вывод информации ок остановится,откройте диспетчер задач, и "удалите" процесс Unlocker.exe
REM исключения
set "exceptions=exceptions.ini"
Echo "C:\Windows\System32\edgehtml.dll">exceptions.ini
Echo "C:\Windows\System32\edgeIso.dll">>exceptions.ini
Echo "C:\Windows\System32\EdgeManager.dll">>exceptions.ini
REM Echo "поставить путь до папки/файла">>exceptions.txt
REM определение языка и добавление исключения
 for %%l in (ar-SA bg-BG cs-CZ da-DK de-DE el-GR en-GB en-US es-ES es-MX et-EE fi-FI fr-CA fr-FR he-IL hr-HR hu-HU it-IT ja-JP ko-KR lt-LT lv-LV nb-NO nl-NL pl-PL pt-BR pt-PT ro-RO ru-RU sk-SK sl-SI sr-Latn-CS sr-Latn-RS sv-SE th-TH tr-TR uk-UA zh-CN zh-HK zh-TW) do (
	if exist "%systemroot%\System32\%%l\edgehtml.dll.mui" (
		Echo "%systemroot%\System32\%%l\edgehtml.dll.mui">>exceptions.ini
			)
)
taskkill /im explorer.exe /f>nul 2>&1
set killer="kill Unlocker.cmd"
del /q %killer% >nul 2>&1 
cmd.exe /c (
echo ^<# :>%killer%
echo @echo off>>%killer%
echo @chcp 1251 ^>nul >>%killer%
echo powershell -nop -ex Bypass -c "[ScriptBlock]::Create((gc '%%~0') -join [Char]10).Invoke()">>%killer%
echo ^title kill Unlocker>>%killer%
echo :1 >>%killer%
echo ^mode con cols=48 lines=20>>%killer%
echo cls >>%killer%
echo echo Нажмите любую кнопку для разблокировки процесса unlocker.exe >>%killer%
echo echo Как программа начнёт очищать реестр, это окно   можно будет закрыть >>%killer%
echo pause ^>nul >>%killer%
echo echo. >>%killer%
echo echo unlocker killed >>%killer%
echo taskkill.exe /im "Unlocker.exe" /f ^>nul 2^>^&1 >>%killer%
echo goto 1 >>%killer%
echo #^> >>%killer%
echo $setTOP = @' >>%killer%
echo [DllImport("user32.dll")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags); >>%killer%
echo '@ >>%killer%
echo (Add-Type -MemberDefinition $setTOP -name WinApiCall -passthru)::SetWindowPos((ps cmd^|Sort StartTime^|Select -Last 1).MainWindowHandle,-1,1200,0,0,67,0x4000) >>%killer%
)
ping -n 2 127.0.0.1>nul
start "" "kill Unlocker.cmd"
taskkill.exe /im "SearchApp.exe" /f >nul 2>&1 
for /f "usebackq tokens=2 delims==" %%i in (`wmic.exe LogicalDisk where "Name='c:'" get FreeSpace /value`) do set sFreeSize=%%i
if defined sFreeSize (set sFreeSizePseudoMb=%sFreeSize:~0,-7%)
powershell -command "Get-AppxPackage -AllUsers *edge* | Remove-AppxPackage -AllUsers -ErrorAction Continue">nul 2>&1 && echo ok
powershell -command "Get-AppxPackage *edge* | Remove-AppxPackage -ErrorAction Continue">nul 2>&1 && echo ok
powershell -command "Get-AppxPackage *edge* | Remove-AppxPackage" >nul 2>&1 && echo ok
:SystemApps
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Windows\SystemApps" ^| findstr /ic:"edge"') DO rd /q /s "C:\Windows\SystemApps\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Windows\SystemApps" ^| findstr /ic:"edge"') DO del /q /s "C:\Windows\SystemApps\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Windows\SystemApps" ^| findstr /ic:"edge"') DO "Unlocker.exe"  "C:\Windows\SystemApps\%%i" >nul 2>&1 && echo ok
taskkill.exe /im "Unlocker.exe" /f >nul 2>&1 & taskkill.exe /im "SearchApp.exe" /f >nul 2>&1  
dir /b "C:\Windows\SystemApps" | findstr /ic:"edge"
if %errorlevel%==0 goto SystemApps
taskkill.exe /im "Unlocker.exe" /f >nul 2>&1 & taskkill.exe /im "SearchApp.exe" /f >nul 2>&1  
:Program Files\WindowsApps
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps" ^| findstr /ic:"Edge"') DO rd /q /s  "C:\Program Files\WindowsApps\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps" ^| findstr /ic:"Edge"') DO del /q /s  "C:\Program Files\WindowsApps\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps\Deleted" ^| findstr /ic:"Edge"') DO rd /q /s  "C:\Program Files\WindowsApps\Deleted\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps\Deleted" ^| findstr /ic:"Edge"') DO del /q /s  "C:\Program Files\WindowsApps\Deleted\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps\DeletedAllUserPackages" ^| findstr /ic:"Edge"') DO rd /q /s  "C:\Program Files\WindowsApps\DeletedAllUserPackages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps\DeletedAllUserPackages" ^| findstr /ic:"Edge"') DO del /q /s  "C:\Program Files\WindowsApps\DeletedAllUserPackages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps" ^| findstr /ic:"Edge"') DO "Unlocker.exe"  "C:\Program Files\WindowsApps\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps\Deleted" ^| findstr /ic:"Edge"') DO "Unlocker.exe"  "C:\Program Files\WindowsApps\Deleted\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps\DeletedAllUserPackages" ^| findstr /ic:"Edge"') DO "Unlocker.exe"  "C:\Program Files\WindowsApps\DeletedAllUserPackages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps" ^|findstr /ic:"Microsoft.LanguageExperiencePack"') DO (
for  /f "delims=" %%k IN ('2^>nul dir /b /s "C:\Program Files\WindowsApps\%%i" ^|findstr /ic:"Edge"') DO (
rd /q /s "%%k" && echo ok
))
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps" ^|findstr /ic:"Microsoft.LanguageExperiencePack"') DO (
for  /f "delims=" %%k IN ('2^>nul dir /b /s "C:\Program Files\WindowsApps\%%i" ^|findstr /ic:"Edge"') DO (
del /q /s "%%k" && echo ok
))
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files\WindowsApps" ^|findstr /ic:"Microsoft.LanguageExperiencePack"') DO (
for  /f "delims=" %%k IN ('2^>nul dir /b /s "C:\Program Files\WindowsApps\%%i" ^|findstr /ic:"Edge"') DO (
"Unlocker.exe" "%%k" && echo ok
))
taskkill.exe /im "Unlocker.exe" /f >nul 2>&1 & taskkill.exe /im "SearchApp.exe" /f >nul 2>&1  
dir /b "C:\Program Files\WindowsApps" | findstr /ic:"edge"
dir /b "C:\Program Files\WindowsApps\Deleted" | findstr /ic:"edge"
dir /b "C:\Program Files\WindowsApps\DeletedAllUserPackages" | findstr /ic:"edge"
if %errorlevel%==0 goto Program Files\WindowsApps
cls & echo %info1% & echo %info2%
:Microsoft\WindowsApps
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Microsoft\WindowsApps" ^| findstr /ic:"edge"') DO "Unlocker.exe"  "%userprofile%\appdata\Local\Microsoft\WindowsApps\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Microsoft\WindowsApps" ^| findstr /ic:"edge"') DO rd /q /s  "%userprofile%\appdata\Local\Microsoft\WindowsApps\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Microsoft\WindowsApps" ^| findstr /ic:"edge"') DO del /q /s  "%userprofile%\appdata\Local\Microsoft\WindowsApps\%%i" >nul 2>&1 && echo ok
taskkill.exe /im "Unlocker.exe" /f >nul 2>&1 & taskkill.exe /im "SearchApp.exe" /f >nul 2>&1  
ping -n 5 127.0.0.1>nul 
dir /b "%userprofile%\appdata\Local\Microsoft\WindowsApps" | findstr /ic:"edge"
if %errorlevel%==0 goto Microsoft\WindowsApps
cls & echo %info1% & echo %info2%
:Local\Packages
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Packages" ^| findstr /ic:"Edge"') DO "Unlocker.exe"  "%userprofile%\appdata\Local\Packages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Packages" ^| findstr /ic:"Edge"') DO rd /q /s "%userprofile%\appdata\Local\Packages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Packages" ^| findstr /ic:"Edge"') DO rd /q /s "%userprofile%\appdata\Local\Packages\%%i" >nul 2>&1 && echo ok
taskkill.exe /im "Unlocker.exe" /f >nul 2>&1 & taskkill.exe /im "SearchApp.exe" /f >nul 2>&1  
dir /b "%userprofile%\appdata\Local\Packages" | findstr /ic:"edge"
if %errorlevel%==0 goto Local\Packages
cls & echo %info1% & echo %info2%
:AppRepository\Packages
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\ProgramData\Microsoft\Windows\AppRepository\Packages" ^| findstr /ic:"Edge"') DO "Unlocker.exe"  "C:\ProgramData\Microsoft\Windows\AppRepository\Packages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\ProgramData\Microsoft\Windows\AppRepository\Packages" ^| findstr /ic:"Edge"') DO rd /q /s  "C:\ProgramData\Microsoft\Windows\AppRepository\Packages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\ProgramData\Microsoft\Windows\AppRepository\Packages" ^| findstr /ic:"Edge"') DO del /q /s  "C:\ProgramData\Microsoft\Windows\AppRepository\Packages\%%i" >nul 2>&1 && echo ok
taskkill.exe /im "Unlocker.exe" /f >nul 2>&1 & taskkill.exe /im "SearchApp.exe" /f >nul 2>&1  
dir /b "C:\ProgramData\Microsoft\Windows\AppRepository\Packages" | findstr /ic:"edge"
if %errorlevel%==0 goto AppRepository\Packages
cls & echo %info1% & echo %info2%

:WinSxS\Manifests
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\WinSxS\Manifests" ^| findstr /ic:"edge"') DO rd /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\WinSxS\Manifests" ^| findstr /ic:"edge"') DO del /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\WinSxS\Manifests" ^| findstr /ic:"edge"') DO "Unlocker.exe"  "%%i" >nul 2>&1 && echo ok
taskkill.exe /im "Unlocker.exe" /f >nul 2>&1 & taskkill.exe /im "SearchApp.exe" /f >nul 2>&1  
dir /b /s "C:\Windows\WinSxS\Manifests" | findstr /ic:"edge"
if %errorlevel%==0 goto WinSxS\Manifests
cls & echo %info1% & echo %info2%
:WinSxS\FileMaps
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\WinSxS\FileMaps" ^| findstr /ic:"edge"') DO rd /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\WinSxS\FileMaps" ^| findstr /ic:"edge"') DO del /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\WinSxS\FileMaps" ^| findstr /ic:"edge"') DO "Unlocker.exe"  "%%i" >nul 2>&1 && echo ok
taskkill.exe /im "Unlocker.exe" /f >nul 2>&1 & taskkill.exe /im "SearchApp.exe" /f >nul 2>&1  
dir /b /s "C:\Windows\WinSxS\FileMaps" | findstr /ic:"edge"
if %errorlevel%==0 goto WinSxS\FileMaps
cls & echo %info1% & echo %info2%
:WinSxS
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Windows\WinSxS" ^| findstr /ic:"edge"') DO rd /q /s "C:\Windows\WinSxS\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\WinSxS" ^| findstr /ic:"edge"') DO del /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\WinSxS" ^| findstr /ic:"edge"') DO "Unlocker.exe"  "%%i" >nul 2>&1 && echo ok
taskkill.exe /im "Unlocker.exe" /f >nul 2>&1 & taskkill.exe /im "SearchApp.exe" /f >nul 2>&1  
dir /b "C:\Windows\WinSxS" | findstr /ic:"edge"
if %errorlevel%==0 goto WinSxS
cls & echo %info1% & echo %info2%
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Packages\*edge*" ^| findstr /ic:"Microsoft.Edge"') DO "Unlocker.exe"  "%userprofile%\appdata\Local\Packages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Packages\*edge*" ^| findstr /ic:"Microsoft.Edge"') DO rd /q /s  "%userprofile%\appdata\Local\Packages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Packages\*edge*" ^| findstr /ic:"Microsoft.Edge"') DO del /q /s  "%userprofile%\appdata\Local\Packages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "%userprofile%\appdata\LocalLow\*edge*" ^| findstr /ic:"Microsoft"') DO "Unlocker.exe"  "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "%userprofile%\appdata\LocalLow\*edge*" ^| findstr /ic:"Microsoft"') DO rd /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "%userprofile%\appdata\LocalLow\*edge*" ^| findstr /ic:"Microsoft"') DO del /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Packages\*edge*" ^| findstr /ic:"Microsoft.Edge"') DO "Unlocker.exe"  "%userprofile%\appdata\Local\Packages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Packages\*edge*" ^| findstr /ic:"Microsoft.Edge"') DO rd /q /s "%userprofile%\appdata\Local\Packages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\appdata\Local\Packages\*edge*" ^| findstr /ic:"Microsoft.Edge"') DO del /q /s "%userprofile%\appdata\Local\Packages\%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "%userprofile%\appdata\Roaming\*edge*" ^| findstr /ic:"Microsoft"') DO "Unlocker.exe"  "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "%userprofile%\appdata\Roaming\*edge*" ^| findstr /ic:"Microsoft"') DO rd /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "%userprofile%\appdata\Roaming\*edge*" ^| findstr /ic:"Microsoft"') DO del /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "%userprofile%\appdata\Local\Microsoft\*edge*" ^| findstr /ic:"Edge"') DO "Unlocker.exe"  "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "%userprofile%\appdata\Local\Microsoft\*edge*" ^| findstr /ic:"Edge"') DO rd /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "%userprofile%\appdata\Local\Microsoft\*edge*" ^| findstr /ic:"Edge"') DO del /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\PolicyDefinitions" ^| findstr /ic:"edge"') DO "Unlocker.exe"  "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\PolicyDefinitions" ^| findstr /ic:"edge"') DO rd /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\PolicyDefinitions" ^| findstr /ic:"edge"') DO del /q /s "%%i" >nul 2>&1 && echo ok
cls & echo %info1% & echo %info2%
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\Prefetch" ^| findstr /ic:"edge"') DO del /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\Prefetch" ^| findstr /ic:"edge"') DO "Unlocker.exe"  "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\Prefetch" ^| findstr /ic:"edge"') DO rd /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\SysWOW64" ^| findstr /ic:"edge"') DO del /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\SysWOW64" ^| findstr /ic:"edge"') DO "Unlocker.exe"  "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\SysWOW64" ^| findstr /ic:"edge"') DO rd /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Users\All Users" ^| findstr /ic:"edge"') DO del /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Users\All Users" ^| findstr /ic:"edge"') DO "Unlocker.exe"  "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Users\All Users" ^| findstr /ic:"edge"') DO rd /q /s "%%i" >nul 2>&1 && echo ok
:SystemResources
cls & echo %info1% & echo %info2%
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\SystemResources" ^| findstr /ic:"edge"') DO "Unlocker.exe"  "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\SystemResources" ^| findstr /ic:"edge"') DO del /q /s "%%i" >nul 2>&1 && echo ok
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows\SystemResources" ^| findstr /ic:"edge"') DO rd /q /s "%%i" >nul 2>&1 && echo ok
taskkill.exe /im "Unlocker.exe" /f >nul 2>&1 & taskkill.exe /im "SearchApp.exe" /f >nul 2>&1  
dir /b /s "C:\Windows\SystemResources" | findstr /ic:"edge">nul 2>&1 && echo ok
if %errorlevel%==0 goto SystemResources
cls & echo %info1% & echo %info2%

for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files (x86)\Microsoft\*"') DO "Unlocker.exe"  "C:\Program Files (x86)\Microsoft\%%i"
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\Program Files (x86)\Microsoft\*"') DO rd /q /s "C:\Program Files (x86)\Microsoft\%%i"
for  /f "delims=" %%i IN ('2^>nul dir /b "C:\ProgramData\Microsoft\" ^| findstr /ic:"edge"') DO rd /q /s "C:\ProgramData\Microsoft\%%i"
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Users\All Users\Microsoft\" ^| findstr /ic:"edge"') DO rd /q /s "%%i"
for  /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Users\All Users\Microsoft\" ^| findstr /ic:"edge"') DO del /q /s "%%i"
cls & echo %info1% & echo %info2%
ping -n 3 127.0.0.1>nul
echo.>"C:\Program Files (x86)\Microsoft\Edge"
echo.>"C:\Program Files (x86)\Microsoft\EdgeCore"
echo.>"C:\Program Files (x86)\Microsoft\EdgeUpdate"
echo.>"C:\Program Files (x86)\Microsoft\EdgeWebView"
echo.>"C:\Program Files (x86)\Microsoft\Temp"
echo.>"C:\ProgramData\Microsoft\EdgeUpdate"
echo.>"C:\Users\All Users\Microsoft\EdgeUpdate"
for /f "delims=" %%i in ('2^>nul dir /b /s "C:\Windows\System32" ^| findstr /ic:"edge"') do (findstr /ic:"%%~nxi" "%exceptions%">nul 2>&1 || del /q /s "%%~i" >nul 2>&1 && echo ok)
for /f "delims=" %%i in ('2^>nul dir /b /s "C:\Windows\System32" ^| findstr /ic:"edge"') do (findstr /ic:"%%~nxi" "%exceptions%">nul 2>&1 || rd /q /s /s "%%~i" >nul 2>&1 && echo ok)
for /f "delims=" %%i in ('2^>nul dir /b /s "C:\Windows\System32" ^| findstr /ic:"edge"') do (findstr /ic:"%%~nxi" "%exceptions%">nul 2>&1 || "Unlocker.exe" "%%~i" >nul 2>&1 && echo ok)
for /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows" ^| findstr /ic:"edge"') do (findstr /ic:"%%~nxi" "%exceptions%">nul 2>&1 || "Unlocker.exe" "%%~i" >nul 2>&1 && echo ok)
for /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows" ^| findstr /ic:"edge"') do (findstr /ic:"%%~nxi" "%exceptions%">nul 2>&1 || rd /q /s "%%~i" >nul 2>&1 && echo ok)
for /f "delims=" %%i IN ('2^>nul dir /b /s "C:\Windows" ^| findstr /ic:"edge"') do (findstr /ic:"%%~nxi" "%exceptions%">nul 2>&1 || del /q /s "%%~i" >nul 2>&1 && echo ok)
for  /f "delims=" %%i IN ('2^>nul dir /b "%userprofile%\desktop\*edge*" ^| findstr /ic:"Microsoft Edge."') DO del /q /s "%userprofile%\desktop\%%i" >nul 2>&1 && echo ok
taskkill.exe /im "Unlocker.exe" /f >nul 2>&1 & taskkill.exe /im "SearchApp.exe" /f >nul 2>&1  
taskkill.exe /fi "WINDOWTITLE eq Kill Unlocker" /f >nul 2>&1
del /q %killer% >nul 2>&1 
for /f "usebackq tokens=2 delims==" %%i in (`wmic.exe LogicalDisk where "Name='c:'" get FreeSpace /value`) do set sFreeSize=%%i
if defined sFreeSize (set sFreeSizePseudoMb1=%sFreeSize:~0,-7%)
set /a Freed=!sFreeSizePseudoMb1! - !sFreeSizePseudoMb!
cls
echo.
Echo.    !Freed!  мегабайт освобождено
Echo.
Echo Подождите...
del /q /s "exceptions.ini" >nul 2>&1
dir /b /s "C:\" | findstr /ic:"edge">"C:\after.txt"
fc /b "C:\before.txt" "C:\after.txt"  >nul 2>&1
if %errorlevel%==0 (
cls
Echo Скорее всего вы уже применяли этот твик
Echo Подождите...
ping -n 6 127.0.0.1>nul 
)
cls
taskkill.exe /fi "WINDOWTITLE eq Kill Unlocker" /f >nul 2>&1
Echo Идёт зачистка реестра, нужно просто подождать!
echo %info1%
ping -n 3 127.0.0.1>nul 
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_USERS\%sidinf%\SOFTWARE\Classes" /f "*"') DO (
REG QUERY "%%i\Application" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_USERS\%sidinf%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Mappings" /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_USERS\%sidinf%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage" /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_USERS\%sidinf%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Families" /f "*"') DO (
reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Families" /f "edge"') DO (
reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_USERS\%sidinf%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages" /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages" /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_USERS\%sidinf%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel" /s /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel" /s /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_USERS\%sidinf%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages" /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages" /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_USERS\%sidinf%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages" /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages" /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_USERS\%sidinf%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages" /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages" /f "*"') DO (
REG QUERY "%%i" /f "edge" >nul 2>&1
if !errorlevel! == 0 reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Classes" /f "MSEdge*"') DO (
reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Classes" /f "Edge*"') DO (
reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Classes" /f ".*"') DO ( 
REG QUERY "%%i" /s /f "edge" >nul 2>&1 
if !errorlevel! == 0 ( 
for /F "usebackq delims=" %%y In (`2^>nul REG QUERY "%%i" /f "MSEdge*" /k`) Do ( 
for /F "usebackq tokens=1" %%a IN (`2^>nul REG QUERY "%%i" /s ^| findstr /ic:"edge"`) DO (reg delete "%%i\OpenWithProgIds" /v "%%a" /f >nul 2>&1 && echo ok) 
)))
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet" /f "Edge*"') DO (
reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components" /s /f "Microsoft Edge"') DO (
reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft" /f "*Edge"') DO (
reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer" /f "*Edge"') DO (
reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main" /s /f "*Edge"') DO (
reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\ProtocolExecute" /s /f "*Edge"') DO (
reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for  /f "delims=" %%i IN ('2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MediaPlayer\ShimInclusionList" /s /f "*Edge"') DO (
reg delete "%%i" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\EnterpriseMode" /s ^| findstr /ic:"edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion" /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths" /s /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\EnterpriseMode" /s ^| findstr /ic:"edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\RegisteredApplications" /s /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=1" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\EnterpriseMode" /s ^| findstr /ic:"edge"`) DO (
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\EnterpriseMode" /v "%%a" /f
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Clients\StartMenuInternet" /s /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft" /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Low Rights\ElevationPolicy" /s /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\ProtocolExecute" /s /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\App Paths" /s /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application" /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MicrosoftEdgeElevationService" /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\ProtocolExecute" /s /f "*Edge"`) DO (
reg delete "%%a" /f  >nul 2>&1 && echo ok
)
REM for /F "usebackq tokens=*" %%a IN (`2^>nul REG QUERY "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /s /f "Microsoft.MicrosoftEdge_8wekyb3d8bbwe"`) DO (
REM reg delete "%%a" /f  >nul 2>&1 && echo ok
REM )
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /v "{29647474-E788-474B-B47A-E1322527A818}" /f >nul 2>&1 && echo ok
Reg.exe add "HKEY_USERS\%sidinf%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d "00a80100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1200000035f2e4a647cbd8013e5876ed47cbd8016ecd9f0fbdd0d801140056003100000000003955624711005461736b42617200400009000400efbe32554052395562472e000000c5910100000004000000000000000000000000000000926e2e005400610073006b00420061007200000016001601320097010000874f0749200046494c4545587e322e4c4e4b0000840009000400efbe39556247395562472e000000639b00000000020000000000000000005a0000000000589c4400460069006c00650020004500780070006c006f0072006500720020002800320029002e006c006e006b00000040007300680065006c006c00330032002e0064006c006c002c002d003200320030003600370000001c00120000002b00efbe1428a20fbdd0d8011c00420000001d00efbe02004d006900630072006f0073006f00660074002e00570069006e0064006f00770073002e004500780070006c006f0072006500720000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c000000ff" /f >nul 2>&1 && echo ok
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v "Favorites" /t REG_BINARY /d "00a80100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe1200000035f2e4a647cbd8013e5876ed47cbd8016ecd9f0fbdd0d801140056003100000000003955624711005461736b42617200400009000400efbe32554052395562472e000000c5910100000004000000000000000000000000000000926e2e005400610073006b00420061007200000016001601320097010000874f0749200046494c4545587e322e4c4e4b0000840009000400efbe39556247395562472e000000639b00000000020000000000000000005a0000000000589c4400460069006c00650020004500780070006c006f0072006500720020002800320029002e006c006e006b00000040007300680065006c006c00330032002e0064006c006c002c002d003200320030003600370000001c00120000002b00efbe1428a20fbdd0d8011c00420000001d00efbe02004d006900630072006f0073006f00660074002e00570069006e0064006f00770073002e004500780070006c006f0072006500720000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c000000ff" /f >nul 2>&1 && echo ok
Reg.exe delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /f>nul 2>&1 && echo ok
Reg.exe delete "HKEY_USERS\%sidinf%\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" /f>nul 2>&1 && echo ok
Reg.exe delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies\Ext\CLSID" /v "{1FD49718-1D00-4B19-AF5F-070AF6D5D54C}" /f >nul 2>&1 && echo ok


for /F "usebackq tokens=1" %%a IN (`2^>nul REG QUERY "HKEY_USERS\%sidinf%\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /s ^| findstr /ic:"MSedge"`) DO (
reg delete "HKEY_USERS\%sidinf%\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "%%a" /f  >nul 2>&1 && echo ok
)
for /F "usebackq tokens=1" %%a IN (`2^>nul REG QUERY "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /s ^| findstr /ic:"MSedge"`) DO (
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "%%a" /f  >nul 2>&1 && echo ok
)
cls
Echo Реестр очищен
ping -n 5 127.0.0.1>nul 
cls
echo Удаление заданий в планировщике
SchTasks /Delete /TN "\MicrosoftEdgeUpdateTaskMachineCore" /F >nul 2>&1 & echo ok
SchTasks /Delete /TN "\MicrosoftEdgeUpdateTaskMachineUA" /F >nul 2>&1 & echo ok
echo Задания удалены
echo.
ping -n 5 127.0.0.1>nul 
echo Удаление служб
sc delete edgeupdatem >nul 2>&1 && echo ok
sc delete edgeupdate >nul 2>&1 && echo ok
sc delete WarpJITSvc >nul 2>&1 && echo ok
sc delete MicrosoftEdgeElevationService >nul 2>&1 && echo ok
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\edgeupdate" /f >nul 2>&1 && echo ok
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\edgeupdatem" /f >nul 2>&1 && echo ok
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WarpJITSvc" /f >nul 2>&1 && echo ok
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MicrosoftEdgeElevationService" /f >nul 2>&1 && echo ok
echo Службы удалены
echo.
ping -n 5 127.0.0.1>nul 
echo.
echo Возвращаем просмотр txt файлов по умолчанию 
Reg.exe add "HKEY_USERS\%sidinf%\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "Applications\WordPad.exe_.txt" /t REG_DWORD /d "0x0" /f>nul 2>&1 && echo ok
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "Applications\WordPad.exe_.txt" /t REG_DWORD /d "0x0" /f>nul 2>&1 && echo ok
Reg.exe add "HKEY_USERS\%sidinf%\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "Applications\notepad.exe_.txt" /t REG_DWORD /d "0x0" /f>nul 2>&1 && echo ok
Reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "Applications\notepad.exe_.txt" /t REG_DWORD /d "0x0" /f>nul 2>&1 && echo ok
echo.
echo Отключаем обновления
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d "0x0" /f >nul 2>&1 && echo ok
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SleepingTabsEnabled" /t REG_DWORD /d "0x0" /f >nul 2>&1 && echo ok
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d "0x0" /f >nul 2>&1 && echo ok
echo Обновления отключены
REM Очистка кэша иконок и эскизов 
taskkill /im explorer.exe /f>nul 2>&1
ping -n 2 127.0.0.1>nul
del /q /a "%userprofile%\AppData\Local\IconCache.db" >nul 2>&1
del /q /a /s "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*.db" >nul 2>&1
ping -n 2 127.0.0.1>nul
start explorer.exe
ping -n 5 127.0.0.1>nul 
echo.
echo.
:Finish
Echo Удаление Microsoft Edge завершено
Echo Автор программы:En32
echo.
echo  Хотите перезагрузить компьютер сейчас?
echo  1.Да
echo  2.Нет, выход из программы
choice /c 12 /n /m "Введите цифру:"
if errorlevel 2 exit
if errorlevel 1 shutdown /r /t 0
exit /b






:EchoColor [text] [color]
powershell "'%~1'.GetEnumerator()|%%{Write-Host $_ -NoNewline -ForegroundColor %~2}"
exit /B
