#!/bin/sh
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
rm -f wkhtmltopdf.deb
wget -O wkhtmltopdf.deb $url
exit 1

echo Extracting package
rm -rf workspace
mkdir ./workspace
bsdtar -O -xf *.deb data.tar.xz | bsdtar -C ./workspace -xJf -

echo Installing nordvpn. I might need your password.
sudo cp -r ./workspace/var/* /var
sudo cp -r ./workspace/usr/bin /usr/bin
sudo cp -r ./workspace/usr/sbin/* /usr/sbin/
sudo cp -r ./workspace/usr/lib /usr/sbin
sudo chmod 0755 /usr/bin/nordvpn

echo Done.
echo To run as a daemon: sudo nordvpnd
echo nordvpn should be installed.
