# Description

`wakeup.sh` is free and minimal. It is a bash script to set an alarm on mac OS X.
The script configures launchd to execute `~/wakeup` at the given time during setup.


# Installation

read `install.sh` first - there are 3 commands only -
(feel free to edit the script for your needs) then 

```
sh -e install.sh
```


# Setup

1. setup launchd

```
bash wakeup.sh HH MM
```

2. edit `~/wakeup` for your needs. For example

```
#!/bin/bash
#osascript -e "set Volume 10"  # macos volume
open ~/wakeup.mp3  # replace or symlink for your needs
```

or I prefer

```
#!/bin/bash
mpv --loop ~/wakeup.mp3  # replace or link with something compatible
```

3. ensure `~/wakup` is executable and if not, do

```
chmod +x ~/wakeup
```

**~ troubleshooting**

- bash may not locate `mpv` then test the script by planning a wakeup for the next minute
- putting the absolute path to the program which run is safer

useful debugging commands:

```
launchctl list | grep org.wakeup.list
launchctl list | head -1  # to view the field names of the previous command
```

google for exit codes significations (a bad exit code usually comes from a bad script)


# Help


* [symlinks (wikipedia) ↪][1]
* [osx command `open` ↪][2]
* [`mpv` media player installation ↪][3]


[1]: https://en.wikipedia.org/wiki/Symbolic_link#POSIX_and_Unix-like_operating_systems
[2]: https://ss64.com/osx/open.html
[3]: https://mpv.io/installation/
