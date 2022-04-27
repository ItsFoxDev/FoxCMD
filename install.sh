del=0.01
echo ""
sleep $del
echo -e "\x1b[33;49m    ___         ___ __  __ ___  "
sleep $del
echo -e "\x1b[33;49m   | __|____ __/ __|  \/  |   \ "
sleep $del
echo -e "\x1b[33;49m   | _/ _ \ \ / (__| |\/| | |) |"
sleep $del
echo -e "\x1b[33;49m   |_|\___/_\_\\___|_|  |_|___/ "
sleep $del
echo -e "\x1b[33;49m  Welcome to the FoxCMD isntaller."
sleep 0.01
echo ""
sleep 0.01
read -n 1 -p "Press enter to confirm or any other key to exit: " confirm
if ! [ "$confirm" == "" ]
then
  echo
  echo "❌ Install was cancelled."
  echo
  exit 1
fi
echo
sleep 0.03
echo "🦊 Starting FoxCMD v2 installation..."
sleep 0.3
if [ ! -d "/usr/local/bin" ]; then 
  echo "🔑 You may be asked to enter your password"
  sudo mkdir /usr/local/bin
fi
echo "⬇️  Downloading FoxCMD..."
curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/fox.sh" -o /usr/local/bin/fox
echo "📥 Installing FoxCMD..."
chmod +x /usr/local/bin/fox
echo "✅ FoxCMD v2 is successfully installed!"
sleep 0.03
echo "🏁 To run FoxCMD, run \"fox\""
