#!/bin/sh
echo This script doesn''t work at the moment. Exiting.
exit 1
echo Getting latest version of wkhtmltopdf
filename=$(curl https://github.com/wkhtmltopdf/wkhtmltopdf/releases \
  | grep href \
  | grep deb \
  | grep amd64 \
  | grep buster \
  | grep -oP "href=\"[^ ]*\"" \
  | sed "s/href=\"//" \
  | sed "s/\"//" \
  | sort -r \
  | head -n 1)
url=https://github.com/$filename

echo Downloading latest version of wkhtmltopdf
#rm -f wkhtmltopdf.deb
#wget -O wkhtmltopdf.deb $url

echo Extracting package
rm -rf workspace
mkdir ./workspace
bsdtar -O -xf *.deb data.tar.xz | bsdtar -C ./workspace -xJf -

echo Installing wkhtmltopdf. I might need your password.
sudo cp -r ./workspace/usr/local /usr/
sudo chmod -R 0755 /usr/local

echo Done.
