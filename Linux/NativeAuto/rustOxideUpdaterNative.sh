#!/bin/bash
# First time, run: sudo apt -y install curl python3 unzip

# Edit Below this line
# Server & steamcmd root paths. Don't use trailing slashes "/"
serverPath="/home/rustserver/serverfiles"
steamcmdPath="/usr/games"
# Edit above this line

oxideVersionLatest=$(curl -s 'https://umod.org/games/rust/latest.json' | python3 -c "import sys, json; print(json.load(sys.stdin)['version'])")
oxideLatestURL=$(curl -s 'https://umod.org/games/rust/latest.json' | python3 -c "import sys, json; print(json.load(sys.stdin)['snapshot_url'])")
oxideVersionInstalled=$(cat oxide.version)
echo "Checking for a new oxide version..."
if [ "$oxideVersionLatest" != "$oxideVersionInstalled" ] || [ -z "$oxideVersionInstalled" ]
then
    echo "Writing new version ["$oxideVersionLatest"] to file..."
    echo "$oxideVersionLatest" > oxide.version
    echo "New version written successfully. Updating server..."
    "$steamcmdPath"/steamcmd +login anonymous +force_install_dir "$serverPath"/ +app_update 258550 +quit >/dev/null 2>&1
    echo "Updating Oxide..."
    curl -L "$oxideLatestURL" --output oxide.zip >/dev/null 2>&1
    unzip -o oxide.zip -d "$serverPath"/ >/dev/null 2>&1
    rm oxide.zip >/dev/null 2>&1
    echo "All operations completed successfully!"
else
    echo "No update is available"
fi