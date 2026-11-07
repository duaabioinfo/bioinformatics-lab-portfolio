# RNA-seq Differential Expression Results

Dataset: Bioconductor airway
Comparison: Dexamethasone treated vs untreated
Design: ~ cell + dex

Samples: 8
Genes after filtering: 22369
Significant genes (FDR < 0.05 and |log2FC| >= 1): 1018
Upregulated: 531
Downregulated: 487

## Methods
DESeq2 with cell-line adjustment; Benjamini-Hochberg FDR.
Counts were provided by the airway package.
Raw FASTQ processing was not performed in this analysis.

## Limitations
Eight samples from four cell lines; exploratory analysis.
Gene-level statistical associations do not establish causality.
