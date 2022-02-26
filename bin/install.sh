#!/bin/sh

DIR=$HOME/.koala
KOALA=$DIR/bin/koala.sh
BIN=/usr/local/bin/koala

cat ../src/info.txt

echo "[*] Koala Toolkit Installer"

echo "[*] Downloading..."
git clone https://github.com/tun43p/koala.git $DIR

echo "[*] Installing..."
chmod +x $KOALA && ln -sf $KOALA $BIN

echo "[*] Building..."
docker build --rm --no-cache -t tun43p/koala $DIR/
