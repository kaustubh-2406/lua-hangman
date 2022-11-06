echo "Zipping files..."
zip hangman.zip fonts/* src/* main.lua conf.lua README.md

echo "Renaming..."
mv hangman.zip hangman.love

echo "Replacing the build files"
mv hangman.love ./builds

cd builds

DIR=love

if [ -d "$DIR" ]; then
  echo "Creating windows builds..."
  mkdir temp
  cp love/* temp
  cat temp/love.exe hangman.love > temp/hangman.exe
  cd temp
  zip hangman-windows.zip *
  cp hangman-windows.zip ../
  cd ..
  rm -r temp
  echo "Windows build Complete!"
else 
  echo "If you donot have a love.exe file in your builds directory. Please download the executable from https://www.love2d.org/"
fi
