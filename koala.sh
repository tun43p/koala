#!/bin/bash

DIR=$PWD

echo $PWD

# Start
if [ "$1" == "-s"]; then
  cat $DIR/src/info.txt
  docker run --rm -v $DIR/shared:/root/shared -h koala -it tun43p/koala /bin/bash

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

# Remove container and images
elif [ "$1" == "-R" ]; then
  docker container kill tun43p/koala
  docker container rm tun43p/koala
  docker image rm tun43p/koala
  docker image rm kalilinux/kali-rolling

# Upgrade
elif [ "$1" == "-u" ]; then
  cd $DIR && git pull origin main

# Version
elif [ "$1" == "-v" ]; then
  cat $DIR/src/version.txt

# Unkown argument
else
  echo "Unknown option argument"
fi
