#!/bin/bash

cat $1 | httprobe | tee $2/servers.txt
