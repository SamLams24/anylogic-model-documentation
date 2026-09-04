#!/usr/bin/env python3
"""Contrôle éditorial et technique de la documentation LaTeX."""

from __future__ import annotations

import argparse
import pathlib
import re
import sys


ROOT = pathlib.Path(__file__).resolve().parents[2]
DOC_ROOT = ROOT / "documentation"
CHAPTER_ROOT = DOC_ROOT / "chapters"
USER_CHAPTERS = {f"{number:02d}" for number in range(11, 18)}

FORBIDDEN_DASHES = {
    "U+2014": "\N{EM DASH}",
    "textemdash": r"\textemdash",
    "textendash": r"\textendash",
    "emdash": r"\emdash",
    "endash": r"\endash",
}

UI_JARGON = (
    "JTextField",
    "JButton",
    "JComboBox",
    "JCheckBox",
    "Swing modal",
    "getter",
    "setter",
    "listener",
    "onclick",
    "instance Java",
    "binding",
    "widget",
)

METADISCOURSE = (
    "dans cette section, nous allons",
    "cette section présente",
    "il convient de noter",
    "il est important de souligner",
    "on peut constater que",
    "cette approche permet",
)


def line_number(text: str, offset: int) -> int:
    return text.count("\n", 0, offset) + 1


def add_match(issues: list[str], path: pathlib.Path, text: str, pattern: str, label: str) -> None:
    for match in re.finditer(pattern, text, flags=re.IGNORECASE):
        relative = path.relative_to(ROOT)
        issues.append(f"{relative}:{line_number(text, match.start())}: {label}")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--final",
        action="store_true",
        help="Active les interdictions propres à une version prête à publier.",
    )
    args = parser.parse_args()

    tex_files = sorted(DOC_ROOT.rglob("*.tex"))
    if not tex_files:
        print("ECHEC: aucun fichier LaTeX trouvé dans documentation/.")
        return 2

    errors: list[str] = []
    warnings: list[str] = []

    for path in tex_files:
        text = path.read_text(encoding="utf-8")

        for label, token in FORBIDDEN_DASHES.items():
            if token in text:
                errors.append(f"{path.relative_to(ROOT)}: construction interdite {label}")

        lowered = text.casefold()
        for phrase in METADISCOURSE:
            if phrase.casefold() in lowered:
                add_match(errors, path, text, re.escape(phrase), f"métadiscours interdit: {phrase}")

        if re.search(r"\bbaseline\b", text, flags=re.IGNORECASE):
            add_match(warnings, path, text, r"\bbaseline\b", "emploi de baseline à justifier")

        if path.parent == CHAPTER_ROOT and re.match(r"(?:0[1-9]|1\d|20)-", path.name):
            if re.search(r"\b(?:TODO|TBD)\b", text, flags=re.IGNORECASE):
                target = errors if args.final else warnings
                add_match(target, path, text, r"\b(?:TODO|TBD)\b", "marqueur de rédaction")

        if path.parent == CHAPTER_ROOT and path.name[:2] in USER_CHAPTERS:
            for term in UI_JARGON:
                if term.casefold() in lowered:
                    add_match(errors, path, text, re.escape(term), f"jargon graphique dans un chapitre utilisateur: {term}")

        add_match(errors, path, text, r"\\DocumentationNote\s*\{", "note interne encore active")

        if args.final:
            for pattern, label in (
                (r"\\FigureOrPlaceholder\s*(?:\[[^]]*\])?\s*\{", "placeholder de figure encore autorisé"),
                (r"\\TablePlaceholder\s*\{", "placeholder de tableau encore autorisé"),
                (r"Illustration planifiée", "texte de placeholder"),
            ):
                add_match(errors, path, text, pattern, label)

    if warnings:
        print("AVERTISSEMENTS:")
        for warning in warnings:
            print(f"  {warning}")

    if errors:
        print("ECHEC:")
        for error in errors:
            print(f"  {error}")
        return 1

    mode = "final" if args.final else "fondation"
    print(f"SUCCES: {len(tex_files)} fichiers LaTeX contrôlés en mode {mode}.")
    print("Aucun caractère U+2014, tiret long LaTeX, métadiscours interdit ou jargon UI mal placé.")
    return 0


if __name__ == "__main__":
    sys.exit(main())

