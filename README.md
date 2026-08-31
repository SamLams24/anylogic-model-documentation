# SCONTO-SVU Documentation LaTeX

## Démarrage sous Windows

Prérequis : une distribution LaTeX telle que MiKTeX ou TeX Live, XeLaTeX disponible dans le PATH, Python 3 et Codex CLI.

Depuis PowerShell :

```powershell
cd "C:\chemin\vers\work on documentation"
xelatex --version
python --version
codex --version
```

Initialiser Git si nécessaire :

```powershell
git init
git add .
git commit -m "Initialisation du projet LaTeX SCONTO-SVU"
```

Lancer ensuite Codex depuis ce dossier, pas depuis `C:\Windows\System32` :

```powershell
codex
```

Premier message conseillé à Codex :

```text
Lis AGENTS.md puis tous les fichiers d'instructions qu'il référence. Analyse sources/base_document_extrait.md. Commence par proposer un plan de migration précis vers la structure de DOCUMENT_PLAN.md, sans réécrire le fond ni inventer de données. Ensuite migre le document chapitre par chapitre dans les fichiers LaTeX, en exécutant les contrôles de QA après chaque étape.
```

## Compilation

Avec `latexmk` :

```powershell
latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
```

Sans `latexmk` :

```powershell
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

## Contrôle rédactionnel

```powershell
python scripts\quality_check.py
```


## Couverture du modèle consolidé
Lire `MODEL_EVOLUTION.md` avant toute migration rédactionnelle. Ce fichier recense les fonctions ajoutées ou consolidées qui doivent être représentées dans le rapport final, avec distinction entre implémentation et validation expérimentale.
