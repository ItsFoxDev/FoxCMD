del=0.01
ver="3.3.6"
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
  echo "🪐 addspace [s]           • Adds a spacer to your dock"
  sleep $del
  echo "🫧  clean                  • Cleans your mac's cache"
  sleep $del
  echo "🗑  resetdock              • Resets your mac's dock"
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
  if [ "$2" == "brew" ]; then
    if [ "$3" == "-s" ]; then
      NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
      echo "🍺 Installing homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
  fi
  if [ "$2" == "spicetify" ]; then
    if [ "$3" != "-s" ]; then
      echo "🌶 Installing spicetify..."
    fi
    curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
    spicetify backup
    curl -fsSL https://raw.githubusercontent.com/CharlieS1103/spicetify-marketplace/main/install.sh | sh
  fi
  if [ "$2" == "youtube-dl" ]; then
    if [ ! -e "/usr/local/bin/python" ]; then
      if [ ! -e "/usr/bin/python3" ]; then
        echo "⚠️ Python is required to install youtube-dl."
        sleep $del
        echo "🔧 Installing python now..."
        fox install python -s
      fi
    echo "🔗 Creating python symlink..."
    sleep $del
    echo "🔑 You may need to enter your password."
    sleep $del
    sudo ln -s /usr/bin/python3 /usr/local/bin/python
    fi
    
    if [ "$3" == "-s" ]; then
      curl -L -s https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
      chmod a+rx /usr/local/bin/youtube-dl
    else
      echo ""
      echo "⬇️ Downloading youtube-dl"
      curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
      echo "📥 Installing youtube-dl"
      sudo chmod a+rx /usr/local/bin/youtube-dl
      echo ""
      sleep $del
      echo "✅ Installed youtube-dl"
      sleep $del
      echo ""
    fi
  fi
  if [ "$2" == "python" ]; then
    if [ "$3" == "-s" ]; then
      curl -s -L https://www.python.org/ftp/python/3.10.4/python-3.10.4-macos11.pkg -o ~/python.pkg
      sudo installer -pkg '~/python.pkg' -target /
      rm "~/python.pkg"
      sudo ln -s /usr/bin/python3 /usr/local/bin/python
      
    else
      echo ""
      echo "⬇️ Downloading Python"
      curl -L https://www.python.org/ftp/python/3.10.4/python-3.10.4-macos11.pkg -o ~/python.pkg -#
      echo "📥 Installing Python"
      sudo installer -pkg '~/python.pkg' -target /
      echo "🫧 Cleaning up"
      rm "~/python.pkg"
      echo "🔗 Creating python symlink..."
      sleep $del
      echo "🔑 You may need to enter your password."
      sleep $del
      sudo ln -s /usr/bin/python3 /usr/local/bin/python
      echo ""
      sleep $del
      echo "✅ Installed Python!"
      sleep $del
      echo ""
    fi
  fi
  if [ "$2" == "ffmpeg" ]; then
    echo ""
    if [ "$3" == "-s" ]; then
      echo "📥 Downloading ffmpeg..."
      curl -fsSL "https://evermeet.cx/ffmpeg/ffmpeg-5.0.zip" -o /usr/local/bin/ffmpeg.zip
      unzip -o -q /usr/local/bin/ffmpeg.zip -d /usr/local/bin/
      chmod +x /usr/local/bin/ffmpeg
      echo "📥 Downloading ffprobe..."
      curl -fsSL "https://evermeet.cx/ffmpeg/ffprobe-5.0.zip" -o /usr/local/bin/ffprobe.zip
      unzip -o -q /usr/local/bin/ffprobe.zip -d /usr/local/bin/
      chmod +x /usr/local/bin/ffprobe
      echo "📥 Downloading ffplay..."
      curl "https://evermeet.cx/ffmpeg/ffplay-5.0.zip" -o /usr/local/bin/ffplay.zip
      unzip -o -q /usr/local/bin/ffplay.zip -d /usr/local/bin/
      chmod +x /usr/local/bin/ffplay
      rm /usr/local/bin/ffmpeg.zip
      rm /usr/local/bin/ffplay.zip
      rm /usr/local/bin/ffprobe.zip
    else
      echo "ℹ️  Note: This may take a while."
      echo "It may not seem like it is doing anything, but it is."
      echo ""
      echo "📥 Downloading ffmpeg..."
      curl "https://evermeet.cx/ffmpeg/ffmpeg-5.0.zip" -o /usr/local/bin/ffmpeg.zip -#
      echo "📥 Installing ffmpeg..."
      unzip -o -q /usr/local/bin/ffmpeg.zip -d /usr/local/bin/
      echo "🚦 Verifying..."
      chmod +x /usr/local/bin/ffmpeg
      echo ""
      echo "📥 Downloading dependency ffprobe..."
      curl "https://evermeet.cx/ffmpeg/ffprobe-5.0.zip" -o /usr/local/bin/ffprobe.zip -#
      echo "📥 Installing ffprobe..."
      unzip -o -q /usr/local/bin/ffprobe.zip -d /usr/local/bin/
      echo "🚦 Verifying..."
      chmod +x /usr/local/bin/ffprobe
      echo ""
      echo "📥 Downloading dependency ffplay..."
      curl "https://evermeet.cx/ffmpeg/ffplay-5.0.zip" -o /usr/local/bin/ffplay.zip -#
      echo "📥 Installing ffplay..."
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
  if [ "$2" == "npm" ] || ["$2" == "nodejs" ]; then
    if [ "$3" == "-s" ]; then
      curl -s -L https://nodejs.org/dist/v18.0.0/node-v18.0.0.pkg -o ~/nodejs.pkg
      sudo installer -pkg '~/nodejs.pkg' -target /
      rm "~/nodejs.pkg"
    else
      echo ""
      echo "⬇️ Downloading NodeJS"
      curl -L https://nodejs.org/dist/v18.0.0/node-v18.0.0.pkg -o ~/nodejs.pkg -#
      echo "📥 Installing NodeJS"
      sudo installer -pkg '~/nodejs.pkg' -target /
      echo "🫧 Cleaning up"
      rm "~/nodejs.pkg"
      echo ""
      echo "✅ Installed NodeJS!"
      echo ""
    fi
  fi
fi
if [ "$1" == "remove" ]; then
  read -p "Are you sure you want to uninstall FoxCMD? y/n: " confirm
  if [ "$confirm" == "y" ]; then
    rm /usr/local/bin/fox
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
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/fox.sh" -o $HOME/fox.sh
  mv $HOME/fox.sh /usr/local/bin/fox
  echo "📥 Installing FoxCMD..."
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
  echo "📦 nodejs      • Javascript package manager"
  sleep $del
  echo "⬇️  youtube-dl  • Youtube downloader"
  sleep $del
  echo "🐍 python      • Popular coding language"
  sleep $del
  echo ""
  sleep $del
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
if [ "$1" == "addspace" ]; then
  if [ "$2" == "s" ]; then
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
    killall Dock
  else
    defaults write com.apple.dock persistent-apps -array-add '{tile-type="spacer-tile";}'
    killall Dock
  fi
  echo "✅ Added a spacer to your dock."
  echo "ℹ️  If it didn't work, you may have to run the command again."
fi
if [ "$1" == "resetdock" ]; then
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
