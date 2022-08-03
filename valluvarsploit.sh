
DOMAIN=$1
DOMAIN_PATH="/programs/$DOMAIN"
SUBDOMAIN_PATH="$DOMAIN_PATH/subdomains/subdomains_alive.txt"
SERVER_PATH="$DOMAIN_PATH/servers.txt"

mkdir -p $DOMAIN_PATH

if [ -z $DOMAIN ]; then
	echo "Subdomain Enumeration"
	echo "./valluvarsploit.sh example.com 1"
        echo "HTTPX Resolve"
        echo "./valluvarsploit.sh example.com 2"
        echo "NUCLEI SCAN"
        echo "./valluvarsploit.sh example.com 3"
        echo "SENSITIVE FILE FUZZ"
        echo "./valluvarsploit.sh example.com 4"
	exit 0
fi


if [ $2 -eq 1 ]; then
	./subdomain_enumeration.sh $DOMAIN
elif [ $2 -eq 2 ]; then
	./httprobe.sh $SUBDOMAIN_PATH $DOMAIN_PATH
	curl -X POST -H 'Content-type: application/json' --data '{"text":"Run HTTPROBE _*`Completed`*_  - '$DOMAIN'"}' "https://hooks.slack.com/services/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"
elif [ $2 -eq 3 ]; then
	read -p "ENTER MODE (CRITICAL,HIGH,MEDIUM,LOW,INFO,ALL): " MODE
	./nuclei.sh $SERVER_PATH $DOMAIN_PATH $MODE
	curl -X POST -H 'Content-type: application/json' --data '{"text":"Run NUCLEI '$MODE' _*`Completed`*_  - '$DOMAIN'"}' "https://hooks.slack.com/services/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"
elif [ $2 -eq 4 ]; then
	./sensitive_file.sh $SERVER_PATH $DOMAIN_PATH
fi
