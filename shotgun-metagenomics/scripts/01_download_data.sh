#!/usr/bin/env bash

# Project: Human Gut Shotgun Metagenomics
# Sample: VF32
# NCBI Run: SRR6915205

set -euo pipefail

# Download the original sequencing data
prefetch SRR6915205 --max-size 5G --output-directory raw_data
