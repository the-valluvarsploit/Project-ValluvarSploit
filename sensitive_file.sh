
ffuf -u W1/W2 -w ${1}:W1 -w /tools/sensitive-wordlist.txt:W2 -o $2/sensitive.json -e .php,.asp,.bak,.aspx,.config
curl -X POST -H 'Content-type: application/json' --data '{"text":"Run Subdomain Eumeration _*`Completed`*_  - '$DOMAIN'"}' "https://hooks.slack.com/services/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"
