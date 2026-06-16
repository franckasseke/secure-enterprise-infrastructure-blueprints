#!/usr/bin/env bash
set -euo pipefail

# pull-models.sh
# Purpose: download the model set used by the secure local LLM lab.

MODELS=(
  "deepseek-r1:7b"
  "qwen2.5:7b"
  "qwen2.5-coder:7b"
  "llama3.2:3b"
)

if ! command -v ollama >/dev/null 2>&1; then
  echo "[ERROR] Ollama is not installed or not in PATH."
  exit 1
fi

for model in "${MODELS[@]}"; do
  echo "[INFO] Pulling ${model}"
  ollama pull "${model}"
done

echo "[INFO] Installed models:"
ollama list

echo "[DONE] Model download completed."
