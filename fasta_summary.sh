#!/bin/bash

file=$1

echo "=== FASTA Summary Report ==="
echo "File: $file"
echo ""

seqs=$(grep ">" $file | wc -l)
echo "Total sequences: $seqs"

echo ""
echo "Gene names and lengths:"
paste <(grep ">" $file | cut -d' ' -f1) \
      <(grep -v ">" $file | awk '{print length($0), "bases"}') 

echo ""
bases=$(grep -v ">" $file | tr -d '\n' | wc -c)
echo "Total bases: $bases"

echo ""
echo "=== End of Report ==="
