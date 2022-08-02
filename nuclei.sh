#!/bin/bash


nuclei -l $1 -t / -o $2/nuclei_scan.txt -stats -vv
