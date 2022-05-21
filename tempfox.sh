mprog(){
  for ((k = 0; k <= 10 ; k++))
  do
      echo -n "$@ [ "
      for ((i = 0 ; i <= k; i++)); do echo -n "###"; done
      for ((j = i ; j <= 10 ; j++)); do echo -n "   "; done
      v=$((k * 10))
      echo -n " ] "
      echo -n "$v %" $'\r'
      sleep 0.1
  done
  echo
}
WORDTOREMOVE=":/opt/foxcmd"
export PATH="${PATH//$WORDTOREMOVE/}"
sleep 0.01
export PATH="$PATH:/opt/foxcmd"
rm /usr/local/bin/fox
mprog "🚧 Finishing installation process..."
echo "✅ Finished!"
sleep 0.01
echo "🏁 Run \"fox\" to use FoxCMD!"
