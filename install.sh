
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
  mkdir ~/.foxcmd
  chmod a+w ~/.foxcmd
  zshdir="~/.zshrc"
  if grep -s "export PATH=\"\$PATH:~/.foxcmd\"" "$zshdir"; then
    echo "✅ FoxCMD is in your zsh path!"
  else
    echo "📖 Adding foxcmd to zsh path..."
    echo -e "export PATH=\"\$PATH:~/.foxcmd\"" >> .zshrc
  fi
  bashdir="~/.bashrc"
  if grep -s "export PATH=\"\$PATH:~/.foxcmd\"" "$bashdir"; then
    echo "✅ FoxCMD is in your bash path!"
  else
    echo "📖 Adding foxcmd to bash path..."
    echo -e "export PATH=\"\$PATH:~/.foxcmd\"" >> .bashrc
  fi
  echo "⬇️  Downloading FoxCMD..."
  sudo curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/fox.sh" -o ~/.foxcmd/fox -#
  echo "📥 Installing FoxCMD..."
  chmod +x ~/.foxcmd/fox
  sleep $del
  echo "✅ FoxCMD is successfully installed!"
  sleep $del
  echo "🏁 To run FoxCMD, run \"fox\""
else
  echo "❌ Install was cancelled."
fi
