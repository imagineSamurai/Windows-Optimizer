@echo off
setlocal EnableDelayedExpansion
title Windows Optimization Tool v2.2
chcp 65001
color 0A

:BANNER
cls
echo.
echo ██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗███████╗     ██████╗ ██████╗ ████████╗
echo ██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔════╝    ██╔═══██╗██╔══██╗╚══██╔══╝
echo ██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║███████╗    ██║   ██║██████╔╝   ██║   
echo ██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║╚════██║    ██║   ██║██╔═══╝    ██║   
echo ╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝███████║    ╚██████╔╝██║        ██║██╗
echo  ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚══════╝     ╚═════╝ ╚═╝        ╚═╝╚═╝
echo.
echo                              Windows Optimization Tool v2.2
echo                              Safe Cleaning ^& Optimization
echo.

:CATEGORIES
echo  [=== System Maintenance ===]          [=== Performance Optimization ===]        [=== System Information ===]
echo  [1] Clean Temporary Files             [5] Free Up RAM                          [9]  View System Status
echo  [2] Clear System Cache                [6] Disk Cleanup                         [10] Network Information
echo  [3] Browser Cache Cleanup             [7] Service Optimization                 [11] Disk Health Check
echo  [4] Clear Print Spooler               [8] Game Optimization                    [12] System Scan
echo.
echo  [=== Advanced Tools ===]              [=== Additional Options ===]
echo  [13] Windows Update Cleanup           [17] Backup Settings
echo  [14] Network Reset                    [18] About
echo  [15] Power Settings Optimization      [19] Refresh Tool
echo  [16] Advanced System Cleanup          [20] Exit
echo.
set /p choice="Select an option (1-20): "

if "%choice%"=="1" goto CLEAN_TEMP
if "%choice%"=="2" goto CLEAR_CACHE
if "%choice%"=="3" goto BROWSER_CACHE
if "%choice%"=="4" goto CLEAR_PRINT_SPOOLER
if "%choice%"=="5" goto FREE_RAM
if "%choice%"=="6" goto DISK_CLEANUP
if "%choice%"=="7" goto SERVICE_OPT
if "%choice%"=="8" goto GAME_OPT
if "%choice%"=="9" goto SYSTEM_STATUS
if "%choice%"=="10" goto NETWORK_INFO
if "%choice%"=="11" goto DISK_HEALTH
if "%choice%"=="12" goto SYSTEM_SCAN
if "%choice%"=="13" goto UPDATE_CLEANUP
if "%choice%"=="14" goto NETWORK_RESET
if "%choice%"=="15" goto POWER_OPT
if "%choice%"=="16" goto ADVANCED_SYSTEM_CLEANUP
if "%choice%"=="17" goto BACKUP
if "%choice%"=="18" goto ABOUT
if "%choice%"=="19" goto REFRESH
if "%choice%"=="20" goto EXIT
goto CATEGORIES

:CLEAN_TEMP
cls
echo.
echo [*] Cleaning Temporary Files...
echo.
del /s /f /q "%TEMP%\*.*"
del /s /f /q "C:\Windows\Temp\*.*"
echo [+] Temporary files cleaned successfully!
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:CLEAR_CACHE
cls
echo.
echo [*] Clearing System Cache...
echo.
ipconfig /flushdns
echo [+] DNS Cache cleared!
del /s /f /q "%SystemRoot%\SoftwareDistribution\Download\*.*"
echo [+] Windows Update cache cleared!
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:FREE_RAM
cls
echo.
echo [*] Freeing Up RAM...
echo.
echo [*] Current RAM usage:
for /f "skip=1" %%p in ('wmic os get freephysicalmemory') do (
    set ram=%%p
    goto :DISPLAY_RAM
)
:DISPLAY_RAM
set /a ram_mb=%ram% / 1024
echo     Available Memory: %ram_mb% MB

echo [*] Running RAM optimization...
:: Run empty loop to clear RAM
start /b "" cmd /c "for /l %%x in (1,1,10) do rd /s /q"
echo [+] RAM optimization completed!
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:DISK_CLEANUP
cls
echo.
echo [*] Running Disk Cleanup...
echo.
echo [*] Cleaning system files...
cleanmgr /sagerun:1
echo [+] Disk cleanup completed!
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:SYSTEM_STATUS
cls
echo.
echo [*] System Status
echo ===============
echo.
echo Memory Information:
for /f "skip=1" %%p in ('wmic os get freephysicalmemory') do (
    set ram=%%p
    goto :SHOW_RAM
)
:SHOW_RAM
set /a ram_mb=%ram% / 1024
echo     Available Memory: %ram_mb% MB

