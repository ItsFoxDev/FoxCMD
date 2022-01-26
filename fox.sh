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
  echo "==== 📦 Packages 📦 ===="
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
  sleep $del
  echo "==== 📄 Commands 📄 ===="
  sleep $del
  echo ""
  sleep $del
  echo "⬇️  install     • Installs a package"
  sleep $del
  echo "⬆️  update      • Updates FoxCMD"
  sleep $del
  echo "📦 list        • Lists installable packages"
  sleep $del
  echo "👀 hdi <y/n>   • Hides icons on your desktop"
  sleep $del
  echo ""
  sleep $del
  echo "Command syntax: fox <command> <arguments>"
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
