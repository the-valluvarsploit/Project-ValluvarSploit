#!/bin/bash

#cat $1 | httpx | tee $2/servers.txt

httpx -l $1 -p 443,3000,7001,7443,8080,8081,8443,9443 -sc -cl -title -web-server -tech-detect -follow-redirects -random-agent -threads 100 -timeout 30 -retries 2 -no-color -silent -o $2/servers_details.txt
cat $2/servers_details.txt | grep "\[200\]" | awk '{print $1}' > servers.txt
