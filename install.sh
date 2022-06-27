
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
  zshdir="$HOME/.zshrc"
  if grep -s "export PATH=\"\$PATH:\$HOME/.foxcmd\"" "$zshdir"; then
    echo "✅ FoxCMD is in your zsh path!"
  else
    echo "📖 Adding foxcmd to zsh path..."
    echo -e "export PATH=\"\$PATH:\$HOME/.foxcmd\"" >> .zshrc
  fi
  bashdir="$HOME/.bashrc"
  if grep -s "export PATH=\"\$PATH:\$HOME/.foxcmd\"" "$bashdir"; then
    echo "✅ FoxCMD is in your bash path!"
  else
    echo "📖 Adding foxcmd to bash path..."
    echo -e "export PATH=\"\$PATH:\$HOME/.foxcmd\"" >> .bashrc
  fi
  echo "⬇️  Downloading FoxCMD..."
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/fox.sh" -o ~/.foxcmd/fox -#
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/cmd/install.sh" -o ~/.foxcmd/foxint-install -#
  echo "📥 Installing FoxCMD..."
  chmod 755 ~/.foxcmd/fox
  chmod 755 ~/.foxcmd/foxint-install
  sleep $del
  echo "✅ FoxCMD is successfully installed!"
  sleep $del
  echo "🏁 To run FoxCMD, run \"fox\""
else
  echo ""
  echo "❌ Install was cancelled."
fi
