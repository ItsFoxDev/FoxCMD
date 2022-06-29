# The clean command that was removed from FoxCMD

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
    print "${color_green}✅ Cleaned your computer's cache!"
    echo ""
fi
