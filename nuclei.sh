#!/bin/bash


##nuclei -l $1 -t / -o $2/nuclei_scan.txt -stats -vv
#nuclei -l $1 -t cves -o $2/nuclei_cve.txt -stats -vv
#nuclei -l $1 -t misconfiguration/ -o $2/nuclei_misconfig.txt -stats -vv


#nuclei -l $1 -s critical -o $2/nuclei_critical.txt -stats -vv
#nuclei -l $1 -s high -o $2/nuclei_high.txt -stats -vv
nuclei -l $1 -s medium -o $2/nuclei_medium.txt -stats -vv
