echo "🏁 Cleaning keystone..."
sleep 1
echo "🕒 Cleaning keystone Launch Agents"
sudo rm /Library/LaunchAgents/com.google.keystone.agent.plist
sudo rm /Library/LaunchAgents/com.google.keystone.xpcservice.plist
sudo rm /Library/LaunchAgents/org.chromium.chromoting.plist
echo "🕒 Cleaning keystone Launch Daemons"
sudo rm /Library/LaunchDaemons/com.google.keystone.daemon.plist
echo "🕒 Cleaning keystone app support"
sudo rm -r /Library/Application\ Support/Google
sudo rm -r /Library/Google
echo "🕒 Cleaning keystone caches"
sudo rm -r /Library/Caches/com.google.SoftwareUpdate.0
echo "🕒 Cleaning google support"
sudo rm -r /Applications/Google\ Chrome.app
sudo rm -r /Library/Google
