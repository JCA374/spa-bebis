#!/usr/bin/env bash
# Bygger GitHub Pages-versionen (docs/index.html) från artefaktens källa (index.html).
# index.html saknar doctype/head/body eftersom Claude-artefakten lägger till dem vid publicering.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p docs
{
  printf '<!doctype html>\n<html lang="sv">\n<head>\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
  printf '<meta name="robots" content="noindex">\n</head>\n<body>\n'
  cat index.html
  printf '\n</body>\n</html>\n'
} > docs/index.html
echo "Skrev docs/index.html"
