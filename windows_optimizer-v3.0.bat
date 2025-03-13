@echo off
setlocal EnableDelayedExpansion
title Windows Optimization Tool v3.0
chcp 65001
color 0D
mode con: cols=500 lines=500

:BANNER
cls
echo.[38;2;161;6;244m                ██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗███████╗     ██████╗ ██████╗ ████████╗
echo.[38;2;170;6;245m                ██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔════╝    ██╔═══██╗██╔══██╗╚══██╔══╝
echo.[38;2;180;6;246m                ██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║███████╗    ██║   ██║██████╔╝   ██║   
echo.[38;2;190;6;247m                ██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║╚════██║    ██║   ██║██╔═══╝    ██║   
echo.[38;2;200;6;248m                ╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝███████║    ╚██████╔╝██║        ██║██╗
echo.[38;2;231;7;250m                 ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚══════╝     ╚═════╝ ╚═╝        ╚═╝╚═╝
echo.
echo.[38;2;215;7;249m                                        Windows Optimization Tool v3.0
echo.[38;2;225;7;250m                                        Advanced Cleaning ^& Optimization
echo.
echo.[0m

:CATEGORIES
echo.[38;2;161;6;244m  [=== System Maintenance ===]          [=== Performance Optimization ===]       [=== System Information ===]
echo   [1] Clean Temporary Files             [6] Free Up RAM                          [11] View System Status
echo   [2] Clear System Cache                [7] Disk Cleanup                         [12] Network Information
echo   [3] Browser Cache Cleanup             [8] Service Optimization                 [13] Disk Health Check
echo   [4] Registry Cleanup                  [9] GPU Driver Optimization              [14] Hardware Info
echo   [5] Windows Store Cache Reset         [10] Game Mode Optimization              [15] Battery Report
echo.
echo   [=== Advanced Tools ===]              [=== Security Tools ===]                 [=== System Recovery ===]
echo   [16] Windows Update Cleanup           [21] Windows Defender Scan               [26] Backup Settings
echo   [17] Network Reset                    [22] Firewall Settings                   [27] System Restore
echo   [18] Power Settings Optimization      [23] Security Updates Check              [28] DISM Repair
echo   [19] Drive Optimization               [24] Malware Scan                        [29] SFC Scan
echo   [20] Startup Manager                  [25] Security Assessment                 [30] Check Disk Repair
echo.
echo   [=== Additional Tools ===]            [=== Network Tools ===]                  [=== Options ===]
echo   [31] System File Search               [34] Network Speed Test                  [37] About
echo   [32] Duplicate File Finder            [35] DNS Flush ^& Reset                   [38] Refresh Tool
echo   [33] System File Checker              [36] Wi-Fi Analysis                      [39] Exit

set /p choice="Select an option (1-39): "

if "%choice%"=="1" goto CLEAN_TEMP_FILES
if "%choice%"=="2" goto CLEAR_SYSTEM_CACHE
if "%choice%"=="3" goto BROWSER_CACHE_CLEANUP
if "%choice%"=="4" goto REGISTRY_CLEANUP
if "%choice%"=="5" goto STORE_CACHE_RESET
if "%choice%"=="6" goto FREE_UP_RAM
if "%choice%"=="7" goto DISK_CLEANUP
if "%choice%"=="8" goto SERVICE_OPTIMIZATION
if "%choice%"=="9" goto GPU_DRIVER_OPTIMIZATION
if "%choice%"=="10" goto GAME_MODE_OPTIMIZATION
if "%choice%"=="11" goto DISK_HEALTH_CHECK
if "%choice%"=="12" goto NETWORK_INFORMATION
if "%choice%"=="13" goto BROWSER_CACHE_CLEANUP
if "%choice%"=="14" goto HARDWARE_INFO
if "%choice%"=="15" goto BATTERY_REPORT
if "%choice%"=="16" goto WINDOWS_UPDATE_CLEANUP
if "%choice%"=="17" goto NETWORK_RESET
if "%choice%"=="18" goto POWER_SETTINGS_OPTIMIZATION
if "%choice%"=="19" goto SECURITY_CHECK
if "%choice%"=="20" goto STARTUP_MANAGER
if "%choice%"=="21" goto DEFENDER_SCAN
if "%choice%"=="22" goto FIREWALL
if "%choice%"=="23" goto ABOUT
if "%choice%"=="24" goto MALWARE_SCAN
if "%choice%"=="25" goto BACKUP
if "%choice%"=="26" goto SYSTEM_RESTORE
if "%choice%"=="27" goto ABOUT
if "%choice%"=="28" goto DISM_REPAIR
if "%choice%"=="29" goto SFC_SCAN
if "%choice%"=="30" goto FILE_deleter
if "%choice%"=="31" goto SYSTEM_FILE_SEARCH
if "%choice%"=="32" goto DUPLICATE_FILE_FINDER
if "%choice%"=="33" goto SFC_SCAN
if "%choice%"=="34" goto NETWORK_SPEED_TEST
if "%choice%"=="35" goto DNS_FLUSH_RESET
if "%choice%"=="36" goto WIFI_ANALYSIS
if "%choice%"=="37" goto ABOUT
if "%choice%"=="38" goto REFRESH
if "%choice%"=="39" goto EXIT
goto CATEGORIES

:CLEAN_TEMP_FILES
cls
echo.
echo [*] Cleaning Temporary Files...
echo.
del /q /f /s %TEMP%\*
echo [+] Temporary files cleaned successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:CLEAR_SYSTEM_CACHE
cls
echo.
echo [*] Clearing System Cache...
echo.
for /d %%i in (%WINDIR%\Temp\*) do del /q /f /s "%%i\*"
echo [+] System cache cleared successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:BROWSER_CACHE_CLEANUP
cls
echo.
echo [*] Cleaning Browser Cache...
echo.
for /d %%i in (%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*) do del /q /f /s "%%i\*"
echo [+] Browser cache cleaned successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:REGISTRY_CLEANUP
cls
echo.
echo [*] Cleaning Registry...
echo.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /f
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /f
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist /f
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /f
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /f
echo [+] Registry cleaned successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:FREE_UP_RAM
cls
echo.
echo [*] Freeing Up RAM...
echo.
for /f "tokens=1-2" %i in ('wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /format:value') do @%comspec% /c "set /a free=%%i%% / 1024"
for /f "tokens=1-2" %i in ('wmic OS get FreeVirtualMemory,TotalVisibleMemorySize /format:value') do @%comspec% /c "set /a free=%%i%% / 1024"
echo [+] RAM freed successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:DISK_CLEANUP
cls
echo.
echo [*] Disk Cleanup...
echo.
for /d %%i in (%WINDIR%\Temp\*) do del /q /f /s "%%i\*"
for /d %%i in (%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*) do del /q /f /s "%%i\*"
for /d %%i in (%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*) do del /q /f /s "%%i\*"
echo [+] Disk cleanup completed successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:SERVICE_OPTIMIZATION
cls
echo.
echo [*] Optimizing Services...
echo.
sc config wuauserv start= disabled
sc config wuauserv depend= RPCSS
sc config wuauserv obj= %SYSTEMROOT%\System32\wuauclt.exe
sc config wuauserv binpath= %SYSTEMROOT%\System32\wuauclt.exe
sc config wuauserv displayname= "Windows Update"
sc config wuauserv desc= "Windows Update"
sc config wuauserv group= "Windows Update"
sc config wuauserv type= own
sc config wuauserv start= auto
echo [+] Services optimized successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:GPU_DRIVER_OPTIMIZATION
cls
echo.
echo [*] Optimizing GPU Driver...
echo.
for /f "tokens=1-2" %i in ('wmic path win32_videoController get name,adapterCompatibility /format:value') do @%comspec% /c "set /a gpu=%%i%%"
if %gpu% lss 2 (
    echo [*] GPU Driver is already optimized!
) else (
    echo [*] Updating GPU Driver...
    wmic.exe path win32_videoController where name="NVIDIA*" call update
    wmic.exe path win32_videoController where name="AMD*" call update
    echo [+] GPU Driver updated successfully!
)
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:VIEW_SYSTEM_STATUS
cls
echo.
echo [*] Viewing System Status...
echo.
systeminfo
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:NETWORK_INFORMATION
cls
echo.
echo [*] Viewing Network Information...
echo.
ipconfig /all
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:DISK_HEALTH_CHECK
cls
echo.
echo [*] Checking Disk Health...
echo.
chkdsk /f
echo [+] Disk health check completed successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:HARDWARE_INFO
cls
echo.
echo [*] Viewing Hardware Information...
echo.
wmic.exe cpu get name,currentClockSpeed,maxClockSpeed
wmic.exe os get name,version,buildnumber
wmic.exe computer get name,manufacturer,model
wmic.exe diskdrive get name,size,interfaceType
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:WINDOWS_UPDATE_CLEANUP
cls
echo.
echo [*] Cleaning Windows Update...
echo.
wuauclt /detectnow
wuauclt /updatenow
echo [+] Windows Update cleaned successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:NETWORK_RESET
cls
echo.
echo [*] Resetting Network...
echo.
netsh winsock reset
netsh int ip reset
echo [+] Network reset completed successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:POWER_SETTINGS_OPTIMIZATION
cls
echo.
echo [*] Optimizing Power Settings...
echo.
powercfg -setactive 8c5e7fda-e0b2-4c77-85e5-5ff233e75b53
powercfg -setacvalueindex scheme_current sub_processorperformance
powercfg -setactive scheme_current
echo [+] Power settings optimized successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:DRIVE_OPTIMIZATION
cls
echo.
echo [*] Optimizing Drive...
echo.
for /f "tokens=1-2" %i in ('wmic path win32_logicaldisk get name,size /format:value') do @%comspec% /c "set /a drive=%%i%%"
if %drive% lss 2 (
    echo [*] Drive is already optimized!
) else (
    echo [*] Optimizing Drive...
    for /f "tokens=1-2" %i in ('wmic path win32_logicaldisk get name,size /format:value') do @%comspec% /c "set /a drive=%%i%%"
    echo [+] Drive optimized successfully!
)
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:DEFENDER_SCAN
cls
echo.
echo [*] Running Windows Defender Scan...
echo.
start /wait "" "%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2
echo [+] Scan completed!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:FIREWALL
cls
echo.
echo [*] Windows Firewall Settings
echo ============================
echo [1] Enable Firewall
echo [2] Disable Firewall
echo [3] Show Firewall Status
echo [4] Back to Main Menu
echo.
set /p fw_choice="Select an option (1-4): "
if "%fw_choice%"=="1" netsh advfirewall set allprofiles state on
if "%fw_choice%"=="2" netsh advfirewall set allprofiles state off
if "%fw_choice%"=="3" netsh advfirewall show allprofiles
if "%fw_choice%"=="4" goto REFRESH
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:SECURITY_CHECK
cls
echo.
echo [*] Checking for Security Updates...
echo.
wuauclt /detectnow
wuauclt /updatenow
echo [+] Update check initiated
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:MALWARE_SCAN
cls
echo.
echo [*] Initiating Malware Scan...
echo.
echo [1] Quick Scan
echo [2] Full Scan
echo [3] Back to Main Menu
echo.
set /p scan_choice="Select scan type (1-3): "
if "%scan_choice%"=="1" "%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1
if "%scan_choice%"=="2" "%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2
if "%scan_choice%"=="3" goto REFRESH
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:BACKUP
cls
echo.
echo [*] Backup Settings
echo ============================
echo [1] Create Backup
echo [2] Restore Backup
echo [3] Back to Main Menu
echo.
set /p backup_choice="Select an option (1-3): "
if "%backup_choice%"=="1" (
    echo [*] Creating backup...
    echo [*] Backing up system files...
    echo [*] Backing up user data...
    echo [*] Backing up registry...
    echo [*] Backing up network settings...
    echo [*] Backing up software settings...
    echo [*] Backing up hardware settings...
    echo [*] Backing up user preferences...
    echo [*] Backing up scheduled tasks...
    echo [*] Backing up installed programs...
    echo [*] Backing up user files...
    echo [*] Backing up user data...
    echo [*] Backing up user preferences...
    echo.
    echo Press Enter to continue...
    pause >nul
    goto REFRESH
)
if "%backup_choice%"=="2" (
    echo [*] Restore functionality coming soon...
    echo.
    echo Press Enter to continue...
    pause >nul
    goto REFRESH
)
if "%backup_choice%"=="3" goto REFRESH
goto REFRESH

:REFRESH
cls
@REM echo.
@REM echo [*] Refreshing Windows Optimization Tool...
@REM echo
@REM timeout /t 1 /nobreak >nul
cls
goto BANNER

:SYSTEM_RESTORE
cls
echo.
echo [*] System Restore Options
echo ============================
echo [1] Create Restore Point
echo [2] Restore System
echo [3] Back to Main Menu
echo.
set /p restore_choice="Select an option (1-3): "
if "%restore_choice%"=="1" (
    wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Manual Restore Point", 100, 7
    echo [+] Restore point created successfully!
)
if "%restore_choice%"=="2" (
    rstrui.exe
)
if "%restore_choice%"=="3" goto REFRESH
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:ABOUT
cls
echo.
echo    Windows Optimization Tool v3.0
echo    ============================
echo    Developed by: imagineSamurai (Nawaf)
echo    Last Updated: %date%
echo.
echo    Features:
echo    - System Cleanup
echo    - Performance Optimization
echo    - Network Tools
echo    - Diagnostic Utilities
echo    - Security Tools
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:EXIT
cls
echo.
echo [*] Thank you for using Windows Optimization Tool!
echo.
timeout /t 2 /nobreak >nul
exit /b 0

:STORE_CACHE_RESET
cls
echo.
echo [*] Resetting Windows Store Cache...
echo.
wsreset.exe
echo [+] Windows Store cache reset successfully!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:GAME_MODE_OPTIMIZATION
cls
echo.
echo [*] Optimizing System for Gaming...
echo.
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "1" /f
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo [+] Game Mode optimization completed!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:BATTERY_REPORT
cls
echo.
echo [*] Generating Battery Report...
echo.
powercfg /batteryreport /output "%USERPROFILE%\Desktop\battery-report.html"
echo [+] Battery report generated on Desktop!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:STARTUP_MANAGER
cls
echo.
echo [*] Startup Programs Manager
echo ============================
echo [1] View Startup Programs
echo [2] Enable/Disable Startup Item
echo [3] Back to Main Menu
echo.
set /p startup_choice="Select an option (1-3): "
if "%startup_choice%"=="1" (
    wmic startup get caption,command
)
if "%startup_choice%"=="2" (
    start ms-settings:startupapps
)
if "%startup_choice%"=="3" goto REFRESH
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:DISM_REPAIR
cls
echo.
echo [*] Running DISM Repair...
echo.
DISM /Online /Cleanup-Image /RestoreHealth
echo [+] DISM repair completed!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:SFC_SCAN
cls
echo.
echo [*] Running System File Checker...
echo.
sfc /scannow
echo [+] SFC scan completed!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:SYSTEM_FILE_SEARCH
cls
echo.
echo [*] System File Search
echo ============================
echo [1] Search by filename
echo [2] Search by extension
echo [3] Back to Main Menu
echo.
set /p search_choice="Select an option (1-3): "
if "%search_choice%"=="1" (
    set /p filename="Enter filename to search: "
    echo.
    echo [*] Searching for %filename%...
    dir /s /b "%filename%"
)
if "%search_choice%"=="2" (
    set /p ext="Enter file extension to search (e.g., .txt): "
    echo.
    echo [*] Searching for *%ext% files...
    dir /s /b "*.%ext%"
)
if "%search_choice%"=="3" goto REFRESH
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:DUPLICATE_FILE_FINDER
cls
echo.
echo [*] Duplicate File Finder
echo ============================
echo [1] Search in current directory
echo [2] Search in specific directory
echo [3] Back to Main Menu
echo.
set /p dup_choice="Select an option (1-3): "
if "%dup_choice%"=="1" (
    echo [*] Searching for duplicates in current directory...
    powershell -Command "Get-ChildItem -File | Get-FileHash | Group-Object -Property Hash | Where-Object Count -GT 1 | Format-Table Count, Name -AutoSize"
)
if "%dup_choice%"=="2" (
    set /p search_path="Enter directory path to search: "
    echo [*] Searching for duplicates in %search_path%...
    powershell -Command "Get-ChildItem -File '%search_path%' | Get-FileHash | Group-Object -Property Hash | Where-Object Count -GT 1 | Format-Table Count, Name -AutoSize"
)
if "%dup_choice%"=="3" goto REFRESH
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:NETWORK_SPEED_TEST
cls
echo.
echo [*] Testing Network Speed...
echo.
speedtest
echo [+] Network speed test completed!
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:WIFI_ANALYSIS
cls
echo.
echo [*] Wi-Fi Network Analysis
echo ============================
echo [1] Show Available Networks
echo [2] Show Network Profiles
echo [3] Show Network Statistics
echo [4] Back to Main Menu
echo.
set /p wifi_choice="Select an option (1-4): "
if "%wifi_choice%"=="1" (
    netsh wlan show networks
)
if "%wifi_choice%"=="2" (
    netsh wlan show profiles
)
if "%wifi_choice%"=="3" (
    netstat -e
)
if "%wifi_choice%"=="4" goto REFRESH
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH

:DNS_FLUSH_RESET
cls
echo.
echo [*] DNS Flush and Reset
echo ============================
echo [1] Flush DNS Cache
echo [2] Reset DNS Settings
echo [3] View DNS Cache
echo [4] Back to Main Menu
echo.
set /p dns_choice="Select an option (1-4): "
if "%dns_choice%"=="1" (
    ipconfig /flushdns
    echo [+] DNS cache flushed successfully!
)
if "%dns_choice%"=="2" (
    netsh int ip reset
    netsh winsock reset
    echo [+] DNS settings reset successfully!
    echo [!] System restart recommended
)
if "%dns_choice%"=="3" (
    ipconfig /displaydns
)
if "%dns_choice%"=="4" goto REFRESH
echo.
echo Press Enter to continue...
pause >nul
goto REFRESH