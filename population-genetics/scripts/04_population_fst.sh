#!/usr/bin/env bash
set -euo pipefail
mkdir -p results/fst

plink2 \
  --pfile results/qc/chr22_filtered \
  --pheno results/fst/superpop.tsv \
  --fst SUPERPOP method=wc \
  --threads 2 \
  --memory 5000 \
  --out results/fst/chr22_fst
