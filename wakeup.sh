#!/usr/bin/env bash

if [[ -z $1 || -z $2 ]]
then
    echo "Takes at least two parameters :"
    echo "$ wakeup.sh HOUR MINUTES [mp3file|flacfile|m4afile]"
    exit
fi

cat > org.wakeup.plist << wakeup.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>org.wakeup.app</string>
	<key>Program</key>
	<string>/Users/macbookpro/wakeup</string>
	<key>ProgramArguments</key>
	<array/>
	<key>StartCalendarInterval</key>
	<dict>
		<key>Hour</key>
		<integer>$1</integer>
		<key>Minute</key>
		<integer>$2</integer>
	</dict>
</dict>
</plist>
wakeup.plist

launchctl unload org.wakeup.plist
launchctl load org.wakeup.plist
echo "You should set up wake up schedule at or before $1:$2"
echo "Make sure your device is on a power source"

if [[ -n $3 && -f $3 ]]
then
    IFS=$'\n'
    alarm=$(basename $3)
    alarm_ext="${alarm##*.}"
    if [[ 
        $alarm_ext -eq "mp3" ||
        $alarm_ext -eq "m4a" ||
        $alarm_ext -eq "flac" ]]
    then
        rm -f ~/alarm.symlink
        ln -s $3 ~/alarm.symlink
        echo "Symlink done to $alarm"
        echo "Running ~/wakeup (symlink/sound test) ..."
        . ~/wakeup && exit 0
    fi
    echo "Not implemented ! ..."
    exit 1
fi
