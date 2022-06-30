#!/bin/bash

# ╔═[ 📄 LICENSE ]════════════════════════════════════════════════╗
# ║ This software is licensed under the Alofsto General Public    ║
# ║ License. It can be viewed at https://bit.ly/agplraw.          ║
# ╚═══════════════════════════════════════════════════════════════╝

# ===[ 🎨 COLOUR SETUP ]====================== #
color_black="\033[30m"; color_red="\033[31m"; color_green="\033[32m"; color_yellow="\033[33m"; color_blue="\033[34m"; color_magenta="\033[35m"; color_pink="\033[35m"; color_cyan="\033[36m"; color_white="\033[37m"
bgcolor_black="\033[40m";bgcolor_red="\033[41m"; bgcolor_green="\033[42m"; bgcolor_yellow="\033[43m"; bgcolor_blue="\033[44m"; bgcolor_magenta="\033[45m"; bgcolor_pink="\033[45m"; bgcolor_cyan="\033[46m"; bgcolor_white="\033[47m"
bold="\033[1m"; italic="\033[3m"; underline="\033[4m"; strikethrough="\033[9m"; reset="\033[0m"
# ============================================ #

foxpath="$HOME/.foxcmd"
del=0.01
ver="4.6.7"
if [ -z "$1" ]; then
  echo -e ""
  echo -e "🦊 FoxCMD v$ver"
  sleep $del
  echo -e ""
  sleep $del
  echo -e "${bold}===== 📄 Commands =======================================${reset}"
  sleep $del
  echo -e "⬇️  install <package> [-c] • Installs a package"
  sleep $del
  echo -e "📦 list                   • Lists installable packages"
  sleep $del
  echo -e "👀 hdi <y/n> [o]          • Hides icons on your desktop" 
  sleep $del
  echo -e "⭐️ starwars               • Watch ascii starwars"
  sleep $del
  echo -e "🔆 clean                  • Cleans your mac's cache"
  sleep $del
  echo -e "⬇️  dl                     • Downloads a youtube video"
  sleep $del
  echo -e "🤖 aiperson <count>       • Bulk fetches thispersondoesnotexist.com"
  sleep $del
  echo -e "🔧 tweak <list/tweak>     • Simple tweaks for your mac"
  sleep $del
  echo -e ""
  sleep $del
  echo -e "⬆️  update                 • Updates FoxCMD" 
  sleep $del
  echo -e "❌ remove                 • Removes FoxCMD from your computer"
  echo -e ""
  sleep $del
  echo -e "Command syntax: ${color_blue}\$ fox <command> <arguments>${reset}"
  sleep $del
  echo -e "Arguments: ${color_green}[optional] ${color_yellow}<required>"
  sleep $del
fi

# Redirects "install" and "list" commands to seperate command manager
if [ "$1" == "install" ]; then
  foxint-install $1 $2 $3 $4 $5
fi

if [ "$1" == "list" ]; then
  foxint-install list;
fi

if [ "$1" == "remove" ]; then
  read -p "⛔️ Are you sure you want to uninstall FoxCMD and it's standalone CLIs? y/n: " confirm
  if [ "$confirm" == "y" ]; then
    sed -i '/export PATH=\"\$PATH:$foxpath\"/d' .zshrc
    sed -i '/export PATH=\"\$PATH:$foxpath\"/d' .bashrc
    rm -r $foxpath
    echo -e "${color_green}✅ Completely uninstalled FoxCMD from your computer."
  elif [ "$confirm" == "n" ]; then
    echo -e "${color_red}❌ Uninstall canceled."
  else
    echo -e "${color_red}❌ Please enter either \"y\" or \"n\"."
  fi
