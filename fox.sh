del=0.03
if [ "$1" == "install" ]; then
  if [ "$2" == "brew" ]; then
    echo "🍺 Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  if [ "$2" == "spicetify" ]; then
    echo "🌶 Installing spicetify..."
    curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
    curl -fsSL https://raw.githubusercontent.com/CharlieS1103/spicetify-marketplace/main/install.sh | sh
  fi
fi
if [ "$1" == "update" ]; then
  echo ""
  sleep $del
  echo "⬇️  Downloading FoxCMD"
  sleep $del
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/fox.sh" -o $HOME/fox.sh
  echo "➡️  Moving files into place"
  sleep $del
  mv $HOME/fox.sh /usr/local/bin/fox
  echo "🚦 Marking file as executeable"
  sleep $del
  chmod +x /usr/local/bin/fox
  echo "✅ FoxCMD v2 is has been successfully updated!"
  sleep $del
  echo ""
  sleep $del
fi
if [ "$1" == "list" ]; then
  echo ""
  sleep $del
  echo "======= 📦 Packages 📦 ======="
  sleep $del
  echo "🍺 brew        • Package manager"
  sleep $del
  echo "🌶  spicetify   • Themes for Spotify"
  sleep $del
  echo ""
  sleep $del
fi
if [ $# -eq 0 ]; then
  echo ""
  echo "🦊 FoxCMD v2.1.3"
  sleep $del
  echo "===== 📄 Commands ======================================="
  sleep $del
  echo "ℹ️  COMMAND     • DESCRIPTION                 • ARGUMENTS"
  sleep $del
  echo "---------------------------------------------------------"
  sleep $del
  echo "⬇️  install     • Installs a package          • <package>"
  sleep $del
  echo "⬆️  update      • Updates FoxCMD              • No arguments" 
  sleep $del
  echo "📦 list        • Lists installable packages  • No arguments"
  sleep $del
  echo "👀 hdi         • Hides icons on your desktop • <y/n>" 
  sleep $del
  echo "⭐️ starwars    • Watch ascii starwars        • No arguments"
  sleep $del
  echo "🎚 dock        • Tweaks your dock            • <function or \"list\">"
  sleep $del
  echo ""
  sleep $del
  echo "Command syntax: \"fox <command> <arguments>\""
  sleep $del
  echo ""
  sleep $del
fi
if [ "$1" == "hdi" ]; then
  if [ "$2" == "y" ]; then
    defaults write com.apple.finder CreateDesktop false
    killall Finder
    echo "✅ Hid desktop icons. To unhide, run \"fox hdi n\"" 
  fi
  if [ "$2" == "n" ]; then
    defaults write com.apple.finder CreateDesktop true
    killall Finder
    echo "✅ Unhid desktop icons. To hide, run \"fox hdi y\"" 
  fi
fi
if [ "$1" == "starwars" ]; then
  echo "Loading starwars. To exit, press CTRL+C"
  sleep 1
  nc towel.blinkenlights.nl 23
fi
if [ "$1" == "dock" ]; then
  if [ "$2" == "addspace" ]; then
    defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
    killall Dock
    echo "✅ Added a spacer to your dock."
    echo "ℹ️ If it didn't work, you may have to run the command again."
  fi
  if [ "$2" == "reset" ]; then
    read -p "Are you sure you want to reset your dock? y/n: " confirm
    if [ "$confirm" == "y" ]; then
      defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
      killall Dock
      echo "✅ Reset your dock to system defaults."
    elif [ "$confirm" == "n" ]; then
      echo "❌ Dock reset canceled."
    else
      echo "❌ Please enter either \"y\" or \"n\"."
    fi
  fi
  if [ "$2" == "list" ]; then
    echo ""
    sleep $del
    echo "==== 📄 DOCK COMMANDS ============"
    sleep $del
    echo "❌ Reset     • Resets your dock to system defaults"
    sleep $del
    echo "🪐 Addspace  • Adds a blank spacer to your dock"
    sleep $del
    echo ""
fi
  
