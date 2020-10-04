# Rust-Oxide-Updater
This is batch code for updating Rust and Oxide ONLY IF there is an Oxide update.

Warning: Make you stop your server before running this script/batch file to ensure it is updated correctly.

## Code (Information)
You will notice there is a lot of code in here, most of it is to elevate the batch file so my server can run it with Windows Scheduler (I have mine slightly changed to start and stop the server) but you can remove this if you do not need it.

## Pre-installation
Download and install 7zip: https://www.7-zip.org/download.html
Download and install wget: https://sourceforge.net/projects/gnuwin32/files/wget/1.11.4-1/wget-1.11.4-1-setup.exe/download?use_mirror=svwh

After you downloaded wget you will need to update it. Download wget.exe (Version 1.19) from https://drive.google.com/file/d/1LETKrfV90cTPU6tJve8S9SgbUWHZt7sM/view and replace wget in "C:\Program Files (x86)\GnuWin32\bin"

## Step 1 - Saving
Save the file at any directory with any name that is convenient for you but make sure you save it as a .bat file as this is for batch on Windows OS.

## Step 2 - Editing
Right click and edit the file.

### wget
After you installed wget, verify the directory of wget. If it is not at **"C:\Program Files (x86)\GnuWin32\bin"** please edit all lines that show **cd "C:\Program Files (x86)\GnuWin32\bin"** to show the correct directory of wget.

### 7zip
After you install 7zip, verify the directly of 7zip. If it is not at **"C:\Program Files\7-Zip\"** please edit all lines that show **cd "C:\Program Files\7-Zip\"** to show the correct directly of 7zip.

### Rust and SteamCMD Directory
You will see 2 Variables called ServerDirectory and SteamCMD. Please update these to your Server Directory and SteamCMD directory!

## Other info
You will notice within the contents of the file there is 2 variable. **InstalledOxideVersion** and **LatestOxideVersion**. InstalledOxideVersion is your currently installed Oxide version pulled from **"C:\rustcity\rust\installed.json"** (or your server directory) however if you have never used this before it will not be able to locate the file to set a variable and will create an empty installed.json file thus forcing an update even if it is not required as it does not have your current version to to read from, just an empty file.

## Opening the file
While opening the file a few things happens. It will read both installed.json (created earlier manually) and latest.json (downloaded upon launch of the batch file). If the contents of both of these files match, it will return a message "No update required" and close. If the files do not match it will promp you with "Starting Update, make sure your server is turned off before continuing!" and will force you to press a key to continue.

You will notice there are a lot of "Press any key to Continue . . ." and this is for troubleshooting purposes. You can remove all the "pause" lines in the batch file to eliminate this and allow for an easier and faster update process with something as simple as just opening the file.


#### Credits:
Zenemith
