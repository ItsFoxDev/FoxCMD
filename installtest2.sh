
del=0.01
echo ""
sleep $del
echo -e "\x1b[33;49m    ___         ___ __  __ ___  "
sleep $del
echo -e "\x1b[33;49m   | __|____ __/ __|  \/  |   \ "
sleep $del
echo -e "\x1b[33;49m   | _/ _ \ \ / (__| |\/| | |) |"
sleep $del
echo -e "\x1b[33;49m   |_|\___/_\_\\____|_|  |_|___/ "
sleep $del
echo -e "\x1b[33;49m  Welcome to the FoxCMD installer."
sleep 0.01
echo ""
sleep 0.01
read -n 1 -p "Press enter to confirm or any other key to exit: " confirm
if [ "$confirm" == "" ]; then
  echo
  sleep 0.03
  echo "🦊 Starting FoxCMD installation..."
  sleep 0.3
  if [ ! -d "/opt/foxcmd" ]; then 
    echo "🔑 You may be asked to enter your password"
    sudo mkdir /opt/foxcmd
  fi
  FOXPATH=":/opt/foxcmd"
  # if [[ "$PATH" == *"$FOXPATH"* ]]; then
  if grep -q "$FOXPATH" <<< "$PATH"; then
    echo "📖 Adding foxcmd to path..."
    zsh export PATH="$PATH:/opt/foxcmd"
  else
    echo $PATH
  fi
  echo "⬇️  Downloading FoxCMD..."
  sudo curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/fox.sh" -o /opt/foxcmd/fox -#
  echo "📥 Installing FoxCMD..."
  sudo chmod +x /opt/foxcmd/fox
  sleep $del
  echo "✅ FoxCMD is successfully installed!"
  sleep $del
  echo "🏁 To run FoxCMD, run \"fox\""
else
  echo "❌ Install was cancelled."
fi
