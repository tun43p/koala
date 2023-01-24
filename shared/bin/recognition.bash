#!/usr/bin/env bash

RECON_DIR=/home/koala/tmp/recon

function log {
  NO_COLOR='\033[0m'
  
  ERROR_COLOR='\033[0;31m'
  SUCCESS_COLOR='\033[0;32m'

  if [[ "$1" =~ .*"ERROR".* ]]; then
    printf "$ERROR_COLOR$1$NO_COLOR\n"
    exit 1
  else
    printf "$SUCCESS_COLOR$1$NO_COLOR\n"
  fi
}

if [[ $(id -u) != 0 ]]; then
  log "ERROR: This script requires root privileges."
elif [ -z $1 ]; then 
  log "ERROR: You must pass the target IP address."
elif ! [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  log "ERROR: Please specify a valid IP address."
fi

TARGET_IP=$1
log "The target IP address is $TARGET_IP."

mkdir $RECON_DIR
nmap -v -sS -oN $RECON_DIR/nmap.txt $TARGET_IP
cat $RECON_DIR/nmap.txt