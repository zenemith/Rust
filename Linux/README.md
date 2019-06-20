# Rust Oxide Updater for Linux

This is a linux shell script for updating Oxide and the Rust server itself.<br />
Unlike other updaters, this compares the Oxide version against the local copy before performing the update.<br />
That way the server plugin support won't brake because the server won't be updated until a new Oxide update is out.<br />
The instructions below apply to Ubuntu/Debian but are very similar to any linux distribution.<br />
The script comes in 3 variants:

## LGSM version (Strongly Recommended)

This requires LGSM to be used for the server management. It requires no configuration for the script and it's the most 
hassle-free option. Just put the script in the LGSM root directory, where the rustserver startup file is located. You can schedule this in a crontab.
It will take care of everything.

## Linux Native Auto version

This requires some configuration. 

```
serverPath="/home/rustserver/serverfiles"
steamcmdPath="/usr/games"
```

The paths above need to be configured accordingly. The script can then be ran from any location.<br />
In order to put the script in a crontab, you also need to preceed it with a server stop script and then succeed it with a server start script.

## Linux Native Manual version

Just like the other native option, this requires some configuration. 

```
serverPath="/home/rustserver/serverfiles"
steamcmdPath="/usr/games"
```

The paths above need to be configured accordingly. The script can then be ran from any location.<br />
This is a manual version to be run from the command line and it requires user input.<br />
For an automated crontab task, use one of the other 2 options.

# Additional information

You will need to run these commands once:

```
sudo apt -y install curl python3 unzip
sudo chown rustserveruser scriptName
sudo chmod +x scriptName
```

Replace rustserveruser and scriptName with the user that runs the server as well as the name of the script you downloaded.

#### Author:
m33ts4k0z, Discord: m33ts4k0z#9595