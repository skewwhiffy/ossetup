echo Installing LTS version of node
nvm install --lts

echo Installing GO1.12
gvm install go1.12.13

echo Installing Java v8
jabba install adopt@1.8.0-232

echo Adding Java v8 to jenv
cd ~/.jabba/jdk
jenv add adopt@1.8.0-232

echo Downloading Google Java format file for IntelliJ
cd ~/Downloads
wget https://raw.githubusercontent.com/google/styleguide/gh-pages/intellij-java-google-style.xml
