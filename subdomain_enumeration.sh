#!/bin/bash

TOOLS_PATH="/tools"
DOMAIN=$1
SUBDOMAIN="/programs/$DOMAIN/subdomains"

if [ ! -d "$SUBDOMAIN" ]; then
        mkdir -p $SUBDOMAIN

#        wget https://raw.githubusercontent.com/trickest/resolvers/main/resolvers.txt -O $TOOLS_PATH/resolvers.txt
#        sort -R $TOOLS_PATH/resolvers.txt | head -n 25 | anew $TOOLS_PATH/resolvers_25.txt


        #~/go/bin/amass enum -active -d $DOMAIN -rf $TOOLS_PATH/resolvers_25.txt -o $SUBDOMAIN/amass.txt
        ~/go/bin/amass enum -passive -d $DOMAIN -o $SUBDOMAIN/amass.txt

        ~/go/bin/subfinder -d $DOMAIN -all -o $SUBDOMAIN/subfinder.txt

        findomain -t $DOMAIN -u $SUBDOMAIN/findomain.txt

        assetfinder --subs-only $DOMAIN > $SUBDOMAIN/assetfinder.txt

        puredns bruteforce /tools/ct_subdomains.txt $DOMAIN --resolvers $TOOLS_PATH/resolvers.txt -w $SUBDOMAIN/puredns_brute.txt

        cat $SUBDOMAIN/amass.txt $SUBDOMAIN/subfinder.txt $SUBDOMAIN/findomain.txt $SUBDOMAIN/assetfinder.txt $SUBDOMAIN/puredns_brute.txt | anew $SUBDOMAIN/subdomain_temp.txt

        puredns resolve $SUBDOMAIN/subdomain_temp.txt --resolvers $TOOLS_PATH/resolvers.txt  -w $SUBDOMAIN/puredns_temp.txt

        gotator -sub $SUBDOMAIN/puredns_temp.txt -perm $TOOLS_PATH/top-vulnerable-subdomain-names.lst -depth 1 -numbers 10 -mindup -adv -md -silent > $SUBDOMAIN/gotator-perm.txt

        puredns resolve $SUBDOMAIN/gotator-perm.txt --resolvers $TOOLS_PATH/resolvers.txt  -w $SUBDOMAIN/puredns_alter.txt

        cat $SUBDOMAIN/subdomain_temp.txt $SUBDOMAIN/puredns_alter.txt | anew $SUBDOMAIN/subdomains.txt

        puredns resolve $SUBDOMAIN/subdomains.txt --resolvers $TOOLS_PATH/resolvers.txt  -w $SUBDOMAIN/subdomains_alive.txt

	rm $SUBDOMAIN/amass.txt $SUBDOMAIN/subfinder.txt $SUBDOMAIN/findomain.txt $SUBDOMAIN/assetfinder.txt $SUBDOMAIN/puredns_brute.txt $SUBDOMAIN/subdomain_temp.txt $SUBDOMAIN/puredns_temp.txt $SUBDOMAIN/gotator-perm.txt $SUBDOMAIN/puredns_alter.txt
fi
