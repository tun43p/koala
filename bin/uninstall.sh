#!/bin/sh

DIR=$HOME/.koala
KOALA=$DIR/bin/koala.sh
BIN=/usr/local/bin/koala

cat ../src/info.txt

echo "[*] Koala Toolkit Uninstaller"

echo "[*] Uninstalling..."
docker container kill tun43p/koala
docker container rm tun43p/koala
docker image rm tun43p/koala
docker image rm kalilinux/kali-rolling
rm -rf $BIN
rm -rf $DIR
