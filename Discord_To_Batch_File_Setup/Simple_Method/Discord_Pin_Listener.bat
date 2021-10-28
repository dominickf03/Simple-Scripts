@echo off
set /a numa=10
:top
REM ---FUNCTION TO CHECK IF shutdown FILE IS IN DIRECTORY---
if exist shutdown (
  REM ---IF shutdown FILE IS FOUND IN DIRECTORY---
	cls
	echo shutdown at %time% after %numa% seconds >> shutdown-log.txt
	del shutdown
	shutdown /s
	pause
) else (
  REM ---IF shutdown FILE IS NOT FOUND---
	PING localhost -n 10 >NUL
	cls
	set /a numa=numa + 10
	echo Running for %numa% seconds
	goto top
)
