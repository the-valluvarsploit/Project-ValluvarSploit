#!/bin/bash

DOMAIN=$1

~/go/bin/amass enum -passive -d $DOMAIN -o /programs/$DOMAIN/amass.txt

~/go/bin/subfinder -d $DOMAIN -all -o /programs/$DOMAIN/subfinder.txt

findomain -t $DOMAIN -u /programs/$DOMAIN/findomain.txt

assetfinder --subs-only $DOMAIN > /programs/$DOMAIN/assetfinder.txt

