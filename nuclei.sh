#!/bin/bash


##nuclei -l $1 -t / -o $2/nuclei_scan.txt -stats -vv
#nuclei -l $1 -t cves -o $2/nuclei_cve.txt -stats -vv
nuclei -l $1 -t misconfiguration/ -o $2/nuclei_misconfig.txt -stats -vv
