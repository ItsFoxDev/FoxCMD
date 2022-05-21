echo "🚧 Finishing installation process..."
WORDTOREMOVE=":/opt/foxcmd"
export PATH="${PATH//$WORDTOREMOVE/}"
sleep 0.01
export PATH="$PATH:/opt/foxcmd"
rm /usr/local/bin/fox
echo "🚧 Finishing installation process..."
sleep 0.2
echo "✅ Finished!"
sleep 0.01
echo "🏁 Run \"fox\" to use FoxCMD!"
