
DOMAIN=$1
DOMAIN_PATH="/programs/$DOMAIN"
SUBDOMAIN_PATH="$DOMAIN_PATH/subdomains/subdomains_alive.txt"
SERVER_PATH="$DOMAIN_PATH/servers.txt"

mkdir -p $DOMAIN_PATH


if [ $2 -eq 1]; then
	./subdomain_enumeration.sh $DOMAIN
elif [ $2 -eq 2]; then
	./httprobe.sh $SUBDOMAIN_PATH $DOMAIN_PATH
elif [ $2 -eq 3]; then
	./nuclei.sh $SERVER_PATH $DOMAIN_PATH
elif [ $2 -eq 4 ]; then
	./sensitive_file.sh $SERVER_PATH $DOMAIN_PATH
fi