fi
if [ "$1" == "update" ]; then
  echo -e ""
  sleep $del
  echo -e "${color_blue}⬇️  Downloading FoxCMD"
  sleep $del
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/fox.sh" -o $foxpath/fox
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/cmd/install.sh" -o $foxpath/foxint-install
  echo -e "${color_blue}📥 Installing FoxCMD..."
  sleep $del
  chmod 755 $foxpath/fox
  chmod 755 $foxpath/foxint-install
  echo -e "${color_green}✅ FoxCMD v2 is has been successfully updated!"
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
    echo -e "${color_green}✅ Hid desktop icons. To unhide, run \"fox hdi n\"" 
  fi
  if [ "$2" == "n" ]; then
    chflags nohidden ~/Desktop/*
    defaults write com.apple.finder CreateDesktop true
    echo -e "${color_green}✅ Unhid desktop icons. To hide, run \"fox hdi y\"" 
  fi
  if [ -z "$2" ]; then
    echo -e "${color_red}❌ Please use \"fox hdi y\" or \"fox hdi n\""
  fi
fi
if [ "$1" == "starwars" ]; then
  echo -e "${color_yellow}⭐️ Loading starwars. To exit, press CTRL+C"
  sleep 1
  nc towel.blinkenlights.nl 23
fi

if [ "$1" == "aiperson" ]; then
  if [ $2q 0 ]; then
    echo -e "${color_red}❌ Please enter a valid number"
    sleep $del
    echo -e "Syntax: \"fox aiperson <number of people>\""
  fi
  echo -e ""
  echo -e "${color_blue}🏁 Setting things up..."
  echo -e ""
  mkdir ~/people
  sleep 0.1
  echo -e "${color_blue}🌐 Connecting to thispersondoesnotexist.com"
  sleep 0.1
  echo -e ""
  count=1
  for i in $(seq $2)
  do
    echo -e "${color_blue}⬇️ Downloading image $count/$2"
    curl -fsSL "https://thispersondoesnotexist.com/image" -o ~/people/$count.jpg
    sleep 0.5
    count=$((count+1))
  done
  echo -e ""
  echo -e "${color_blue}📂 Zipping files to desktop..."
  cd ~/people
  zip -q ~/Desktop/people.zip ./*
  sleep 0.3
  echo -e "${color_blue}🧼 Cleaning up..."
  cd
  rm -r ~/people
  echo -e ""
  echo -e "${color_green}✅ Saved $2 people to your desktop!"
fi
if [ "$1" == "tweak" ]; then
  if [ "$2" == "list" ] || [  -z "$2" ]; then
    echo -e "${bold}===== 🔧 Tweak list =====================================${reset}"
    sleep $del
    echo -e "🗂  openline [n]      • Adds a divider between open apps"
    sleep $del
    echo -e "💨 suck [n]          • Enables the hidden suck animation"
    sleep $del
    echo -e "⏩ instadock [n]     • Removes the delay on dock reveal"
    sleep $del
    echo -e "🗑  resetdock         • Resets your mac's dock"
    sleep $del
    echo -e "🪐 addspace [s]      • Adds a spacer to your dock"
    sleep $del
    echo -e ""
    sleep $del
    echo -e "Command syntax: \"fox tweak <tweak name>\" "
    sleep $del
    echo -e "${color_blue}ℹ️ Add \"n\" to the end of the command to disable the tweak."
  fi
  if [ "$2" == "openline" ]; then
    if [ "$3" == "n" ]; then
      defaults write com.apple.dock show-recents -bool true;
      defaults write com.apple.dock show-recent-count -int 3;
      killall Dock
      echo -e "${color_green}✅ Disabled the openline tweak."
    else
      defaults write com.apple.dock show-recents -bool true;
      defaults write com.apple.dock show-recent-count -int 0;
      killall Dock
      echo -e "${color_green}✅ Enabled the openline tweak."
    fi
  fi
  if [ "$2" == "suck" ]; then
    if [ "$3" == "n" ]; then
      defaults write com.apple.dock mineffect genie
      killall Dock
      echo -e "${color_green}✅ Disabled the suck animation."
    else
      defaults write com.apple.dock mineffect suck
      killall Dock
      echo -e "${color_green}✅ Enabled the suck animation."
    fi
  fi
  if [ "$2" == "resetdock" ]; then
    read -p "Are you sure you want to reset your dock? y/n: " confirm
    if [ "$confirm" == "y" ]; then
      defaults delete com.apple.dock
      killall Dock
      echo -e "${color_green}✅ Reset your dock to system defaults."
    elif [ "$confirm" == "n" ]; then
      echo -e "${color_red}❌ Dock reset canceled."
    else
      echo -e "${color_red}❌ Please enter either \"y\" or \"n\"."
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
    echo -e "${color_green}✅ Added a spacer to your dock."
    echo -e "${color_blue}ℹ️  If it didn't work, you may have to run the command again."
  fi
  if [ "$2" == "instadock" ]; then
    if [ "$3" == "n" ]; then
      defaults delete com.apple.Dock autohide-delay
      killall Dock
      echo -e "${color_green}✅ Disabled instant dock reveal."
    else
      defaults write com.apple.Dock autohide-delay -float 0
      killall Dock
      echo -e "${color_green}✅ Enabled instant dock reveal."
    fi
  fi
fi

if [ "$1" == "dl" ]; then
  if [ ! "$foxpath/ytdlp" ]; then
    echo -e "${color_red}⚠️ ytdlp is required to use the \"dl\" command"
    foxint-install package ytdlp
  fi
  read -p "🎥 Please enter YouTube URL: " yturl
  if [ "$yturl" == *'/playlist?list='* ]; then
    echo -e "${color_blue}📄 Playlist detected. Which items do you want to download?"
    read -p "Format: \"first:last\" OR \"all\"" playlistitems
    if [ "$playlistitems" == "all" ]; then
      ytdlp -q --progress -f mp4 --embed-thumbnail -o '%(title)s.%(ext)s' "$yturl"
      echo -e "${color_green}✅ Saved all playlist items to your home folder!"
    else
      ytdlp -q --progress -f mp4 --playlist-items $playlistitems --embed-thumbnail -o '%(title)s.%(ext)s' "$yturl"
      echo -e "${color_green}✅ Saved selected playlist items to your home folder!"
    fi
  else
   ytdlp -q --progress -f mp4 --embed-thumbnail -o '%(title)s.%(ext)s' "$yturl"
   echo -e "${color_green}✅ Saved the video to your home folder! "
  fi
fi
echo -e "${reset}"
