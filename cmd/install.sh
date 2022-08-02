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
  echo "⬇️  yt-dlp      • Better youtube-dl"
  sleep $del
  echo "🐍 python      • Popular coding language"
fi
if [ "$1" == "package" ]; then
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
    if [ ! -e "$foxpath/python" ]; then
      if [ ! -e "/usr/bin/python3" ]; then
        echo "⚠️ Python is required to install youtube-dl."
        sleep $del
        echo "🔧 Installing python now..."
        foxint-install python -s
      fi
    echo "🔗 Creating python symlink..."
    sleep $del
    echo "🔑 You may need to enter your password."
    sleep $del
    sudo ln -s /usr/bin/python3 $foxpath/python
    fi
    
    if [ "$3" == "-s" ]; then
      curl -L -s https://yt-dl.org/downloads/latest/youtube-dl -o $foxpath/youtube-dl
      chmod a+rx $foxpath/youtube-dl
    else
      echo ""
      echo "⬇️  Downloading youtube-dl"
      curl -L https://yt-dl.org/downloads/latest/youtube-dl -o $foxpath/youtube-dl
      echo "📥 Installing youtube-dl"
      sudo chmod a+rx $foxpath/youtube-dl
      echo ""
      sleep $del
      echo "✅ Installed youtube-dl"
    fi
  fi
  if [ "$2" == "ytdlp" ]; then
    if [ "$3" == "-s" ]; then
      curl -fsSL https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o $foxpath/ytdlp
      chmod +x $foxpath/ytdlp
    else
      echo ""
      echo "⬇️  Downloading yt-dlp"
      curl -fsSL https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o $foxpath/ytdlp
      echo "📥 Installing yt-dlp"
      chmod +x $foxpath/ytdlp
      echo ""
      sleep $del
      echo "✅ Installed yt-dlp"
    fi
  fi
  if [ "$2" == "python" ]; then
    if [ "$3" == "-s" ]; then
      curl -s -L https://www.python.org/ftp/python/3.10.4/python-3.10.4-macos11.pkg -o ~/python.pkg
      sudo installer -pkg '~/python.pkg' -target /
      rm "~/python.pkg"
      sudo ln -s /usr/bin/python3 $foxpath/python
      
    else
      echo ""
      echo "⬇️  Downloading Python"
      curl -L https://www.python.org/ftp/python/3.10.4/python-3.10.4-macos11.pkg -o ~/python.pkg -#
      echo "📥 Installing Python"
      sudo installer -pkg '~/python.pkg' -target /
      echo "🫧 Cleaning up"
      rm "~/python.pkg"
      echo "🔗 Creating python symlink..."
      sleep $del
      echo "🔑 You may need to enter your password."
      sleep $del
      sudo ln -s /usr/bin/python3 $foxpath/python
      echo ""
      sleep $del
      echo "✅ Installed Python!"
    fi
  fi
  if [ "$2" == "ffmpeg" ]; then
    echo ""
    if [ "$3" == "-s" ]; then
      echo "📥 Downloading ffmpeg..."
      curl -fsSL "https://evermeet.cx/ffmpeg/getrelease/zip" -o $foxpath/ffmpeg.zip
      unzip -o -q $foxpath/ffmpeg.zip -d $foxpath
      chmod +x $foxpath/ffmpeg
      echo "📥 Downloading ffprobe..."
      curl -fsSL "https://evermeet.cx/ffmpeg/getrelease/ffprobe/zip" -o $foxpath/ffprobe.zip
      unzip -o -q $foxpath/ffprobe.zip -d $foxpath
      chmod +x $foxpath/ffprobe
      echo "📥 Downloading ffplay..."
      curl "https://evermeet.cx/ffmpeg/getrelease/ffplay/zip" -o $foxpath/ffplay.zip
      unzip -o -q $foxpath/ffplay.zip -d $foxpath
      chmod +x $foxpath/ffplay
      rm $foxpath/ffmpeg.zip
      rm $foxpath/ffplay.zip
      rm $foxpath/ffprobe.zip
    else
      echo "ℹ️  Note: This may take a while."
      echo "It may not seem like it is doing anything, but it is."
      echo ""
      echo "📥 Downloading ffmpeg..."
      curl "https://evermeet.cx/ffmpeg/ffmpeg-5.0.zip" -o $foxpath/ffmpeg.zip -#
      echo "📥 Installing ffmpeg..."
      unzip -o -q $foxpath/ffmpeg.zip -d $foxpath/
      echo "🚦 Verifying..."
      chmod +x $foxpath/ffmpeg
      echo ""
      echo "📥 Downloading dependency ffprobe..."
      curl "https://evermeet.cx/ffmpeg/ffprobe-5.0.zip" -o $foxpath/ffprobe.zip -#
      echo "📥 Installing ffprobe..."
      unzip -o -q $foxpath/ffprobe.zip -d $foxpath/
      echo "🚦 Verifying..."
      chmod +x $foxpath/ffprobe
      echo ""
      echo "📥 Downloading dependency ffplay..."
      curl "https://evermeet.cx/ffmpeg/ffplay-5.0.zip" -o $foxpath/ffplay.zip -#
      echo "📥 Installing ffplay..."
      unzip -o -q $foxpath/ffplay.zip -d $foxpath/
      echo "🚦 Verifying..."
      chmod +x $foxpath/ffplay
      echo ""
      echo "🧼 Cleaning up..."
      rm $foxpath/ffmpeg.zip
      rm $foxpath/ffplay.zip
      rm $foxpath/ffprobe.zip
      echo ""
      echo "✅ Installed ffmpeg!"
    fi
  fi
  if [ "$2" == "npm" ] || [ "$2" == "nodejs" ]; then
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
    fi
  fi
fi
