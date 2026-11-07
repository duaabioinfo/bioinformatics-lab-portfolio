#!/usr/bin/env bash

# Project: Human Gut Shotgun Metagenomics
# Sample: VF32
# Step 3: Raw sequencing quality control

set -euo pipefail

# Create output directory
mkdir -p results/fastqc_raw

# Run FastQC on paired-end FASTQ files
fastqc \
    processed_data/SRR6915205_1.fastq \
    processed_data/SRR6915205_2.fastq \
    --threads 2 \
    --outdir results/fastqc_raw
