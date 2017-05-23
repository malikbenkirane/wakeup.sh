wakeup.sh
---

`wakeup.sh` is a usefull, free and minimalistic bash script that set up an alarm under mac OS X using launch.d through a console interface.

# Installation

```
$ bash install.sh
```

Which should copy `wakeup.sh` and `wakeup` in `$HOME/Library/LaunchAgents` and `$HOME` in that order.

```
# install.sh
# 1. copy wakeup.sh script to ~/Library/LaunchAgents from where and only where
# wakeup.sh script is runnable
# 2. give exec permission to wakeup and copy to ~/wakeup
cp wakeup.sh ~/Library/LaunchAgents
chmod +x wakeup
cp wakeup ~/
```

# Usage

```
$ bash wakeup.sh HH MM [FILE]
```

Running `wakeup.sh` bash script will configure launch.d (with a plist file) to open $`HOME/alarm.symlink` at `HH`:`MM`. For example, `alarm.symlink` is a symbolic link to a `mp3`, `flac` or `m4a` file. But the symlink is only set when `FILE` is given. When the three arguments are given, it tests `wakeup` (no .sh) behaviour.

# Roadmap

1. Better user interface
2. Default `alarm.symlink` alarm (or set up during the install ...)
