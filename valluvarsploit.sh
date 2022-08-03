
DOMAIN=$1
DOMAIN_PATH="/programs/$DOMAIN"
SUBDOMAIN_PATH="$DOMAIN_PATH/subdomains/subdomains_alive.txt"
SERVER_PATH="$DOMAIN_PATH/servers.txt"

mkdir -p $DOMAIN_PATH

if [ -z $DOMAIN ]; then
	echo "Subdomain Enumeration"
	./valluvarsploit.sh example.com 1
        echo "HTTPX Resolve"
        ./valluvarsploit.sh example.com 2
        echo "NUCLEI SCAN"
        ./valluvarsploit.sh example.com 3
        echo "SENSITIVE FILE FUZZ"
        ./valluvarsploit.sh example.com 4
fi


if [ $2 -eq 1 ]; then
	./subdomain_enumeration.sh $DOMAIN
elif [ $2 -eq 2 ]; then
	./httprobe.sh $SUBDOMAIN_PATH $DOMAIN_PATH
elif [ $2 -eq 3 ]; then
	read -p "ENTER MODE (CRITICAL,HIGH,MEDIUM,LOW,INFO,ALL): " MODE
	./nuclei.sh $SERVER_PATH $DOMAIN_PATH $MODE
elif [ $2 -eq 4 ]; then
	./sensitive_file.sh $SERVER_PATH $DOMAIN_PATH
fi
