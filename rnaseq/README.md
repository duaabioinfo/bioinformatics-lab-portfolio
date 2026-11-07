# Cadmium Exposure | RNA-seq Analysis

**Status: Data acquisition and analysis in progress**

## Research Question

How does cadmium exposure influence gene expression in human liver-derived cell models?

## Study

- Public study: E-MTAB-11670
- Models selected: Hep-G2 and HepaRG
- Conditions: Cadmium exposure and vehicle controls
- Planned analysis: Three cadmium-exposed and six control runs per cell model

## Planned Workflow

1. Verify FASTQ integrity and sequencing quality.
2. Quantify transcript expression using Salmon and GENCODE v48.
3. Summarize transcript-level estimates to genes.
4. Analyze differential expression with DESeq2 separately by cell model.
5. Explore enriched biological processes when supported by the results.
6. Produce figures and critically interpret findings.

## Important Considerations

These are cultured cell models, not human participants. Their results cannot directly establish human cancer risk or the consequences of dietary cadmium exposure.

The experimental design, sample metadata, read quality, and statistical assumptions must be reviewed before final interpretation.

Results will be added after successful analysis.
