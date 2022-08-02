
ffuf -u W1/W2 -w ${1}:W1 -w /tools/sensitive-wordlist.txt:W2 -o $2/sensitive.json -e .php,.asp,.bak,.aspx,.config
