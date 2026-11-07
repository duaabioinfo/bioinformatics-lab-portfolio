# Bioinformatics Lab | Research Portfolio

**Reproducible genomic and metagenomic analyses using public sequencing datasets**

A hands-on bioinformatics portfolio focused on applying computational methods to biological and medical research questions.

My academic background is in Molecular Biology and Medical Biology & Genetics (MSc). These projects document my independent development of practical skills in sequencing-data analysis, statistical genomics, research reproducibility, and biological interpretation.

## About the Researcher

**Duaa Abdulmohsin | MSc Medical Biology & Genetics**

Molecular biology and genetics researcher transitioning into computational biology and bioinformatics.

My background combines graduate-level research, experimental gene-expression analysis, statistical methods, and first-author peer-reviewed research published in 2025.

I am developing reproducible bioinformatics workflows that connect sequencing data processing with biological interpretation and research questions.

**Core areas:** Molecular Genetics · NGS Data Analysis · Genomics · Transcriptomics · Metagenomics · Scientific Computing

**Professional profile:** [LinkedIn](https://www.linkedin.com/in/duaa-abdulmohsin)

## Published Research

**First-author peer-reviewed publication | 2025**

### Does taking L-Carnitine and Cadmium have an impact on gene expression of the liver tissues from rat models?

*Bangladesh Journal of Medical Science*, 24(2), 614–620 (2025).

**DOI:** https://doi.org/10.3329/bjms.v24i2.81728

**Research focus:** Cadmium toxicity, L-carnitine, and the expression of mTOR, Akt1, and Akt2 in rat liver tissue.

**Methods:** RNA extraction, qRT-PCR, statistical analysis, and biological interpretation.

**Key findings:**

- The overall ANOVA for Akt1 was not statistically significant (p = 0.113).
- A reported pairwise comparison between the cadmium-only and cadmium plus L-carnitine groups showed a significant difference in Akt1 expression (p < 0.0001; t = 6.58).
- This pairwise finding requires cautious interpretation because the overall ANOVA was nonsignificant and multiple comparisons may affect statistical inference.

**Research significance:** This publication demonstrates my experience in experimental molecular biology, gene-expression analysis, statistical interpretation, and scientific research. It provides a foundation for my transition into computational genomics and transcriptomics.

---

## Research Projects

| Project | Research focus | Methods | Status |
|---|---|---|---|
| [01 · Human Gut Shotgun Metagenomics](shotgun-metagenomics/) | Microbial community composition in a human gut sample | FastQC, fastp, Bowtie2, SAMtools, Sylph, GTDB | Core analysis completed |
| [02 · Cadmium Exposure RNA-seq](rnaseq/) | Gene-expression responses to cadmium in human liver-derived cell models | Salmon, DESeq2, pathway analysis | In progress |
| [03 · Human Population Genomics](population-genetics/) | Genetic structure and allele-frequency differentiation across reference populations | PLINK2, PCA, Weir-Cockerham FST | Core analysis completed |

## Featured Results

### 01 · Human Gut Microbiome

Shotgun metagenomic reads were processed, screened for human-origin reads, and profiled against GTDB R232.

![Top 20 microbial taxa](shotgun-metagenomics/results/figures/top20_species.svg)

**Selected finding:** The most abundant assigned species-level taxon was *Alistipes putredinis* (7.65%). Results describe one sample and do not establish disease associations.

[Explore the metagenomics project](shotgun-metagenomics/)

### 03 · Human Population Genomics

Chromosome 22 genotypes from 2,504 1000 Genomes Phase 3 participants were analyzed to investigate patterns of population genetic structure and differentiation.

![Population PCA](population-genetics/results/figures/chr22_population_pca.svg)

![Pairwise FST heatmap](population-genetics/results/figures/chr22_fst_heatmap.svg)

**Selected finding:** The highest observed pairwise FST was between AFR and EAS (0.1780); these are chromosome 22 estimates, not genome-wide values.

[Explore the population genomics project](population-genetics/)

## Reproducibility

Project directories contain analysis scripts, selected outputs, figures, and scientific notes. Large raw sequencing datasets and reference databases are not stored in Git.

The workflows are intended as transparent, reproducible learning and research exercises. Analysis limitations and dataset provenance are documented within individual projects.

## Research Interests

- Molecular genetics and functional genomics
- Bioinformatics and next-generation sequencing
- Toxicogenomics and gene expression
- Human genetic variation
- Microbiome research

## Scope

All sequencing datasets are publicly available research data. Interpretations are exploratory, and results should not be used for clinical diagnosis.
