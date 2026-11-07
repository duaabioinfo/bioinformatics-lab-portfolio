suppressPackageStartupMessages({
  library(airway)
  library(DESeq2)
  library(ggplot2)
  library(pheatmap)
})

data("airway")
airway$dex <- relevel(factor(airway$dex), ref="untrt")

# Differential expression, accounting for cell-line differences
dds <- DESeqDataSet(airway, design=~cell+dex)
dds <- dds[rowSums(counts(dds)) >= 10, ]
dds <- DESeq(dds)

res <- results(dds, contrast=c("dex","trt","untrt"))
res <- res[order(res$padj, na.last=TRUE), ]

tab <- as.data.frame(res)
tab$gene_id <- rownames(tab)
write.csv(tab, "results/tables/differential_expression.csv",
          row.names=FALSE)

meta <- as.data.frame(colData(dds))
meta$sample_id <- rownames(meta)
write.csv(meta, "results/tables/sample_metadata.csv",
          row.names=FALSE)

sig <- !is.na(tab$padj) & tab$padj < 0.05 &
       abs(tab$log2FoldChange) >= 1

# PCA
vsd <- vst(dds, blind=FALSE)
pca <- plotPCA(vsd, intgroup=c("dex","cell"), returnData=TRUE)
variance <- round(100 * attr(pca,"percentVar"))

p1 <- ggplot(pca, aes(PC1, PC2, color=dex, shape=cell)) +
  geom_point(size=3) +
  labs(title="RNA-seq PCA: Dexamethasone treatment",
       x=paste0("PC1: ",variance[1],"%"),
       y=paste0("PC2: ",variance[2],"%")) +
  theme_bw()

ggsave("results/figures/pca.png",p1,width=8,height=5,dpi=160)

# Volcano plot
vol <- tab[!is.na(tab$pvalue) &
           !is.na(tab$log2FoldChange), ]
vol$group <- ifelse(
  !is.na(vol$padj) & vol$padj < 0.05 &
  abs(vol$log2FoldChange) >= 1,
  "Significant","Other"
)

p2 <- ggplot(vol, aes(log2FoldChange,
                      -log10(pmax(pvalue,1e-300)),
                      color=group)) +
  geom_point(alpha=0.5,size=0.7) +
  scale_color_manual(values=c(Other="grey65",
                              Significant="#C44E52")) +
  labs(title="Differential expression: Volcano plot",
       x="Log2 fold change (treated vs untreated)",
       y="-Log10 p-value") +
  theme_bw()

ggsave("results/figures/volcano.png",p2,
       width=8,height=5,dpi=160)

# Heatmap of top differentially expressed genes
selected <- tab$gene_id[sig]
if (length(selected) >= 2) {
  selected <- head(selected,30)
  mat <- assay(vsd)[selected,,drop=FALSE]
  mat <- t(scale(t(mat)))

  annotation <- as.data.frame(
    colData(dds)[,c("dex","cell"),drop=FALSE]
  )

  pheatmap(mat,annotation_col=annotation,
           filename="results/figures/heatmap.png",
           width=9,height=7)
}

# Summary and software versions
summary_lines <- c(
  "# RNA-seq Differential Expression Results",
  "",
  "Dataset: Bioconductor airway",
  "Comparison: Dexamethasone treated vs untreated",
  "Design: ~ cell + dex",
  "",
  paste("Samples:",ncol(dds)),
  paste("Genes after filtering:",nrow(dds)),
  paste("Significant genes (FDR < 0.05 and |log2FC| >= 1):",
        sum(sig)),
  paste("Upregulated:",sum(sig & tab$log2FoldChange > 0)),
  paste("Downregulated:",sum(sig & tab$log2FoldChange < 0)),
  "",
  "## Methods",
  "DESeq2 with cell-line adjustment; Benjamini-Hochberg FDR.",
  "Counts were provided by the airway package.",
  "Raw FASTQ processing was not performed in this analysis.",
  "",
  "## Limitations",
  "Eight samples from four cell lines; exploratory analysis.",
  "Gene-level statistical associations do not establish causality."
)

writeLines(summary_lines,"results/analysis_summary.md")
writeLines(capture.output(sessionInfo()),
           "results/session_info.txt")

cat("\n=== ANALYSIS COMPLETED ===\n")
cat(paste(summary_lines,collapse="\n"),"\n")
