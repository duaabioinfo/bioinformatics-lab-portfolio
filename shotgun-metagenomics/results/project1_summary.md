# Project 1 Summary: Shotgun Metagenomics Taxonomic Profiling

## Dataset
- Sample: SRR6915205
- Data type: Paired-end human gut shotgun metagenomics

## Workflow
1. Input FASTQ inspection
2. Host removal
3. Taxonomic profiling using sylph
4. Species-level ranking
5. Visualization of top species

## Main results
- Total detected species entries: 273

## Top 10 species by relative abundance
1. Alistipes putredinis — 7.65%
2. Prevotella sp905214625 — 7.42%
3. Phocaeicola vulgatus — 5.57%
4. Bacteroides uniformis — 4.87%
5. Bacteroides stercoris_A — 4.64%
6. Bacteroides stercoris — 3.71%
7. Vescimonas sanitatis — 2.77%
8. Fimenecus sp000432435 — 2.64%
9. Parabacteroides merdae — 2.27%
10. Acetatifactor hominis — 2.09%

## Output files
- results/taxonomic_profiling/SRR6915205_profile.tsv
- results/taxonomic_profiling/top20_species.tsv
- results/figures/top20_species.svg

## Interpretation
This project provides an exploratory taxonomic profile of a human gut metagenomic sample.
The most abundant organisms are gut-associated microbial taxa.
These results are descriptive and should not be interpreted as a clinical diagnosis.

## Tools used
- sylph
- Python 3
