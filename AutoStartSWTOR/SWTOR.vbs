'This script opens Star Wars The Old Republic, types in the password, logs in, and enters the game.
'You can create a shortcut from this vbs file and put an icon on it for looks. I added the default icon in this folder.
'Make sure to have the "remember this account" checkbox selected to make sure it doesn't make you put the username in. 

Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.run "CMD /C start steam://rungameid/1286830"
WScript.Sleep(6000) ' Time to boot up the login menu in miliseconds. Tweak the time if needed.
WshShell.SendKeys "PASSWORDHERE"  ' Replace PASSWORDHERE with your swtor password
WScript.Sleep(500)  ' Time before login
WshShell.SendKeys "{ENTER}"
WScript.Sleep(700)  ' Time before entering game
WshShell.SendKeys "{ENTER}" 
