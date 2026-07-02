#!/usr/bin/env Rscript
# FASTA Summary Function
# Author: Musfirah
# Usage: Rscript fasta_summary.R <fasta_file>

library(Biostrings)

summarize_fasta <- function(fasta_file) {
  seqs <- readDNAStringSet(fasta_file)
  gc <- as.numeric(letterFrequency(seqs, "GC", as.prob=TRUE) * 100)
  gene_names <- names(seqs)
  
  cat("=== FASTA Summary Report ===\n")
  cat("File:", fasta_file, "\n")
  cat("Total sequences:", length(seqs), "\n\n")
  cat("Gene\t\tLength\tGC%\n")
  cat("----\t\t------\t---\n")
  
  for(i in 1:length(seqs)) {
    cat(gene_names[i], "\t", width(seqs)[i], "\t",
        round(gc[i], 1), "%\n")
  }
  
  cat("\nHighest GC:", gene_names[which.max(gc)], "\n")
  cat("Lowest GC:", gene_names[which.min(gc)], "\n")
  cat("Average GC:", round(mean(gc), 1), "%\n")
}

# Get filename from command line
args <- commandArgs(trailingOnly=TRUE)
summarize_fasta(args[1])

