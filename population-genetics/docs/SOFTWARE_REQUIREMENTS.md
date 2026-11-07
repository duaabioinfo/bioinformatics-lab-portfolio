# Software Requirements

## Main tools

- PLINK2: genotype filtering, LD pruning, PCA and FST
- Python 3: result processing and scientific visualization

## Environment setup

Example Micromamba installation:

    micromamba create -n popgen -c conda-forge -c bioconda plink2 python -y

Check installed versions:

    plink2 --version
    python3 --version

Additional Python dependencies must be checked against
the imports in the plotting scripts.

## Reproduction notes

The recorded FST verification successfully reproduced
all ten pairwise estimates.

PCA was rerun successfully, but its new coordinates
were not independently compared with the original results.

Original genotype data and reference metadata must
be obtained separately.
