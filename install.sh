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

del=0.01
echo ""
sleep $del
echo -e "${bold}${color_red}    ___         ___ __  __ ___  "
sleep $del
echo -e "${bold}${color_red}   | __|____ __/ __|  \/  |   \ "
sleep $del
echo -e "${bold}${color_red}   | _/ _ \ \ / (__| |\/| | |) |"
sleep $del
echo -e "${bold}${color_red}   |_|\___/_\_\\____|_|  |_|___/ ${reset}"
sleep $del
echo -e "${color_red}  Welcome to the FoxCMD installer."
sleep 0.01
echo ""
sleep 0.01
read -n 1 -p "Press enter to confirm or any other key to exit: " confirm
if [ "$confirm" == "" ]; then
  echo
  sleep 0.03
  echo -e "${color_yellow}🦊 Starting FoxCMD installation..."
  sleep 0.3
  mkdir ~/.foxcmd
  chmod a+w ~/.foxcmd
  zshdir="$HOME/.zshrc"
  if grep -s "export PATH=\"\$PATH:\$HOME/.foxcmd\"" "$zshdir"; then
    echo "${color_green}✅ FoxCMD is in your zsh path!"
  else
    echo -e "${color_blue}📖 Adding foxcmd to zsh path..."
    echo -e "export PATH=\"\$PATH:\$HOME/.foxcmd\"" >> .zshrc
  fi
  bashdir="$HOME/.bashrc"
  if grep -s "export PATH=\"\$PATH:\$HOME/.foxcmd\"" "$bashdir"; then
    echo -e "{color_green}✅ FoxCMD is in your bash path!"
  else
    echo -e "${color_blue}📖 Adding foxcmd to bash path..."
    echo -e "export PATH=\"\$PATH:\$HOME/.foxcmd\"" >> .bashrc
  fi
  echo -e "${color_blue}⬇️  Downloading FoxCMD..."
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/fox.sh" -o ~/.foxcmd/fox -#
  curl -fsSL "https://raw.githubusercontent.com/ItsFoxDev/FoxCMD/main/cmd/install.sh" -o ~/.foxcmd/foxint-install -#
  echo -e "${color_blue}📥 Installing FoxCMD..."
  chmod 755 ~/.foxcmd/fox
  chmod 755 ~/.foxcmd/foxint-install
  sleep $del
  echo -e "{color_green}✅ FoxCMD is successfully installed!"
  sleep $del
  echo -e "${color_blue}🏁 To run FoxCMD, restart your terminal, then run ${bold}\"fox\"${reset}"
else
  echo ""
  echo -e "{color_red}❌ Install was cancelled.${reset}"
fi
echo -e
