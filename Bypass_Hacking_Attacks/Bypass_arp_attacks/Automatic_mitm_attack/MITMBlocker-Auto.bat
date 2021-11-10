@echo off
@setlocal enableextensions
@cd /d "%~dp0"
echo %CD%
title detecting arp attacks...
mkdir arpData
if not exist arpData\data.txt goto tt
goto getipmac
:tt
cls
echo  ---- First Time Setup ----
echo.
echo    Make sure your not being arp attacked for the auto setup...
echo    If you think you're being attacked currently, type manual to 
echo    manually type in your routers gateway ip and mac address.
echo.
echo    --- Warning! This script is still being worked on and can have bugs! ---
echo    --- If there are any problems being created using this script it     ---
echo    --- will be the users problem. USE AT YOUR OWN RISK!!!               ---
echo.
echo        Tested on windows10 with no bugs or errors on only one machine
echo.
echo    (auto) or (1) To do auto setup 
echo    (manual) To do manual setup
echo.
set /p tppa=--:
if %tppa%==auto goto autoaa
if %tppa%==1 goto autoaa
if %tppa%==manual goto manualaa
goto tt

:autoaa
Powershell -noprofile -executionpolicy bypass -file "gdg.ps1" > gt.lnk
cscript rp.vbs "gt.lnk" " $_.NextHop" ""
cscript rp.vbs "gt.lnk" "------------" ""
cscript rp.vbs "gt.lnk" " " ""
(
set /p linea=
set /p lineb=
set /p linec= 
set /p lined=
set /p linee=
set /p linef=
) < gt.lnk
set gatewaylol=%linea%%lineb%%linec%%lined%%linee%%linef%
cls
arp -a | findstr " %gatewaylol% " > mgt.lnk
cscript rp.vbs "mgt.lnk" "static" ""
cscript rp.vbs "mgt.lnk" "dynamic" ""
cscript rp.vbs "mgt.lnk" "%gatewaylol%" ""
cscript rp.vbs "mgt.lnk" " " ""
set /p aa= < mgt.lnk
cls
echo Mac Address: %aa%
echo Router IP Address: %gatewaylol%
del mgt.lnk
del gt.lnk
echo Line 2 (Mac Of Router) - Line 3 (IP Of router) > arpData/data.txt
echo %aa% >> arpData/data.txt
echo %gatewaylol% >> arpData/data.txt
cls
echo data has been set!
echo please restart the program
pause
exit

:manualaa
cls
set /p macaddr=(0-0-0-0-0-0-0) Router mac Address:
set /p ipaddr=(000.000.0.0) Router IP Address:
echo Line 2 (Mac Of Router) - Line 3 (IP Of router) > arpData/data.txt
echo %macaddr% >> arpData/data.txt
echo %ipaddr% >> arpData/data.txt
cls
echo data has been set!
echo please restart the program
pause
exit

:getipmac
Powershell -noprofile -executionpolicy bypass -file "gdg.ps1" > gt.lnk
cscript rp.vbs "gt.lnk" " $_.NextHop" ""
cscript rp.vbs "gt.lnk" "------------" ""
cscript rp.vbs "gt.lnk" " " ""
(
set /p linea=
set /p lineb=
set /p linec= 
set /p lined=
set /p linee=
set /p linef=
) < gt.lnk
set gatewaylol=%linea%%lineb%%linec%%lined%%linee%%linef%
cls
arp -a | findstr " %gatewaylol% " > mgt.lnk
cscript rp.vbs "mgt.lnk" "static" ""
cscript rp.vbs "mgt.lnk" "dynamic" ""
cscript rp.vbs "mgt.lnk" "%gatewaylol%" ""
cscript rp.vbs "mgt.lnk" " " ""
set /p aa= < mgt.lnk
cls
echo Mac Address: %aa%
echo Router IP Address: %gatewaylol%
del mgt.lnk
del gt.lnk
goto existdatafile

:existdatafile
set p=y
cls
(
set /p titleofthing=
set /p macaddressvalue=
set /p ipaddressvalue= 
) < arpData\data.txt
if not %ipaddressvalue%==%gatewaylol% set p=a
if not %macaddressvalue%==%aa% set p=b
if %p%==a goto haschanged
if %p%==b goto haschanged

timeout 15
goto getipmac

:haschanged
echo --------------------------------------------- >> arpData/detectionLog.txt
echo %date%     %time%  >> arpData/detectionLog.txt
echo IP Def:%ipaddressvalue%  Att:%gatewaylol%  >> arpData/detectionLog.txt
echo Mac Def:%macaddressvalue%  Att:%aa%  >> arpData/detectionLog.txt
echo ---------------------------------------------  >> arpData/detectionLog.txt
echo.  >> arpData/detectionLog.txt
cls
echo IP or mac has changed!
echo.
echo IP Address         default:(%ipaddressvalue%)   to   New:(%gatewaylol%)
echo Mac Address        default:(%macaddressvalue%)    to    New:(%aa%)
echo.
echo       THIS COULD BE A MAN-IN-THE-MIDDLE ATTACK!!!!
echo       Do you want to set router rules so you can bypass the attack and prevent another attack?
set /p chi=(y) or (n):
if %chi%==y goto setipmac
goto haschanged
exit

:setipmac
netsh interface ipv4 add neighbors "Wi-Fi" %ipaddressvalue% %macaddressvalue%
pause
