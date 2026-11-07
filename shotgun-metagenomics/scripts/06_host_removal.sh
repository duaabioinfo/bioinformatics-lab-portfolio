#!/usr/bin/env bash

# Project: Human Gut Shotgun Metagenomics
# Sample: VF32
# Step 6: Human host read removal

set -euo pipefail

# Define input and output directories
REF="databases/human_GRCh38/GRCh38_noalt_as"
INPUT="processed_data/fastp"
OUTPUT="processed_data/host_removed"
RESULTS="results/host_removal"

mkdir -p "$OUTPUT" "$RESULTS"

# Align paired-end reads to the human reference
# Retain pairs where both mates are unmapped
bowtie2 \
    -x "$REF" \
    -1 "$INPUT/SRR6915205_1.clean.fastq.gz" \
    -2 "$INPUT/SRR6915205_2.clean.fastq.gz" \
    -p 2 \
    2> "$RESULTS/bowtie2_alignment.log" \
    | samtools view -b -f 12 -F 0x900 - \
    | samtools sort -n -@ 2 -m 512M \
        -T "$RESULTS/sort_tmp" \
        -o "$RESULTS/nonhuman_pairs.bam" -

# Convert retained pairs back to FASTQ
samtools fastq -@ 2 \
    -1 "$OUTPUT/SRR6915205_1.nonhuman.fastq.gz" \
    -2 "$OUTPUT/SRR6915205_2.nonhuman.fastq.gz" \
    -0 /dev/null \
    -s /dev/null \
    -n \
    "$RESULTS/nonhuman_pairs.bam"
