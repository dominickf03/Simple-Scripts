@echo off
:top
cls
echo Bypass ARP Attacks
echo.
echo    Enter the IP address of your router.
set /p iplol=Example(192.168.1.1) :
echo %iplol%
set ipvr=%iplol%
:iptyp
echo.
echo    Enter the mac address of your ip address.
set /p maclol=Example(00-00-00-00-00-00) :
echo %maclol%
set mcvr=%maclol%
:done
echo.
echo Please verify that your routers ip is %ipvr% and your routers mac address is %mcvr%
pause
echo.
netsh interface ipv4 add neighbors "Wi-Fi" %ipvr% %mcvr%
if %errorlevel%==1 echo please reopen as administrator!!! && echo.
pause
