#!/usr/bin/env bash
set -euo pipefail

DB="databases/gtdb_r232/gtdb-r232-c1000-dbv1.syldb"
READS="processed_data/host_removed"
OUT="results/taxonomic_profiling"

mkdir -p "$OUT"

sylph profile \
  "$DB" \
  -1 "$READS/SRR6915205_1.nonhuman.fastq.gz" \
  -2 "$READS/SRR6915205_2.nonhuman.fastq.gz" \
  -t 2 \
  -o "$OUT/SRR6915205_profile.tsv" \
  2> "$OUT/sylph.log"

echo "Profiling completed"
head -n 10 "$OUT/SRR6915205_profile.tsv"
