# Discord Pinned Post To Batch Script
Simple batch script to get a pinned post trigger from a discord server.
<br />
  + This script requires these things to run:
    + OneDrive, DropBox, or almost any other file storage service that offers windows drive syncing to your explorer.
    + IFTTT account (its free)
    + Windows OS
    + Discord
    <br />
  + Setup Instructions: Sign up for IFTTT at https://ifttt.com/, then goto My Applets on the IFTTT dashboard. Click "Create" at the top right corner. Click where it says "If This" and search for "Discord". When clicking on "Discord" it will want you to authorize the IFTTT bot on the server you want for the script. Afterwards click on the only trigger option the discord service gives you. Then select the channel and server category you want this script to be active on. After that click on "Then That" and search for your storage service(I used OneDrive). It will have to login authorize to your account. Afterwards select "create text file" and for the filename put "shutdown" and add the file path you want the file to save to. You can make the content whatever you want. Select "Create Action". After all of that setup, go to your windows explorer and enter the directory of your synced file manager. Then pin a post on the select server you want setup up on IFTTT and give it a bit to create the folders and files. Make sure to refresh the folder. If your still waiting after 30 minutes your not going to be able to do this script successfully. If your file is successfull, put the .bat file ,found in the current repo folder, into the same directory that "shutdown" is in. Afterwards you should be able to run the script and let it do its thing. 
+ What Does This Example Script Do?
  + This script executes a shutdown command to your computer when a server message gets pinned.
  <br />
  REMEMBER: This script is just simple and easy-to-edit. That means you can add multiple commands if you wanted to, have multiple servers to execute the script from, and more.
