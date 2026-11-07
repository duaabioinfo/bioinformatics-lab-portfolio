# Population Genomics — Chromosome 22

## Dataset
- 1000 Genomes Phase 3
- 2,504 individuals across five reference superpopulations

## Methods
- Variant filtering and LD pruning using PLINK2
- Principal component analysis (PCA)
- Weir-Cockerham pairwise FST using 97,216 filtered variants

## Pairwise FST results
| Comparison | FST |
|---|---:|
| AFR vs EAS | 0.17800 |
| AFR vs EUR | 0.13553 |
| AFR vs SAS | 0.12770 |
| AFR vs AMR | 0.12596 |
| EAS vs EUR | 0.10925 |
| AMR vs EAS | 0.08163 |
| EAS vs SAS | 0.07299 |
| EUR vs SAS | 0.03713 |
| AMR vs SAS | 0.03596 |
| AMR vs EUR | 0.02762 |

## Interpretation
The chromosome 22 PCA shows population structure among the reference groups.
FST estimates describe differences in allele frequencies between groups.
These results are exploratory and do not represent genome-wide estimates.
The reference superpopulations do not represent all human diversity.

## Figures
- results/figures/chr22_population_pca.svg
- results/figures/chr22_fst_heatmap.svg
