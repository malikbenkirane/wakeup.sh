cat <<EOF | gsed -f - org.wakeup.plist -i
/Hour/,/Minute/ s/[0-9]\+/$1/
/Minute/,$ s/[0-9]\+/$2/
EOF
launchctl unload org.wakeup.plist
launchctl load org.wakeup.plist
