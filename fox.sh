
# ╔═[ 📄 LICENSE ]════════════════════════════════════════════════╗
# ║ This software is licensed under the Alofsto General Public    ║
# ║ License. It can be viewed at https://bit.ly/agplraw.          ║
# ╚═══════════════════════════════════════════════════════════════╝

# ===[ 🎨 COLOUR SETUP ]====================== #
color_black="\u001b[30m";color_red="\u001b[31m";color_green="\u001b[32m";color_yellow="\u001b[33m";color_blue="\u001b[34m";color_cyan="\u001b[36m";color_white="\u001b[37m";color_magenta="\u001b[35m";color_pink="\u001b[35m"
bold_black="\u001b[30m;1";bold_red="\u001b[31m;1";bold_green="\u001b[32m;1";bold_yellow="\u001b[33m;1";bold_blue="\u001b[34m;1";bold_cyan="\u001b[36m;1";bold_white="\u001b[37m;1"
bold="\u001b[1m";underline="\u001b[4m";invert="\u001b[7m";reset="\u001b[0m"
bgcolor_black="\u001b[40m";bgcolor_red="\u001b[41m";bgcolor_green="\u001b[42m";bgcolor_yellow="\u001b[44m";bgcolor_blue="\u001b[44m";bgcolor_cyan="\u001b[46m";bgcolor_white="\u001b[47m"
# ============================================ #

foxpath="$HOME/.foxcmd"
del=0.01
ver="4.6"
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
fi

# Redirects "install" and "list" commands to seperate command manager
if [ "$1" == "install" ]; then; foxint-install $1 $2 $3 $4 $5; fi
if [ "$1" == "list" ]; then; foxint-install list; fi

if [ "$1" == "remove" ]; then
  read -p "⛔️ Are you sure you want to uninstall FoxCMD and it's standalone CLIs? y/n: " confirm
  if [ "$confirm" == "y" ]; then
    sed -i -e '/export PATH=\"\$PATH:$foxpath\"/d' .zshrc
    sed -i -e '/export PATH=\"\$PATH:$foxpath\"/d' .bashrc
    rm -r $foxpath
    print "${color_green}✅ Completely uninstalled FoxCMD from your computer."
  elif [ "$confirm" == "n" ]; then
    print "${color_red}❌ Uninstall canceled."
  else
    print "${color_red}❌ Please enter either \"y\" or \"n\"."
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
  print "${color_green}✅ FoxCMD v2 is has been successfully updated!"
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
    print "${color_green}✅ Hid desktop icons. To unhide, run \"fox hdi n\"" 
  fi
  if [ "$2" == "n" ]; then
    chflags nohidden ~/Desktop/*
    defaults write com.apple.finder CreateDesktop true
    print "${color_green}✅ Unhid desktop icons. To hide, run \"fox hdi y\"" 
  fi
  if [ -z "$2" ]; then
    print "${color_red}❌ Please use \"fox hdi y\" or \"fox hdi n\""
  fi
fi
if [ "$1" == "starwars" ]; then
  echo "Loading starwars. To exit, press CTRL+C"
  sleep 1
  nc towel.blinkenlights.nl 23
fi

if [ "$1" == "aiperson" ]; then
  if [ $2 -eq 0 ]; then
    print "${color_red}❌ Please enter a valid number"
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
  print "${color_green}✅ Saved $2 people to your desktop!"
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
  fi
  if [ "$2" == "openline" ]; then
    if [ "$3" == "n" ]; then
      defaults write com.apple.dock show-recents -bool true;
      defaults write com.apple.dock show-recent-count -int 3;
      killall Dock
      print "${color_green}✅ Disabled the openline tweak."
    else
      defaults write com.apple.dock show-recents -bool true;
      defaults write com.apple.dock show-recent-count -int 0;
      killall Dock
      print "${color_green}✅ Enabled the openline tweak."
    fi
  fi
  if [ "$2" == "suck" ]; then
    if [ "$3" == "n" ]; then
      defaults write com.apple.dock mineffect genie
      killall Dock
      print "${color_green}✅ Disabled the suck animation."
    else
      defaults write com.apple.dock mineffect suck
      killall Dock
      print "${color_green}✅ Enabled the suck animation."
    fi
  fi
  if [ "$2" == "resetdock" ]; then
    read -p "Are you sure you want to reset your dock? y/n: " confirm
    if [ "$confirm" == "y" ]; then
      defaults delete com.apple.dock
      killall Dock
      print "${color_green}✅ Reset your dock to system defaults."
    elif [ "$confirm" == "n" ]; then
      print "${color_red}❌ Dock reset canceled."
    else
      print "${color_red}❌ Please enter either \"y\" or \"n\"."
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
    print "${color_green}✅ Added a spacer to your dock."
    echo "ℹ️  If it didn't work, you may have to run the command again."
  fi
  if [ "$2" == "instadock" ]; then
    if [ "$3" == "n" ]; then
      defaults delete com.apple.Dock autohide-delay
      killall Dock
      print "${color_green}✅ Disabled instant dock reveal."
    else
      defaults write com.apple.Dock autohide-delay -float 0
      killall Dock
      print "${color_green}✅ Enabled instant dock reveal."
    fi
  fi
fi

if [ "$1" == "dl" ]; then
  if [ ! -e "$foxpath/ytdlp" ]; then
    print "${color_red}⚠️ ytdlp is required to use the \"dl\" command"
    foxint-install package ytdlp
  fi
  read -p "🎥 Please enter YouTube URL: " yturl
  if [ "$yturl" == *"/playlist?list="* ]; then
    echo "📄 Playlist detected. Which items do you want to download?"
    read -p "Format: \"first:last\" OR \"all\"" playlistitems
    if [ "$playlistitems" == "all" ]; then
      ytdlp -q --progress -f mp4 --embed-thumbnail -o "%(title)s.%(ext)s" "$yturl"
      print "${color_green}✅ Saved all playlist items to your home folder!"
    else
      ytdlp -q --progress -f mp4 --playlist-items $playlistitems --embed-thumbnail -o "%(title)s.%(ext)s" "$yturl"
      print "${color_green}✅ Saved selected playlist items to your home folder!"
    fi
  else
   ytdlp -q --progress -f mp4 --embed-thumbnail -o "%(title)s.%(ext)s" "$yturl"
   print "${color_green}✅ Saved the video to your home folder! "
  fi
fi
print "${reset}"
