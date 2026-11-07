#!/usr/bin/env bash

# Project: Human Gut Shotgun Metagenomics
# Sample: VF32
# NCBI Run: SRR6915205
# Step 2: SRA validation and FASTQ conversion

set -euo pipefail

# Check the integrity of the downloaded SRA file
vdb-validate raw_data/SRR6915205/SRR6915205.sra

# Create directories for output and temporary files
mkdir -p processed_data temp

# Convert paired-end SRA reads to FASTQ
fasterq-dump raw_data/SRR6915205/SRR6915205.sra \
    --split-files \
    --threads 4 \
    --temp temp \
    --outdir processed_data \
    --progress
