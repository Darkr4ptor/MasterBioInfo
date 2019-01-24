#	NAME: CpG analyser.sh
#	AUTHOR: Santiago Garcia Martin
#	CONTACT: s.g.martin94@gmail.com
#	VERSION: 1.0.0
#	ARGUMENTS: SOURCE .fasta file
#	SUMMARY:
#	---------------------------------------------------------------	
#	This scripts takes a SOURCE .fasta file as argument and 
#	displays the number of nucleotides, number of guanines
#	and citosines and finally, the amount of CpG islands 
#	---------------------------------------------------------------

#!/bin/bash


#Var def.
RawData=$1

#Check for input file
if [ -z "$1" ]
then
	echo "ERROR: Exiting because no  FASTA file was provided..."
	sleep 3
	exit
fi

echo "Begining analysis..."

#cheap trick: first grep selects all lines but those starting with > or ;
# next grep displays all acgtu or ACGTU occurrences as lines
# WC -l counts lines
# sed part is lazy stuff

NucleotideCount=$(grep -e '^[^>;]' "$RawData" | grep -o -e '[actguACGTU]' | wc -l)
GuanineCount=$(grep -e '^[^>;]' "$RawData" | grep -o -e '[gG]' | wc -l)
CitosineCount=$(grep -e '^[^>;]' "$RawData" | grep -o -e '[cC]' | wc -l)
CGCount=$(grep -e '^[^>;]' "$RawData" | sed -e 's/\(.*\)/\U\1/g' | grep -o -e 'CG' | wc -l)

echo "Nucleotide count:  $NucleotideCount"
echo "Guanine count:     $GuanineCount"
echo "Citosine count:     $CitosineCount"
echo "CG occurrences: $CGCount"
