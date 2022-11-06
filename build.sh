echo "Zipping files..."
zip hangman.zip fonts/* src/* main.lua README.md

echo "Renaming..."
mv hangman.zip hangman.love

echo "Replacing the build files"
mv hangman.love ./builds

cd builds

FILE=./love.exe

if [ -f "$FILE" ]; then
  echo "Creating windows builds..."
  cat ./love.exe hangman.love > hangman-windows.exe
  echo "Windows build Complete!"
else 
  echo "If you donot have a love.exe file in your builds directory. Please download the executable from https://www.love2d.org/"
fi