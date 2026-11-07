#!/usr/bin/env bash

# Project: Human Gut Shotgun Metagenomics
# Sample: VF32
# Step 4: Paired-end read preprocessing

set -euo pipefail

# Create output directories
mkdir -p processed_data/fastp results/fastp

# Quality filtering and adapter trimming
fastp \
    --in1 processed_data/SRR6915205_1.fastq \
    --in2 processed_data/SRR6915205_2.fastq \
    --out1 processed_data/fastp/SRR6915205_1.clean.fastq.gz \
    --out2 processed_data/fastp/SRR6915205_2.clean.fastq.gz \
    --qualified_quality_phred 20 \
    --unqualified_percent_limit 40 \
    --length_required 50 \
    --detect_adapter_for_pe\
    --length_required 50 \
    --thread 2 \
    --html results/fastp/fastp_report.html \
    --json results/fastp/fastp_report.json
