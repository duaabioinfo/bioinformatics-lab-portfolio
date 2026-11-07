#!/usr/bin/env bash

# Project: Human Gut Shotgun Metagenomics
# Step 5: Post-trimming quality control

set -euo pipefail

mkdir -p results/fastqc_clean

fastqc \
    processed_data/fastp/SRR6915205_1.clean.fastq.gz \
    processed_data/fastp/SRR6915205_2.clean.fastq.gz \
    --threads 2 \
    --outdir results/fastqc_clean
