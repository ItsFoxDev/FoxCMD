echo
echo "ℹ️  This will install FoxCMD to your computer."
sleep 0.01
echo "You may uninstall it at any time."
sleep 0.01
echo ""
sleep 0.01
echo "The installer will only affect the following directories"
sleep 0.01
echo "➡️  /opt/foxcmd/"
sleep 0.01
read -p "Press enter to continue or any other key to abort: " confirm
if [ "$confirm" == "" ]; then
  echo
  sleep 0.03
  echo "🦊 Starting FoxCMD v2 installation..."
  sleep 0.3
  if [ ! -d "/opt/foxcmd" ]; then 
    echo "🔑 You may be asked to enter your password"
    sudo mkdir /opt/foxcmd
    export PATH=$PATH:/opt/fox
  fi
  echo "⬇️  Downloading FoxCMD..."
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/fox.sh" -o /opt/foxcmd/fox
  echo "📥 Installing FoxCMD..."
  chmod +x /opt/foxcmd/fox
  echo "✅ FoxCMD is successfully installed!"
  sleep 0.03
  echo "🏁 To run FoxCMD, run \"fox\""
else
  echo "❌ Install was cancelled."
fi
