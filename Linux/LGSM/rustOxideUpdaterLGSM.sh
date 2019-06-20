#!/bin/bash

# First time, run: sudo apt install curl python3
oxideVersionLatest=$(curl -s 'https://umod.org/games/rust/latest.json' | python3 -c "import sys, json; print(json.load(sys.stdin)['version'])")
oxideVersionInstalled=$(cat oxide.version)
echo "Checking for a new oxide version..."
if [ "$oxideVersionLatest" != "$oxideVersionInstalled" ] || [ -z "$oxideVersionInstalled" ]
then
    echo "Writing new version ["$oxideVersionLatest"] to file..."
    echo "$oxideVersionLatest" > oxide.version
    echo "New version written successfully. Updating server..."
    ./rustserver update
    echo "Updating Oxide..."
    ./rustserver mods-update
    echo "Restarting the server..."
    ./rustserver restart 
    echo "All operations completed successfully!"   
else
    echo "No update is available"
fi