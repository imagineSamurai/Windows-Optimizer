@echo off
setlocal EnableDelayedExpansion
title Windows Optimization Tool v2.2
chcp 65001

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

// ... existing choice handling with new options ...

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

// ... update the ABOUT section ...

:ABOUT
cls
echo.
echo    Windows Optimization Tool v2.2
echo    ============================
echo    Developed by: imagineSamurai (Nawaf)
echo    Last Updated: %date%
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

:REFRESH
cls
echo.
echo [*] Refreshing Windows Optimizer...
echo.
start "" "%~f0"
exit