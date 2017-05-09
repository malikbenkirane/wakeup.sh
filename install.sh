# install.sh
# 1. copy wakeup.sh script to ~/Library/LaunchAgents from where and only where
# wakeup.sh script is runnable
# 2. give exec permission to wakeup and copy to ~/wakeup
cp wakeup.sh ~/Library/LaunchAgents
chmod +x wakeup
cp wakeup ~/
