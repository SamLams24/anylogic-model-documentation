from __future__ import annotations

from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
TARGETS = [ROOT / "main.tex", ROOT / "preamble.tex", ROOT / "chapters", ROOT / "appendices"]

forbidden_errors = {
    "caractère tiret long U+2014": "\u2014",
    "caractère tiret demi-cadratin U+2013": "\u2013",
    "séquence triple tiret": "---",
    "commande textemdash": r"\textemdash",
    "commande textendash": r"\textendash",
    "commande emdash": r"\emdash",
    "commande endash": r"\endash",
}

warning_patterns = {
    "formulation 'il convient de'": re.compile(r"\bil convient de\b", re.I),
    "formulation 'il est important de'": re.compile(r"\bil est important de\b", re.I),
    "formulation 'dans cette section'": re.compile(r"\bdans cette section\b", re.I),
    "formulation 'nous allons'": re.compile(r"\bnous allons\b", re.I),
    "formulation 'on peut constater'": re.compile(r"\bon peut constater\b", re.I),
    "marqueur TODO/FIXME": re.compile(r"\b(?:TODO|FIXME)\b", re.I),
    "marqueur de capture provisoire": re.compile(r"CAPTURE\s+(?:À|A)\s+INS[ÉE]RER", re.I),
    "mention version de travail": re.compile(r"version de travail", re.I),
    "mention à actualiser": re.compile(r"[àa] actualiser", re.I),
}

files: list[Path] = []
for target in TARGETS:
    if target.is_file():
        files.append(target)
    elif target.is_dir():
        files.extend(target.rglob("*.tex"))

errors: list[str] = []
warnings: list[str] = []

for path in sorted(set(files)):
    text = path.read_text(encoding="utf-8", errors="replace")
    rel = path.relative_to(ROOT)
    for lineno, line in enumerate(text.splitlines(), 1):
        for label, needle in forbidden_errors.items():
            if needle in line:
                errors.append(f"{rel}:{lineno}: {label}: {line.strip()}")
        # A double ASCII hyphen in prose can generate a typographic dash in TeX.
        # It remains a warning because command-line material is not scanned here.
        if "--" in line and "---" not in line:
            warnings.append(f"{rel}:{lineno}: séquence double tiret à vérifier: {line.strip()}")
        for label, pattern in warning_patterns.items():
            if pattern.search(line):
                warnings.append(f"{rel}:{lineno}: {label}: {line.strip()}")

if warnings:
    print("\nAVERTISSEMENTS DE STYLE")
    for item in warnings:
        print("WARN", item)

if errors:
    print("\nERREURS BLOQUANTES")
    for item in errors:
        print("ERROR", item)
    sys.exit(1)

print("\nContrôle terminé : aucune occurrence bloquante détectée dans les sources LaTeX du rendu.")
