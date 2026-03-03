#!/usr/bin/env bash
set -euo pipefail

DATASET_ID="psparks/instacart-market-basket-analysis"
OUT_DIR="raw_data"

mkdir -p "$OUT_DIR"

# Make sure kaggle CLI exists
if ! command -v kaggle >/dev/null 2>&1; then
  echo "❌ kaggle CLI not found."
  echo "Install it with: pip install kaggle"
  exit 1
fi

echo "⬇️ Downloading Kaggle dataset: $DATASET_ID"
echo "📁 Output folder: $OUT_DIR"

# --unzip extracts CSVs automatically
kaggle datasets download -d "$DATASET_ID" -p "$OUT_DIR" --unzip

echo "✅ Done. Files now in: $OUT_DIR"
ls -lah "$OUT_DIR" | head -n 20