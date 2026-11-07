import csv
from pathlib import Path
from collections import Counter
from html import escape

panel_file = Path("raw_data/integrated_call_samples_v3.20130502.ALL.panel")
pca_file = Path("results/pca/chr22_pca.eigenvec")
output = Path("results/figures/chr22_population_pca.svg")

with panel_file.open() as f:
    panel = list(csv.DictReader(f, delimiter="\t"))

populations = {
    row["sample"]: row["super_pop"]
    for row in panel
}

points = []

with pca_file.open() as f:
    header = next(f).lstrip("#").split()

    for line in f:
        if not line.strip():
            continue

        row = dict(zip(header, line.split()))
        sample = row["IID"]
        group = populations.get(sample)

        if group:
            points.append((
                float(row["PC1"]),
                float(row["PC2"]),
                group
            ))

if not points:
    raise ValueError("No matching samples between PCA and population panel")

colors = {
    "AFR": "#2374AB",
    "EUR": "#D95D39",
    "EAS": "#339966",
    "SAS": "#8A5BBE",
    "AMR": "#D49B25"
}

width, height = 1050, 740
left, right = 95, 830
top, bottom = 110, 640

xs = [p[0] for p in points]
ys = [p[1] for p in points]
xmin, xmax = min(xs), max(xs)
ymin, ymax = min(ys), max(ys)

def scale_x(x):
    return left + (x-xmin)/(xmax-xmin)*(right-left)

def scale_y(y):
    return bottom - (y-ymin)/(ymax-ymin)*(bottom-top)

parts = [
    f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {width} {height}">',
    '<rect width="100%" height="100%" fill="white"/>',
    '<text x="70" y="48" font-family="Arial" font-size="25" font-weight="bold">Population genetic structure — Chromosome 22</text>',
    '<text x="70" y="77" font-family="Arial" font-size="15">1000 Genomes Phase 3 | LD-pruned PCA</text>',
    f'<rect x="{left}" y="{top}" width="{right-left}" height="{bottom-top}" fill="#fafafa" stroke="#cccccc"/>'
]

for x, y, group in points:
    parts.append(
        f'<circle cx="{scale_x(x):.2f}" cy="{scale_y(y):.2f}" '
        f'r="3" fill="{colors.get(group, "#777777")}" fill-opacity="0.65"/>'
    )

parts.extend([
    f'<text x="450" y="690" font-family="Arial" font-size="17">PC1</text>',
    f'<text x="33" y="385" font-family="Arial" font-size="17" transform="rotate(-90 33 385)">PC2</text>'
])

counts = Counter(group for _, _, group in points)

for i, (group, color) in enumerate(colors.items()):
    y = 150 + i * 39
    parts.append(f'<circle cx="875" cy="{y}" r="7" fill="{color}"/>')
    parts.append(
        f'<text x="895" y="{y+5}" font-family="Arial" font-size="16">'
        f'{escape(group)} ({counts[group]})</text>'
    )

parts.append('</svg>')
output.write_text("\n".join(parts))

print("PCA samples matched:", len(points))
print("Population counts:", dict(counts))
print("Figure saved:", output)
