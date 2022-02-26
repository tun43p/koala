#!/bin/sh

DIR=$HOME/.koala
KOALA=$DIR/bin/koala.sh
BIN=/usr/local/bin/koala

cat ../src/info.txt

echo "[*] Koala Toolkit Upgrade"

echo "[*] Uninstalling..."
docker container kill tun43p/koala
docker container rm tun43p/koala
docker image rm tun43p/koala
docker image rm kalilinux/kali-rolling

rm -rf $BIN
rm -rf $DIR

echo "[*] Downloading..."
git clone https://github.com/tun43p/koala.git $DIR

echo "[*] Installing..."
chmod +x $KOALA && ln -sf $KOALA $BIN
