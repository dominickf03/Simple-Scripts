Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.run "CMD /C start SWTOR.url"
WScript.Sleep(6000) /* Time to boot up the login menu in miliseconds */
WshShell.SendKeys "PASSWORDHERE"  /* Replace PASSWORDHERE with your swtor password */
WScript.Sleep(500) 
WshShell.SendKeys "{ENTER}"
WScript.Sleep(700)
WshShell.SendKeys "{ENTER}"
