echo
echo "ℹ️ This will install FoxCMD v2 to your computer."
sleep 0.03
echo "You may uninstall it at any time"
sleep 0.03
echo ""
sleep 0.03
echo "The installer will only affect the following directory"
sleep 0.03
echo "➡️  /usr/local/bin/fox"
sleep 0.03
read -p "Press enter to continue or any other key to abort: " confirm
if [ "$confirm" == "" ]; then
  echo
  sleep 0.03
  echo "🦊 Starting FoxCMD v2 installation..."
  sleep 0.3
  if [ ! -d "/usr/local/bin" ]; then 
    echo "🔑 You may be asked to enter your password"
    sudo mkdir /usr/local/bin
  fi
  echo "⬇️ Downloading FoxCMD v2..."
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/fox.sh" -o $HOME/fox.sh
  echo "➡️  Moving files into place"
  mv $HOME/fox.sh /usr/local/bin/fox
  echo "🚦  Marking file as executeable"
  chmod +x /usr/local/bin/fox
  echo "✅ FoxCMD v2 is successfully installed!"
  sleep 0.03
  echo "🏁 To run FoxCMD v2, run \"fox\""
else
  echo "❌ Install was cancelled."
fi
