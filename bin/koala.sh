#!/bin/sh

DIR=$HOME/.koala

# Run
if [ "$1" ]; then
  cat $DIR/src/info.txt
  docker run --rm -h koala -it tun43p/koala /bin/bash

# Build
elif [ "$1" == "-b" ]; then
  cat $DIR/src/info.txt
  docker build --rm --no-cache -t tun43p/koala $DIR/

# Edit
elif [ "$1" == "-e" ]; then
  vim $DIR/Dockerfile

# Help
elif [ "$1" == "-h" ]; then
  cat $DIR/src/info.txt
  cat $DIR/src/help.txt

# Kill
elif [ "$1" == "-k" ]; then
  docker container kill tun43p/koala

# Remove container
elif [ "$1" == "-r" ]; then
  docker container kill tun43p/koala
  docker container rm tun43p/koala

# Remove container and image
elif [ "$1" == "-R" ]; then
  docker container kill tun43p/koala
  docker container rm tun43p/koala
  docker image rm tun43p/koala

# Upgrade
elif [ "$1" == "-u" ]; then
  chmod +x $DIR/bin/upgrade.sh
  sh $DIR/bin/upgrade.sh

# Uninstall
elif [ "$1" == "--uninstall" ]; then
  chmod +x $DIR/bin/uninstall.sh
  sh $DIR/bin/uninstall.sh

# Version
elif [ "$1" == "-v" ]; then
  cat $DIR/src/version.txt

# Unkown argument
else
  echo "Unknown option argument"
fi
