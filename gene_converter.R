#!/usr/bin/env Rscript
# Gene ID Converter using BioMart
# Author: Musfirah
# Usage: source this file then call convert_genes()

library(biomaRt)

convert_genes <- function(gene_list, 
                           input_type="hgnc_symbol",
                           mirror="useast") {
  
  cat("Connecting to Ensembl...\n")
  mart <- useEnsembl("ensembl",
                     dataset="hsapiens_gene_ensembl",
                     mirror=mirror)
  
  cat("Converting", length(gene_list), "genes...\n")
  
  result <- getBM(attributes=c("ensembl_gene_id",
                                "entrezgene_id",
                                "hgnc_symbol",
                                "description"),
                  filters=input_type,
                  values=gene_list,
                  mart=mart)
  
  cat("Done! Converted", nrow(result), "genes.\n")
  return(result)
}

