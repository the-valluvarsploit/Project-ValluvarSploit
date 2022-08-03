#!/bin/bash



if [ $3 == "CRITICAL" ]; then
	echo "Running CRITICAL"
#	nuclei -l $1 -s critical -o $2/nuclei_critical.txt -stats -vv
elif [ $3 == "HIGH" ]; then
	nuclei -l $1 -s high -o $2/nuclei_high.txt -stats -vv
elif [ $3 == "MEDIUM" ]; then
	nuclei -l $1 -s medium -o $2/nuclei_medium.txt -stats -vv
elif [ $3 == "LOW" ]; then
	nuclei -l $1 -s low -o $2/nuclei_low.txt -stats -vv
elif [ $3 == "INFO" ]; then
	nuclei -l $1 -s info -o $2/nuclei_info.txt -stats -vv
elif [ $3 == "ALL" ]; then
        nuclei -l $1 -t / -o $2/nuclei_scan.txt -stats -vv
fi

