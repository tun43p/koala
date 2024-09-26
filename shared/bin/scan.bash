#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: $0 <ip_address> <output_file?>"
    exit 1
fi

if [ -z $2 ]; then
    nmap -sC -sV $1
else
    nmap -sC -sV -oN $2 $1
fi