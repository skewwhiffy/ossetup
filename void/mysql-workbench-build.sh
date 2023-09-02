#!/usr/bin/env bash

# antlr4 from https://github.com/antlr/antlr4/releases
cp -R ./resources/srcpkgs/antlr4-bin ~/code/third.party/void-packages/srcpkgs/

./install.from.void-packages antlr4-bin 'antlr4' ''

target_executable="$HOME/.local/bin/antlr4"
touch "$target_executable"
chmod +x "$target_executable"
echo "#!/usr/bin/env bash" > "$target_executable"
echo "" >> "$target_executable"
echo "java -jar /usr/share/java/antlr4.jar \"\$@\" " >> "$target_executable"

sudo xbps-install -Syu cmake swig
