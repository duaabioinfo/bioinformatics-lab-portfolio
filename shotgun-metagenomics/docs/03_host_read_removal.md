# Human Host Read Removal

## Objective

Identify reads aligning to the human reference genome
and retain paired reads that are unmapped to the reference.

## Tools

- Bowtie2 v2.5.4
- SAMtools v1.22.1
- Human reference: GRCh38 no-alt analysis set

## Filtering Strategy

Paired-end reads were aligned to GRCh38 using Bowtie2.

SAMtools flags 0x4 and 0x8 were used to retain pairs
where both mates were reported as unmapped.

Secondary and supplementary alignments were excluded.

## Results

| Metric | Count |
|---|---:|
| Input reads | 27,278,332 |
| Input read pairs | 13,639,166 |
| Retained reads | 27,278,324 |
| Retained read pairs | 13,639,162 |
| Removed read pairs | 4 |
| Retained pairs (%) | 99.99997 |

## Interpretation

Very few reads aligned to the human reference under
the selected alignment parameters.

The retained paired reads are suitable for downstream
microbial profiling, subject to the limitations
of reference-based host read removal.

Failure to align to GRCh38 does not demonstrate
complete absence of human DNA or prove that a read
is microbial.

## Next Step

Perform microbial taxonomic profiling on the
host-filtered paired-end reads.