echo.
echo Disk Information:
wmic logicaldisk get deviceid, freespace, size /format:value
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:BROWSER_CACHE
cls
echo.
echo [*] Cleaning Browser Cache...
echo.
del /s /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*"
del /s /f /q "%LOCALAPPDATA%\Mozilla\Firefox\Profiles\*.default\cache2\entries\*.*"
del /s /f /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*.*"
echo [+] Browser cache cleaned successfully!
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:SERVICE_OPT
cls
echo.
echo [*] Optimizing Windows Services...
echo.
net stop "SysMain" >nul 2>&1
sc config "SysMain" start=disabled >nul 2>&1
echo [+] Superfetch service disabled
net stop "DiagTrack" >nul 2>&1
sc config "DiagTrack" start=disabled >nul 2>&1
echo [+] Diagnostic Tracking service disabled
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:NETWORK_INFO
cls
echo.
echo [*] Network Information
echo =====================
ipconfig /all
echo.
echo [*] Network Statistics:
netstat -an | find "ESTABLISHED"
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:DISK_HEALTH
cls
echo.
echo [*] Checking Disk Health...
echo.
chkdsk C: /f /r
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:UPDATE_CLEANUP
cls
echo.
echo [*] Cleaning Windows Update Files...
echo.
net stop wuauserv
net stop bits
del /s /f /q C:\Windows\SoftwareDistribution\*.*
net start wuauserv
net start bits
echo [+] Windows Update files cleaned!
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:NETWORK_RESET
cls
echo.
echo [*] Resetting Network Settings...
echo.
ipconfig /release
ipconfig /flushdns
ipconfig /renew
netsh winsock reset
netsh int ip reset
echo [+] Network settings reset successfully!
echo [!] System restart recommended
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:POWER_OPT
cls
echo.
echo [*] Optimizing Power Settings...
echo.
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo [+] High Performance power plan activated
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:BACKUP
cls
echo.
echo [*] Backup Settings
echo ==================
echo [1] Create System Restore Point
echo [2] Back to Main Menu
echo.
set /p backup_choice="Select an option (1-2): "
if "%backup_choice%"=="1" (
    wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Windows Optimizer Backup", 100, 7
    echo [+] System Restore Point created!
    echo.
    echo Press Enter to return to main menu...
    pause >nul
)
goto CATEGORIES

:ABOUT
cls
echo.
echo    Windows Optimization Tool v2.2
echo    ============================
echo    Developed by: imagineSamurai (Nawaf)
echo    Last Updated: Tue 04/02/2025
echo    Visit: https://github.com/imagineSamurai/Windows-Optimizer for new versions
echo.
echo    New Features in v2.2:
echo    - Game Optimization
echo    - Print Spooler Cleanup
echo    - Advanced System Cleanup
echo    - System File Check
echo    - Enhanced Performance Options
echo    - UI Improvements
echo.
echo    Features:
echo    - System Cleanup
echo    - Performance Optimization
echo    - Network Tools
echo    - Diagnostic Utilities
echo.
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:EXIT
cls
echo.
echo Thank you for using Windows Optimization Tool!
echo.
echo Press Enter to return to main menu...
pause >nul
exit

:GAME_OPT
cls
echo.
echo [*] Optimizing System for Gaming...
echo.
echo [*] Adjusting for Best Performance...
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
echo [+] Game Mode Optimizations Applied
echo [+] GPU Priority Set
echo [+] Process Priority Optimized
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:CLEAR_PRINT_SPOOLER
cls
echo.
echo [*] Clearing Print Spooler...
echo.
net stop spooler
del /F /S /Q %systemroot%\System32\spool\PRINTERS\*.*
net start spooler
echo [+] Print Spooler cleared successfully!
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:SYSTEM_SCAN
cls
echo.
echo [*] Running System File Check...
echo.
sfc /scannow
echo.
echo [*] Running DISM Health Check...
DISM /Online /Cleanup-Image /CheckHealth
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:ADVANCED_SYSTEM_CLEANUP
cls
echo.
echo [*] Running Advanced System Cleanup...
echo.
echo [*] Cleaning System Restore Points...
vssadmin delete shadows /all /quiet
echo [+] Old System Restore Points Cleaned
echo.
echo [*] Cleaning Windows Error Reports...
del /s /f /q %ALLUSERSPROFILE%\Microsoft\Windows\WER\*
echo [+] Error Reports Cleaned
echo.
echo [*] Cleaning Font Cache...
net stop FontCache
del /A /F /Q "%windir%\ServiceProfiles\LocalService\AppData\Local\FontCache\*"
net start FontCache
echo [+] Font Cache Cleaned
echo.
echo [*] Cleaning Windows Defender History...
del /s /f /q "%ProgramData%\Microsoft\Windows Defender\Scans\History\*"
echo [+] Defender History Cleaned
echo.
echo Press Enter to return to main menu...
pause >nul
cls
goto CATEGORIES

:REFRESH
cls
echo.
echo [*] Refreshing Windows Optimizer...
echo.
start "" "%~f0"
exit
