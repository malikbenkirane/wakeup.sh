#!/bin/sh -e

# install the planning script and launchctl config to ~/Library/LaunchAgents
cp -p wakeup.sh org.wakeup.plist ~/Library/LaunchAgents

# install the wakeup script
chmod +x wakeup
cp -p wakeup ~/

# inform
echo Please read README.md
echo Please edit ~/wakeup for this to actually work
