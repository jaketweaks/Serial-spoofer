@echo off
cls
echo ===========================
echo  Serial Restorer Script
echo ===========================
echo.
echo This script will restore your hardware serials to their original values.
echo Please make sure to run this script as Administrator!
echo.

:: Check if the script is running as Administrator
net session >nul 2>nul
if %errorlevel% neq 0 (
    echo You must run this script as Administrator. Exiting...
    pause
    exit /b
)

:: Restore Motherboard Serial
echo Restoring Motherboard Serial...
reg add "HKLM\HARDWARE\DESCRIPTION\System\BIOS" /v "BaseBoardSerialNumber" /d "YourOriginalMotherboardSerial" /f

:: Restore CPU Serial
echo Restoring CPU Serial...
:: Assuming that you backed up the CPU serial in a file or a registry key
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "CurrentVersionCPU" /d "YourOriginalCPUSerial" /f

:: Restore GPU Serial (this will depend on the method used to spoof)
echo Restoring GPU Serial...
:: You may need to manually restore GPU serial in device manager or registry, depending on your spoofing method.

:: Restore Disk Serial
echo Restoring Disk Serial...
:: Assuming you backed up disk serial info
reg add "HKLM\SYSTEM\CurrentControlSet\Services\disk" /v "SerialNumber" /d "YourOriginalDiskSerial" /f

:: Restore Network Adapter MAC Address
echo Restoring Network Adapter MAC Address...
:: Assuming that you backed up the original MAC address
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{YourInterfaceGUID}" /v "NetworkAddress" /d "YourOriginalMACAddress" /f

:: Finished
echo All serials have been restored to their original values.
echo Please reboot your system for the changes to take effect.
pause
exit
