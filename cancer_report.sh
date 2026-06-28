#!/bin/bash

echo "======================================="
echo "   CANCER SAMPLES ANALYSIS REPORT"
echo "======================================="
echo ""

echo "--- Sequence counts per sample ---"
for file in ~/bioinformatics/data/cancer_sample*.fasta
do
    sample=$(basename $file)
    count=$(grep ">" $file | wc -l)
    echo "$sample: $count sequences"
done

echo ""
echo "--- Longest sequence per sample ---"
for file in ~/bioinformatics/data/cancer_sample*.fasta
do
    sample=$(basename $file)
    longest=$(grep -v ">" $file | awk '{print length($0)}' | sort -rn | head -1)
    echo "$sample: $longest bases"
done

echo ""
echo "--- Gene frequency across samples ---"
for file in ~/bioinformatics/data/cancer_sample*.fasta
do
    grep ">" $file | cut -d' ' -f1 | tr -d '>'
done | sort | uniq -c | sort -rn

echo ""
echo "--- Genes in ALL samples ---"
for file in ~/bioinformatics/data/cancer_sample*.fasta
do
    grep ">" $file | cut -d' ' -f1 | tr -d '>'
done | sort | uniq -c | awk '$1==5 {print $2, "- POTENTIAL BIOMARKER"}'

echo ""
echo "======================================="
echo "         END OF REPORT"
echo "======================================="
