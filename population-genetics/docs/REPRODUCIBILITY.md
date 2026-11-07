# Reproducibility Documentation

## Data
- 1000 Genomes Project Phase 3
- Chromosome 22
- Samples: 2,504
- Superpopulations: AFR, AMR, EAS, EUR, SAS

## Workflow
1. VCF conversion and variant filtering using PLINK2
2. MAF threshold: 0.05
3. Missingness thresholds: 0.05
4. LD pruning: 200 kb, r-squared 0.2
5. PCA: First 10 principal components
6. Pairwise Weir-Cockerham FST
7. Python visualizations

## Scripts
- `scripts/01_population_pca.sh`
- `scripts/02_plot_pca.py`
- `scripts/04_population_fst.sh`
- `scripts/03_plot_fst.py`

Run scripts from the project directory in workflow order.
The original chromosome 22 VCF and matching sample
metadata are needed to regenerate genotype files.
Python plotting dependencies are also required.

## Recorded Results
- Filtered SNPs: 97,216
- LD-pruned SNPs: 5,954
- Population pairs: 10
- Highest pairwise FST: AFR-EAS, approximately 0.178

## Reproducibility Verification
- FST was recomputed using PLINK2.
- All 10 stored FST estimates matched exactly.
- Maximum observed absolute difference: 0.0
- Verification version: PLINK2 v2.0.0-a.7.13
- PCA was recomputed successfully using 2,504 samples
  and 5,954 variants.
- PCA coordinates were not independently compared.

## Evidence
- `results/project3_summary.md`
- `results/pca/`
- `results/fst/`
- `results/figures/`

## Limitations
The analysis covers chromosome 22 only.
Population labels are broad reference categories.
The findings are descriptive, not clinical.
