# DNA Sequence Analysis using Biostrings
# Author: Musfirah
# Analyzes GC content, reverse complement, and translation

library(Biostrings)

# Define sequences
seqs <- DNAStringSet(c(
  BRCA1 = "ATGCGATCGATCGATCGATCG",
  TP53 = "GCTAGCTAGCTAGCTAGCTAGC",
  EGFR = "TTGCAATTGCAATTGCAATTGCA"
))

# Print sequences
print(seqs)

# Calculate sequence lengths
cat("\nSequence Lengths:\n")
print(width(seqs))

# Calculate GC content
cat("\nGC Content (%):\n")
gc <- letterFrequency(seqs, "GC", as.prob = TRUE) * 100
print(gc)

# Get reverse complements
cat("\nReverse Complements:\n")
print(reverseComplement(seqs))

cat("\nAnalysis complete!\n")
