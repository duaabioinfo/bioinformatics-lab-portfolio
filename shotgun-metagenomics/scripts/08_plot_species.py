import csv
from pathlib import Path
from html import escape

source = Path("results/taxonomic_profiling/top20_species.tsv")
output = Path("results/figures/top20_species.svg")

with source.open() as f:
    rows = list(csv.DictReader(f, delimiter="\t"))

data = [
    (
        row["clade_name"].split("|")[-1].removeprefix("s__"),
        float(row["relative_abundance"])
    )
    for row in rows
]

data.sort(key=lambda x: x[1], reverse=True)

width = 1100
height = 180 + len(data) * 36
left = 340
bar_width = 590
scale = max(value for _, value in data) * 1.15

parts = [
    f'<svg xmlns="http://www.w3.org/2000/svg" '
    f'width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
    '<rect width="100%" height="100%" fill="white"/>',
    '<text x="45" y="52" font-size="25" font-weight="bold" '
    'font-family="Arial">Top 20 microbial species</text>',
    '<text x="45" y="82" font-size="15" fill="#555" '
    'font-family="Arial">Human gut shotgun metagenomics | SRR6915205</text>'
]

for i, (name, value) in enumerate(data):
    y = 115 + i * 36
    length = value / scale * bar_width
    parts.append(
        f'<text x="{left-15}" y="{y+15}" text-anchor="end" '
        f'font-size="15" font-family="Arial">{escape(name)}</text>'
    )
    parts.append(
        f'<rect x="{left}" y="{y}" width="{length:.1f}" '
        f'height="21" rx="3" fill="#246a83"/>'
    )
    parts.append(
        f'<text x="{left+length+10:.1f}" y="{y+16}" '
        f'font-size="14" font-family="Arial">{value:.2f}%</text>'
    )

parts.append(
    f'<text x="{left}" y="{height-35}" '
    'font-size="14" fill="#555" font-family="Arial">'
    'Estimated relative abundance (%) | Sylph / GTDB R232</text>'
)
parts.append('</svg>')

output.write_text("\n".join(parts))
print("Figure saved:", output)
print("Species plotted:", len(data))
