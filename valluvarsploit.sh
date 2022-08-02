
DOMAIN=$1
DOMAIN_PATH="/programs/$DOMAIN"
SUBDOMAIN_PATH="$DOMAIN_PATH/subdomains/subdomains_alive.txt"
SERVER_PATH="$DOMAIN_PATH/servers.txt"

mkdir -p $DOMAIN_PATH


#./subdomain_enumeration.sh $DOMAIN
#./httprobe.sh $SUBDOMAIN_PATH $DOMAIN_PATH
#./nuclei.sh $SERVER_PATH $DOMAIN_PATH
./sensitive_file.sh $SERVER_PATH $DOMAIN_PATH
