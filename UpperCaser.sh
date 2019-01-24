#	NAME: UpperCaser.sh
#	AUTHOR: Santiago Garcia Martin
#	CONTACT: s.g.martin94@gmail.com
#	VERSION: 1.0.0
#	ARGUMENTS: SOURCE,DESTINATION
#	SUMMARY:
#	---------------------------------------------------------------	
#	This scripts takes a SOURCE .fasta file as argument and converts all
#	nucleotides to UPPER cases. It ignores the descripion (> or ;) line
#	and saves the resulting file to the DESTINATION argument. 
#	---------------------------------------------------------------

#!/bin/bash


#Var def.
RawData=$1
ResultsFile=$2

#Check for input file
if [ -z "$1" ]
then
	echo "ERROR: Exiting because no  FASTA file was provided..."
	sleep 3
	exit
fi

#If no output is provided, set ResultsFile to default

if [ -z "$2" ]
then
	echo "No output parameter... using UpperFasta.fasta as default"
	ResultsFile="UpperFasta.fasta"
fi

#Replace every line with uppercase characters but those starting with '>' or ';'
sed -e 's/\(^[^>;].*$\)/\U\1/g' "$RawData" > "$ResultsFile"

echo "Results saved"
exit
