# Rust Oxide Updater for Linux

This is a linux shell script for updating Oxide and the Rust server itself.
Unlike other updaters, this compares the Oxide version against the local copy before performing the update.
That way the server plugin support won't brake because the server won't be updated until a new Oxide update is out.
The script comes in 3 variants:

##LGSM version (Strongly Recommended)

This requires LGSM to be used for the server management. It requires no configuration for the script and it's the most 
hassle-free option. Just put the script in the LGSM root directory, where the rustserver startup file is located. You can schedule this in a crontab.
It will take care of everything.

## Linux Native

This requires some configuration. 

```
serverPath="/home/rustserver/serverfiles"
steamcmdPath="/usr/games"
```

The paths above need to be configured accordingly. The script can then be ran from any location.
In order to put the script in a crontab, you also need to preceed it with a server stop script and then succeed it with a server start script.

## Linux Native Manual

Just like the other native option, this requires some configuration. 

```
serverPath="/home/rustserver/serverfiles"
steamcmdPath="/usr/games"
```

The paths above need to be configured accordingly. The script can then be ran from any location.
This is a manual version to be run from the command line and it requires user input.
For an automated crontab task, use one of the other 2 options.