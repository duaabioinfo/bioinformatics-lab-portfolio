# Reproducibility Documentation

## Data
- NCBI BioProject: PRJNA447983
- Run: SRR6915205
- Dataset: Single human gut shotgun metagenomic sample

## Workflow
1. Raw-read quality assessment: FastQC
2. Read preprocessing: fastp
3. Human-reference screening: Bowtie2 / GRCh38
4. Alignment processing: SAMtools
5. Taxonomic profiling: Sylph / GTDB R232
6. Results visualization: Python

Analysis scripts are available in `scripts/`.
Method documentation is available in `docs/`.

## Recorded Results
- Raw reads: 27,285,314
- Filtered reads: 27,278,332
- Q30: 91.14%
- Host-screened retained pairs: 13,639,162
- Taxonomic profile: 273 genome entries
- Top assigned species: Alistipes putredinis (7.65%)

## Evidence
- `results/project1_summary.md`
- `results/fastp/qc_summary.md`
- `results/taxonomic_profiling/`
- `results/figures/top20_species.svg`

## Reproduction Requirements
Retrieve SRR6915205 and the corresponding reference
resources. Follow the commands and parameters documented
in the project scripts and method files.

Tool versions not recorded during original execution
are not assumed. Raw FASTQ files and large reference
databases are excluded from GitHub.

## Limitations
This is a single-sample descriptive analysis.
Only four read pairs were excluded during human-reference
screening; this unusually low count requires caution.
No clinical or disease association is established.
