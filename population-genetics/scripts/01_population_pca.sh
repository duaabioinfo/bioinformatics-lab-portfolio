#!/usr/bin/env bash
set -euo pipefail

VCF="raw_data/ALL.chr22.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz"

echo "=== STEP 1: CONVERSION AND QC ==="

plink2 --vcf "$VCF" \
  --snps-only just-acgt \
  --max-alleles 2 \
  --maf 0.05 \
  --geno 0.05 \
  --mind 0.05 \
  --set-all-var-ids '@:#:$r:$a' \
  --make-pgen \
  --threads 2 \
  --memory 5000 \
  --out results/qc/chr22_filtered

echo "=== STEP 2: LD PRUNING ==="

plink2 --pfile results/qc/chr22_filtered \
  --indep-pairwise 200kb 0.2 \
  --threads 2 \
  --memory 5000 \
  --out results/qc/chr22_ld

echo "=== STEP 3: PCA ==="

plink2 --pfile results/qc/chr22_filtered \
  --extract results/qc/chr22_ld.prune.in \
  --pca 10 approx \
  --threads 2 \
  --memory 5000 \
  --out results/pca/chr22_pca

echo "=== ANALYSIS COMPLETED ==="
head -n 5 results/pca/chr22_pca.eigenvec
