REM Simple File Organizer That Sorts Every File Besides Shortcuts, Bat files, and VBS files
REM Make Sure You Have rp.vbs In The Same Directory
REM If not it should move it to the current folder

@echo off
echo. > bruh.vbs
echo. > before.vbs
echo. > after.vbs
decho. > a.vbs
echo. > Files.vbs
echo. > txt.lnk
set nums = 0
dir /b /A:-D > before.vbs
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
		cls
		echo Error, rp.vbs not found in this directory!!!
		pause
		goto top
	)
)

:orgq
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
