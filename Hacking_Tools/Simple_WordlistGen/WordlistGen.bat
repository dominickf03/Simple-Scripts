@echo off
set /A ddd=0
del *.dat
del *.txt
cls
echo How many words?
set /p ws=:
:top
cls
echo Type words(Example: Movie) Word %ddd% of %ws%
set /p eee=:
echo %eee%>> 01.dat
set /A ddd=ddd+1

if %ddd%==%ws% goto done
goto top
:done
echo.
echo Loading... (This may take a minute)

for /f "tokens=*" %%a in (01.dat) do (
     for /f "tokens=*" %%b in (01.dat) do (
     echo %%a%%b >> wordlist.txt
     echo %%b%%a >> wordlist.txt
     echo %%a%%b1 >> wordlist.txt
     echo %%b%%a1 >> wordlist.txt
        for /f "tokens=*" %%c in (01.dat) do (
           echo %%c%%a%%b >> wordlist.txt
           echo %%b%%a%%c >> wordlist.txt
           echo %%b%%c%%a >> wordlist.txt
           echo %%a%%c%%b >> wordlist.txt

           echo %%c%%a%%b1 >> wordlist.txt
           echo %%b%%a%%c1 >> wordlist.txt
           echo %%b%%c%%a1 >> wordlist.txt
           echo %%a%%c%%b1 >> wordlist.txt

           echo %%c%%a%%b! >> wordlist.txt
           echo %%b%%a%%c! >> wordlist.txt
           echo %%b%%c%%a! >> wordlist.txt
           echo %%a%%c%%b! >> wordlist.txt

           echo %%c%%a%%b01 >> wordlist.txt
           echo %%b%%a%%c01 >> wordlist.txt
           echo %%b%%c%%a01 >> wordlist.txt
           echo %%a%%c%%b01 >> wordlist.txt

           echo %%c%%a%%b123 >> wordlist.txt
           echo %%b%%a%%c123 >> wordlist.txt
           echo %%b%%c%%a123 >> wordlist.txt
           echo %%a%%c%%b123 >> wordlist.txt

           echo %%c%%a%%b0123 >> wordlist.txt
           echo %%b%%a%%c0123 >> wordlist.txt
           echo %%b%%c%%a0123 >> wordlist.txt
           echo %%a%%c%%b0123 >> wordlist.txt

           echo %%c%%a%%b1230 >> wordlist.txt
           echo %%b%%a%%c1230 >> wordlist.txt
           echo %%b%%c%%a1230 >> wordlist.txt
           echo %%a%%c%%b1230 >> wordlist.txt
           echo %%b%%a1 >> wordlist.txt
           echo %%b%%a01 >> wordlist.txt
           echo %%b%%a001 >> wordlist.txt
           echo %%b%%a#1 >> wordlist.txt
           echo %%b%%a#01 >> wordlist.txt
           echo %%b%%a0123 >> wordlist.txt
           echo %%b%%a1230 >> wordlist.txt

           echo %%b1 >> wordlist.txt
           echo %%b01 >> wordlist.txt
           echo %%b001 >> wordlist.txt
           echo %%b#1 >> wordlist.txt
           echo %%b#01 >> wordlist.txt
           echo %%b0123 >> wordlist.txt
           echo %%b1230 >> wordlist.txt

           echo %%a%random% >> wordlist.txt
           echo %%a%random% >> wordlist.txt
           echo %%a%random% >> wordlist.txt
           echo %%a%random% >> wordlist.txt
           echo %%a%random% >> wordlist.txt
           echo %%a%random% >> wordlist.txt
           echo %%a%random% >> wordlist.txt
           echo %%a%random% >> wordlist.txt
           echo %%a%random% >> wordlist.txt
           echo %%a%random% >> wordlist.txt

           echo %%b%random% >> wordlist.txt
           echo %%b%random% >> wordlist.txt
           echo %%b%random% >> wordlist.txt
           echo %%b%random% >> wordlist.txt
           echo %%b%random% >> wordlist.txt
           echo %%b%random% >> wordlist.txt
           echo %%b%random% >> wordlist.txt
           echo %%b%random% >> wordlist.txt
           echo %%b%random% >> wordlist.txt
           echo %%b%random% >> wordlist.txt

           echo %%c%random% >> wordlist.txt
           echo %%c%random% >> wordlist.txt
           echo %%c%random% >> wordlist.txt
           echo %%c%random% >> wordlist.txt
           echo %%c%random% >> wordlist.txt
           echo %%c%random% >> wordlist.txt
           echo %%c%random% >> wordlist.txt
           echo %%c%random% >> wordlist.txt
           echo %%c%random% >> wordlist.txt
           echo %%c%random% >> wordlist.txt

           echo %%c! >> wordlist.txt
           echo %%c? >> wordlist.txt
           echo %%c!! >> wordlist.txt
           echo %%c?? >> wordlist.txt
           echo %%c!!! >> wordlist.txt
           echo %%c??? >> wordlist.txt
           echo %%c$ >> wordlist.txt
           echo %%c$$ >> wordlist.txt
           echo %%c$$$ >> wordlist.txt

           echo %%c!%%b >> wordlist.txt
           echo %%c?%%b >> wordlist.txt
           echo %%c!!%%b >> wordlist.txt
           echo %%c??%%b >> wordlist.txt
           echo %%c!!!%%b >> wordlist.txt
           echo %%c???%%b >> wordlist.txt
           echo %%c$%%b >> wordlist.txt
           echo %%c$$%%b >> wordlist.txt
           echo %%c$$$%%b >> wordlist.txt

           echo %%c%%b! >> wordlist.txt
           echo %%c%%b? >> wordlist.txt
           echo %%c%%b!! >> wordlist.txt
           echo %%c%%b?? >> wordlist.txt
           echo %%c%%b!!! >> wordlist.txt
           echo %%c%%b??? >> wordlist.txt
           echo %%c%%b$ >> wordlist.txt
           echo %%c%%b$$ >> wordlist.txt
           echo %%c%%b$$$ >> wordlist.txt
)
)
)
del 01.dat
cls
echo =========================
echo The Program Has Completed
echo =========================
echo ----------
echo --   Number Of Variations:
find /v /c "&*t&*" wordlist.txt
echo --
echo --   File Size:
dir *.txt
echo.
pause
exit
