@echo off
:repeat
cls
echo [+] Disk Serial's
wmic diskdrive get model, serialnumber
echo [+] CPU
wmic cpu get serialnumber, name, PartNumber
echo [+] BaseBoard
wmic baseboard get manufacturer, serialnumber
echo [+] BIOS
wmic bios get manufacturer, serialnumber
echo [+] smBIOS
wmic csproduct get name, uuid
echo [+] MAC
wmic nic get name, macaddress
echo Press any key to recheck
pause >nul
goto repeat;