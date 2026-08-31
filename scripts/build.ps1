$ErrorActionPreference = "Stop"

python scripts\quality_check.py

if (Get-Command latexmk -ErrorAction SilentlyContinue) {
    latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
} else {
    xelatex -interaction=nonstopmode -halt-on-error main.tex
    xelatex -interaction=nonstopmode -halt-on-error main.tex
}

python scripts\quality_check.py
