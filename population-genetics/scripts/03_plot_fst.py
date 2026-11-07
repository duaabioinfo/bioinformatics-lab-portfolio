from pathlib import Path
from html import escape

source = Path("results/fst/chr22_fst.fst.summary")
figure = Path("results/figures/chr22_fst_heatmap.svg")
report = Path("results/project3_summary.md")

groups = ["AFR", "AMR", "EAS", "EUR", "SAS"]
values = {}

for line in source.read_text().splitlines():
    fields = line.split()
    if len(fields) == 3 and fields[0] in groups:
        a, b, value = fields
        values[frozenset((a, b))] = float(value)

assert len(values) == 10, "Expected 10 FST comparisons"

width, height = 750, 610
cell = 82
left, top = 170, 120
maximum = max(values.values())

parts = [
    f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {width} {height}">',
    '<rect width="100%" height="100%" fill="white"/>',
    '<text x="40" y="48" font-family="Arial" font-size="25" font-weight="bold">Population differentiation (FST)</text>',
    '<text x="40" y="77" font-family="Arial" font-size="15">1000 Genomes Phase 3 | Chromosome 22 | Weir-Cockerham estimator</text>'
]

for i, group in enumerate(groups):
    parts.append(
        f'<text x="{left+i*cell+cell/2}" y="{top-14}" '
        f'text-anchor="middle" font-family="Arial">{group}</text>'
    )
    parts.append(
        f'<text x="{left-15}" y="{top+i*cell+49}" '
        f'text-anchor="end" font-family="Arial">{group}</text>'
    )

for i, a in enumerate(groups):
    for j, b in enumerate(groups):
        value = 0 if a == b else values[frozenset((a, b))]
        intensity = value / maximum
        shade = int(245 - 175 * intensity)
        color = f'rgb({shade},{shade+5},{250})'
        x, y = left+j*cell, top+i*cell

        parts.append(
            f'<rect x="{x}" y="{y}" width="{cell}" height="{cell}" '
            f'fill="{color}" stroke="white"/>'
        )
        parts.append(
            f'<text x="{x+cell/2}" y="{y+49}" text-anchor="middle" '
            f'font-family="Arial" font-size="15">{value:.3f}</text>'
        )

parts.append('</svg>')
figure.write_text("\n".join(parts))

ranked = sorted(values.items(), key=lambda item: item[1], reverse=True)
lines = [
    "# Population Genomics — Chromosome 22",
    "",
    "## Dataset",
    "- 1000 Genomes Phase 3",
    "- 2,504 individuals across five reference superpopulations",
    "",
    "## Methods",
    "- Variant filtering and LD pruning using PLINK2",
    "- Principal component analysis (PCA)",
    "- Weir-Cockerham pairwise FST using 97,216 filtered variants",
    "",
    "## Pairwise FST results",
    "| Comparison | FST |",
    "|---|---:|",
]

for pair, value in ranked:
    a, b = sorted(pair)
    lines.append(f"| {a} vs {b} | {value:.5f} |")

lines += [
    "",
    "## Interpretation",
    "The chromosome 22 PCA shows population structure among the reference groups.",
    "FST estimates describe differences in allele frequencies between groups.",
    "These results are exploratory and do not represent genome-wide estimates.",
    "The reference superpopulations do not represent all human diversity.",
    "",
    "## Figures",
    "- results/figures/chr22_population_pca.svg",
    "- results/figures/chr22_fst_heatmap.svg",
]

report.write_text("\n".join(lines) + "\n")

print("FST comparisons:", len(values))
print("Heatmap saved:", figure)
print("Summary saved:", report)
