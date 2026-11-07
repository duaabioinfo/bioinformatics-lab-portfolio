# Sequencing Quality and Host Removal

## Fastp Quality Control

| Metric | Before filtering | After filtering |
|---|---:|---:|
| Total reads | 27,285,314 | 27,278,332 |
| Q20 | 98.16% | 98.16% |
| Q30 | 91.13% | 91.14% |
| GC content | 49.63% | 49.63% |

Reads excluded by preprocessing: 6,982.

## Human-Reference Alignment

Reference: GRCh38 no-alt analysis set.

| Metric | Result |
|---|---:|
| Input read pairs | 13,639,166 |
| Retained read pairs | 13,639,162 |
| Excluded read pairs | 4 |
| Retention rate | 99.99997% |

Bowtie2 reported three concordantly aligned pairs and one
additional pair with a mapped mate.

The low human-reference alignment rate is unusual and should
be interpreted cautiously. Unmapped reads are not necessarily
microbial, and reference-based screening cannot guarantee
complete removal of human-origin sequences.

## Interpretation

Sequencing quality was high before filtering, with Q30 above 91%.
Preprocessing removed relatively few reads.

Taxonomic results remain exploratory and are limited to
a single publicly available sample.
