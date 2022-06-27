foxpath="$HOME/.foxcmd"
del=0.01
ver="4.4.1"
if [ -z "$1" ]; then
  echo ""
  echo "🦊 FoxCMD v$ver"
  sleep $del
  echo ""
  sleep $del
  echo "===== 📄 Commands ======================================="
  sleep $del
  echo "⬇️  install <package> [-c] • Installs a package"
  sleep $del
  echo "📦 list                   • Lists installable packages"
  sleep $del
  echo "👀 hdi <y/n> [o]          • Hides icons on your desktop" 
  sleep $del
  echo "⭐️ starwars               • Watch ascii starwars"
  sleep $del
  echo "🔆 clean                  • Cleans your mac's cache"
  sleep $del
  echo "⬇️  dl                     • Downloads a youtube video"
  sleep $del
  echo "🤖 aiperson <count>       • Bulk fetches thispersondoesnotexist.com"
  sleep $del
  echo "🔧 tweak <list/tweak>     • Simple tweaks for your mac"
  sleep $del
  echo ""
  sleep $del
  echo "⬆️  update                 • Updates FoxCMD" 
  sleep $del
  echo "❌ remove                 • Removes FoxCMD from your computer"
  echo ""
  sleep $del
  echo "Command syntax: \"fox <command> <arguments>\" "
  sleep $del
  echo "Arguments: [optional] <required>"
  sleep $del
  echo ""
  sleep $del
fi
if [ "$1" == "install" ]; then
  foxint-install $1 $2 $3 $4 $5
fi
if [ "$1" == "remove" ]; then
  read -p "⛔️ Are you sure you want to uninstall FoxCMD and it's standalone CLIs? y/n: " confirm
  if [ "$confirm" == "y" ]; then
    sed -i -e '/export PATH=\"\$PATH:$foxpath\"/d' .zshrc
    sed -i -e '/export PATH=\"\$PATH:$foxpath\"/d' .bashrc
    rm -r $foxpath
    echo "✅ Completely uninstalled FoxCMD from your computer."
  elif [ "$confirm" == "n" ]; then
    echo "❌ Uninstall canceled."
  else
    echo "❌ Please enter either \"y\" or \"n\"."
  fi
fi
if [ "$1" == "update" ]; then
  echo ""
  sleep $del
  echo "⬇️  Downloading FoxCMD"
  sleep $del
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/fox.sh" -o $foxpath/fox
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/cmd/install.sh" -o $foxpath/foxint-install
  echo "📥 Installing FoxCMD..."
  sleep $del
  chmod 755 $foxpath/fox
  chmod 755 $foxpath/foxint-install
  echo "✅ FoxCMD v2 is has been successfully updated!"
  sleep $del
  echo ""
  sleep $del
fi
if [ "$1" == "list" ]; then
  foxint-install list
