#!/bin/bash
#first rosalind problem count dna nucleotides
#Usage: bash count_nucleotides.sh <sequence_file>
file=$1
A=$(grep -o 'A' $file | wc -l)
C=$(grep -o 'C' $file | wc -l)
G=$(grep -o 'G' $file | wc -l)
T=$(grep -o 'T' $file | wc -l)

echo "$A $C $G $T"

