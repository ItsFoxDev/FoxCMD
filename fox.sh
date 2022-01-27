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
  if [ "$2" == "ffmpeg" ]; then
    echo ""
    echo "ℹ️  Note: This may take a while."
    echo "It may not seem like it is doing anything, but it is."
    echo ""
    echo "📥 Downloading ffmpeg..."
    curl -fsSL "https://evermeet.cx/ffmpeg/ffmpeg-5.0.zip" -o /usr/local/bin/ffmpeg.zip
    echo "⚡️ Installing ffmpeg..."
    unzip -o -q /usr/local/bin/ffmpeg.zip -d /usr/local/bin/
    echo "🚦 Verifying..."
    chmod +x /usr/local/bin/ffmpeg
    echo ""
    echo "📥 Downloading dependency ffprobe..."
    curl -fsSL "https://evermeet.cx/ffmpeg/ffprobe-5.0.zip" -o /usr/local/bin/ffprobe.zip
    echo "⚡️ Installing ffprobe..."
    unzip -o -q /usr/local/bin/ffprobe.zip -d /usr/local/bin/
    echo "🚦 Verifying..."
    chmod +x /usr/local/bin/ffprobe
    echo ""
    echo "📥 Downloading dependency ffplay..."
    curl -fsSL "https://evermeet.cx/ffmpeg/ffplay-5.0.zip" -o /usr/local/bin/ffplay.zip
    echo "⚡️ Installing ffplay..."
    unzip -o -q /usr/local/bin/ffplay.zip -d /usr/local/bin/
    echo "🚦 Verifying..."
    chmod +x /usr/local/bin/ffplay
    echo ""
    echo "🧼 Cleaning up..."
    rm /usr/local/bin/ffmpeg.zip
    rm /usr/local/bin/ffplay.zip
    rm /usr/local/bin/ffprobe.zip
    echo ""
    echo "✅ Installed ffmpeg!"
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
  echo "🎥 ffmpeg      • Video encoder"
  sleep $del
  echo ""
  sleep $del
fi
if [ $# -eq 0 ]; then
  echo ""
  echo "🦊 FoxCMD v2.1.4.1"
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
  echo "🎚  dock        • Tweaks your dock            • <function or \"list\">"
  sleep $del
  echo "🗑 clean        • Cleans your mac's cache     • <\"dc\" - requires sudo>"
  sleep $del
  echo ""
  sleep $del
  echo "Command syntax: \"fox <command> <arguments>\" "
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
fi
if [ "$1" == "clean" ]; then
    echo 🗑 Cleaning Caches
    rm -rf ~/Library/Caches/*
    echo 🗑 Cleaning logs
    rm -rf ~/Library/logs/*
    echo 🗑 Clearing caches in user folder
    rm -rf ~/.zsh_history
    rm -rf ~/.zsh_sessions
    rm -rf ~/.gradle/caches
    rm -rf ~/.npm
    rm -rf ~/.dartServer
    rm -rf ~/.pub-cache
    if [ "$2" == "dc" ]; then
      sudo rm -f -rf ~/.Trash/*
      sudo rm -f -rf ~/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/*
    fi
    if [ -d ~/Library/Application\ Support/minecraft ];then
    	echo '⛏ Clearing Minecraft Cache and Log Files...'
    	rm -rfv ~/Library/Application\ Support/minecraft/logs &>/dev/null
    	rm -rfv ~/Library/Application\ Support/minecraft/crash-reports &>/dev/null
    	rm -rfv ~/Library/Application\ Support/minecraft/webcache &>/dev/null
    	rm -rfv ~/Library/Application\ Support/minecraft/webcache2 &>/dev/null
    	rm -rfv ~/Library/Application\ Support/minecraft/crash-reports &>/dev/null
    	rm -rfv ~/Library/Application\ Support/minecraft/*.log &>/dev/null
	    rm -rfv ~/Library/Application\ Support/minecraft/launcher_cef_log.txt &>/dev/
    	rm -rfv ~/Library/Application\ Support/minecraft/.mixin.out &>/dev/
    fi
    if [ -d ~/.lunarclient ]; then
    	echo '🌘 Deleting Lunar Client logs and caches...'
    	rm -rfv ~/.lunarclient/game-cache &>/dev/null
    	rm -rfv ~/.lunarclient/launcher-cache &>/dev/null
    	rm -rfv ~/.lunarclient/logs &>/dev/null
	    rm -rfv ~/.lunarclient/offline/*/logs &>/dev/null
	    rm -rfv ~/.lunarclient/offline/files/*/logs &   >/dev/null
    fi
    if [ -d /opt/homebrew ]; then
    	echo '🍺 Updating Homebrew Recipes...'
    	brew update &>/dev/null
    	echo '🍺 Upgrading and removing outdated formulae...'
    	brew upgrade &>/dev/null
    	echo '🍺 Cleaning up Homebrew Cache...'
    	brew cleanup -s &>/dev/null
	    rm -rfv "$(brew --cache)"
    	brew tap --repair &>/dev/null
    fi
    echo "✅ Cleaned your computer's cache!"
fi
