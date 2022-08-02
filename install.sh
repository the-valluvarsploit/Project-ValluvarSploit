TOOLS_PATH="/tools"

GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[1;36m'
RESET='\033[0m'

installBanner(){
   tool=$1
   printf "${YELLOW}\n[+] Installing $tool...${RESET}\n"
}

apt install unzip -y
apt install gcc -y
apt install make -y

# GOLANG
if ! command -v go >/dev/null 2>&1; then
        LATEST_GO=$(wget -qO- https://golang.org/dl/ | grep -oP 'go([0-9\.]+)\.linux-amd64\.tar\.gz' | head -n 1 | grep -oP 'go[0-9\.]+' | grep -oP '[0-9\.]+' | head -c -2)
        wget -q https://dl.google.com/go/go$LATEST_GO.linux-amd64.tar.gz -O $TOOLS_PATH/go$LATEST_GO.tar.gz
        sudo tar -C /usr/local -xzf $TOOLS_PATH/go$LATEST_GO.tar.gz
        echo "" >> ~/.bashrc
        echo "# Go variables" >> ~/.bashrc
        echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
        echo 'export GOPATH=$HOME/go' >> ~/.bashrc
        echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH' >> ~/.bashrc
        source ~/.bashrc
        go version
fi

# AMASS
if [ ! -e $HOME/go/bin/amass ]; then
   installBanner "Amass"
   go install -v github.com/OWASP/Amass/v3/...@master
fi

# SUBFINDER
if [ ! -e $HOME/go/bin/subfinder ]; then
   installBanner "Subfinder"
   go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest   
fi

# ASSETFINDER
if [ ! -e $HOME/go/bin/assetfinder ]; then
   installBanner "Assetfinder"
   go install -v github.com/tomnomnom/assetfinder@latest
fi

# FINDOMAIN
if [ ! -e /usr/bin/findomain ]; then
   installBanner "Findomain"
   curl -L https://github.com/Findomain/Findomain/releases/latest/download/findomain-linux.zip -o $TOOLS_PATH/findomain_latest.zip
   unzip -o $TOOLS_PATH/findomain_latest.zip -d $TOOLS_PATH
   chmod +x $TOOLS_PATH/findomain
   mv $TOOLS_PATH/findomain /usr/bin/findomain
fi

# MASSDNS
if [ ! -e $TOOLS_PATH/massdns/bin/massdns 2>/dev/null ]; then
   installBanner "Massdns"
   git clone https://github.com/blechschmidt/massdns.git $TOOLS_PATH/massdns
   cd $TOOLS_PATH/massdns
   make 
   cp bin/massdns /usr/local/bin
   cd $TOOLS_PATH
fi

# PUREDNS
if [ ! -e $HOME/go/bin/puredns ]; then
   installBanner "PureDNS"
   go install github.com/d3mondev/puredns/v2@latest
fi

# GOTATOR
if [ ! -e $HOME/go/bin/gotator ]; then
   installBanner "GOtator"
   go install github.com/Josue87/gotator@latest
fi

# ANEW
if [ ! -e $HOME/go/bin/anew ]; then
   installBanner "Anew"
   go install -v github.com/tomnomnom/anew@latest
fi

# HTTPROBE
if [ ! -e $HOME/go/bin/httprobe ]; then
   installBanner "HTTPROBE"
   go install github.com/tomnomnom/httprobe@latest
fi


if [ ! -e $HOME/go/bin/nuclei ]; then
   installBanner "Nuclei Engine"
   go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
fi

# Wordlist
#wget https://raw.githubusercontent.com/internetwache/CT_subdomains/master/top-100000.txt -O /tmp/ct_temp.txt

#cat /tmp/ct_temp.txt | cut -d"," -f 2 > $TOOLS_PATH/ct_subdomains.txt

#cp wordlist/top-vulnerable-subdomain-names.lst $TOOLS_PATH/
