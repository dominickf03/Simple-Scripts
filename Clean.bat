REM Simple File Organizer That Sorts Every File Besides Shortcuts, Bat files, and VBS files
REM Make Sure You Have rp.vbs In The Same Directory
REM If not it should move it to the current folder
REM Please report any bugs

@echo off
if not exist files\data.txt (
goto oopss
exit
)
:verytop
net session >nul 2>&1
if %errorlevel%==0 (
  echo Please Dont Run This Program As Administrator!!!
  echo.
  pause
  exit
)
set nums = 0
set curdir=%CD%
set curdir=%curdir:\=/%
echo %curdir%
:top
if not exist rp.vbs (	
	move "C:\Users\%username%\Downloads\rp.vbs" "%curdir%"
	move "C:\Users\%username%\Documents\rp.vbs" "%curdir%"
	move "C:\Users\%username%\rp.vbs" "%curdir%"
	if exist rp.vbs (
		cls
		goto orgq
	) else (
		goto oopslol
	)
)
:orgq
echo. > bruh.vbs
echo. > before.vbs
echo. > after.vbs
echo. > a.vbs
echo. > Files.vbs
echo. > txt.lnk
dir /b /A:-D > before.vbs
@setlocal & @(for %%I in (*.*) do @set /a ext[%%~xI] += 0) & set ext[ > txt.lnk
mkdir Files
type txt.lnk
cscript rp.vbs "txt.lnk" "ext[." ""
cscript rp.vbs "txt.lnk" "]=0" ""
cls
@echo off
:moveFiles
for /f "tokens=*" %%a in ('type txt.lnk') do (
	set line=%%a
	if not "%%a" == "bat" (
		if not "%%a" == "vbs" (
 			if not "%%a" == "lnk" (
				if not "%%a" == "ext[" (
		echo %%a >> Files\.folders.txt
		mkdir Files\%%a
		move "*.%%a" Files\%%a\
		echo.  >> a.vbs
		echo ++++++++++++++++++++++++++++++++++++ >> a.vbs
		echo + Moved All %%a Files To Files/%%a + >> a.vbs
		echo ++++++++++++++++++++++++++++++++++++ >> a.vbs
				)	)
			)
		) 
	)
dir /b /A:-D > after.vbs
set filea=before.vbs
set fileb=after.vbs
set /a beforeFilesCount=0
set /a afterFilesCount=0
for /f %%t in ('type "%filea%"^|find "" /v /c') do set /a beforeFilesCount=%%t
for /f %%y in ('type "%fileb%"^|find "" /v /c') do set /a afterFilesCount=%%y
set /a filesMoved=%beforeFilesCount% - %afterFilesCount%
echo.
cls
echo Process Complete!!!  > Files/log.txt
type a.vbs >> Files/log.txt
echo. >> Files/log.txt
echo Files Moved: %filesMoved% >> Files/log.txt
del bruh.vbs
del before.vbs
del after.vbs
del a.vbs
del Files.vbs
del txt.lnk
notepad Files/log.txt && exit
exit
:oopslol
cls
color 0c
echo ++++++++++++++++++++++++++++++++++++++++
echo + Error, rp.vbs not found!!!           + 
echo + rp.vbs can be downloaded from github + 
echo + and can be put in this directory,    +
echo + Downloads, or Documents folder.      +     
echo ++++++++++++++++++++++++++++++++++++++++
echo.
set /p youdown=Download (Y) or (N):
if %youdown%==y goto dwnn
if %youdown%==Y goto dwnn
if %youdown%==N exit
if %youdown%==n exit
goto top
:dwnn
echo Downloading...
powershell Invoke-WebRequest https://raw.githubusercontent.com/dominickf03/MSDOS-Scripts-Simple-/main/rp.vbs -OutFile C:\Users\%username%\Desktop\rp.vbs
echo.
echo Process Complete!!!
echo.
pause
exit

:oopss
@echo off
cls
echo Is %CD%\ the directory you want cleaned?
echo.
set /p sss=(Y) or (N):
if %sss%==y goto okaa
if %sss%==Y goto okaa
if %sss%==N goto okno
if %sss%==n goto okno
goto oopss
:okaa
echo. > Files/data.txt
goto verytop
:okno
echo.
echo Please move rp.vbs and Clean.bat to the directory you want cleaned.
pause
exit
