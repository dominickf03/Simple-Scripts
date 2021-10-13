REM Simple File Organizer That Sorts Every File Besides Shortcuts, Bat files, and VBS files
REM Make Sure You Have rp.vbs In The Same Directory
REM If not it should move it to the current folder

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
				)	)
			)
		) 
	)
