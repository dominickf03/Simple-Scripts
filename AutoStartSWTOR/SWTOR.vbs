Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.run "CMD /C start steam://rungameid/1286830"
WScript.Sleep(6000) ' Time to boot up the login menu in miliseconds
WshShell.SendKeys "PASSWORDHERE"  ' Replace PASSWORDHERE with your swtor password
WScript.Sleep(500)  ' Time before login
WshShell.SendKeys "{ENTER}"
WScript.Sleep(700)  ' Time before entering game
WshShell.SendKeys "{ENTER}" 