fi
if [ "$1" == "hdi" ]; then
  if [ "$2" == "y" ]; then
    if [ "$3" == "o" ]; then
      defaults write com.apple.finder CreateDesktop false
      killall Finder
    else
      chflags hidden ~/Desktop/*
    fi
    echo "✅ Hid desktop icons. To unhide, run \"fox hdi n\"" 
  fi
  if [ "$2" == "n" ]; then
    chflags nohidden ~/Desktop/*
    defaults write com.apple.finder CreateDesktop true
    echo "✅ Unhid desktop icons. To hide, run \"fox hdi y\"" 
  fi
  if [ -z "$2" ]; then
    echo "❌ Please use \"fox hdi y\" or \"fox hdi n\""
  fi
fi
if [ "$1" == "starwars" ]; then
  echo "Loading starwars. To exit, press CTRL+C"
  sleep 1
  nc towel.blinkenlights.nl 23
fi
if [ "$1" == "clean" ]; then
    echo ""
    echo "🗑 Cleaning Caches"
    rm -rf ~/Library/Caches/*
    echo "🗑 Cleaning logs"
    rm -rf ~/Library/logs/*
    echo "🗑 Clearing caches in user folder"
    rm -rf ~/.zsh_history
    rm -rf ~/.zsh_sessions
    rm -rf ~/.gradle/caches
    rm -rf ~/.npm
    rm -rf ~/.dartServer
    rm -rf ~/.pub-cache
    if [ -d ~/Library/Application\ Support/minecraft ];then
    	echo '⛏ Clearing Minecraft Caches and Logs...'
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
    if [ -d ~/Library/Application\ Support/Steam/ ]; then
	echo "⚙️ Cleaning Steam caches"
	rm -rfv ~/Library/Application\ Support/Steam/appcache &>/dev/null
	rm -rfv ~/Library/Application\ Support/Steam/depotcache &>/dev/null
	rm -rfv ~/Library/Application\ Support/Steam/logs &>/dev/null
	rm -rfv ~/Library/Application\ Support/Steam/steamapps/shadercache &>/dev/null
	rm -rfv ~/Library/Application\ Support/Steam/steamapps/temp &>/dev/null
	rm -rfv ~/Library/Application\ Support/Steam/steamapps/download &>/dev/null
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
    echo ""
    echo "✅ Cleaned your computer's cache!"
    echo ""
fi
if [ "$1" == "aiperson" ]; then
  if [ $2 -eq 0 ]; then
    echo "⚠️ Please enter a valid number"
    sleep $del
    echo "Syntax: \"fox aiperson <number of people>\""
  fi
  echo ""
  echo "🏁 Setting things up..."
  echo ""
  mkdir ~/people
  sleep 0.1
  echo "🌐 Connecting to thispersondoesnotexist.com"
  sleep 0.1
  echo ""
  count=1
  for i in $(seq $2)
  do
    echo "⬇️ Downloading image $count/$2"
    curl -fsSL "https://thispersondoesnotexist.com/image" -o ~/people/$count.jpg
    sleep 0.5
    count=$((count+1))
  done
  echo ""
  echo "📂 Zipping files to desktop..."
  cd ~/people
  zip -q ~/Desktop/people.zip ./*
  sleep 0.3
  echo "🧼 Cleaning up..."
  cd
  rm -r ~/people
  echo ""
  echo "✅ Saved $2 people to your desktop!"
  echo ""
fi
if [ "$1" == "tweak" ]; then
  if [ "$2" == "list" ] || [  -z "$2" ]; then
    echo "===== 🔧 Tweak list ====================================="
    sleep $del
    echo "🗂  openline [n]      • Adds a divider between open apps"
    sleep $del
    echo "💨 suck [n]          • Enables the hidden suck animation"
    sleep $del
    echo "⏩ instadock [n]     • Removes the delay on dock reveal"
    sleep $del
    echo "🗑  resetdock         • Resets your mac's dock"
    sleep $del
    echo "🪐 addspace [s]      • Adds a spacer to your dock"
    sleep $del
    echo ""
    sleep $del
    echo "Command syntax: \"fox tweak <tweak name>\" "
    sleep $del
    echo "ℹ️ Add \"n\" to the end of the command to disable the tweak."
    sleep $del
    echo ""
    sleep $del
  fi
  if [ "$2" == "openline" ]; then
    if [ "$3" == "n" ]; then
      defaults write com.apple.dock show-recents -bool true;
      defaults write com.apple.dock show-recent-count -int 3;
      killall Dock
      echo "✅ Disabled the openline tweak."
    else
      defaults write com.apple.dock show-recents -bool true;
      defaults write com.apple.dock show-recent-count -int 0;
      killall Dock
      echo "✅ Enabled the openline tweak."
    fi
  fi
  if [ "$2" == "suck" ]; then
    if [ "$3" == "n" ]; then
      defaults write com.apple.dock mineffect genie
      killall Dock
      echo "✅ Disabled the suck animation."
    else
      defaults write com.apple.dock mineffect suck
      killall Dock
      echo "✅ Enabled the suck animation."
    fi
  fi
  if [ "$2" == "resetdock" ]; then
    read -p "Are you sure you want to reset your dock? y/n: " confirm
    if [ "$confirm" == "y" ]; then
      defaults delete com.apple.dock
      killall Dock
      echo "✅ Reset your dock to system defaults."
    elif [ "$confirm" == "n" ]; then
      echo "❌ Dock reset canceled."
    else
      echo "❌ Please enter either \"y\" or \"n\"."
    fi
  fi
  if [ "$2" == "addspace" ]; then
    if [ "$3" == "s" ]; then
      defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
      killall Dock
    else
      defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
      killall Dock
    fi
    echo "✅ Added a spacer to your dock."
    echo "ℹ️  If it didn't work, you may have to run the command again."
  fi
  if [ "$2" == "instadock" ]; then
    if [ "$3" == "n" ]; then
      defaults delete com.apple.Dock autohide-delay
      killall Dock
      echo "✅ Disabled instant dock reveal."
    else
      defaults write com.apple.Dock autohide-delay -float 0
      killall Dock
      echo "✅ Enabled instant dock reveal."
    fi
  fi
fi
if [ "$1" == "dl" ]; then
  if [ ! -e "$foxpath/ytdlp" ]; then
    echo "ℹ️  ytdlp is required to use the \"dl\" command"
    fox install ytdlp
  fi
  read -p "🎥 Please enter YouTube URL: " yturl
  ytdlp -q --progress -f mp4 --embed-thumbnail -o "%(title)s.%(ext)s" "$yturl"
  echo "✅ Saved the video to your home folder!"
fi
