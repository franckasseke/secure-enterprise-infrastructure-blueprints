#!/usr/bin/env bash
set -euo pipefail

# install-ollama.sh
# Purpose: prepare Ollama installation for the secure local LLM lab.
# This helper downloads the installer to a local file so the user can inspect it before execution.

INSTALLER_PATH="/tmp/ollama-install.sh"

echo "[INFO] Checking curl..."
if ! command -v curl >/dev/null 2>&1; then
  echo "[INFO] curl is missing. Install curl first with your package manager."
  exit 1
fi

echo "[INFO] Downloading Ollama installer to ${INSTALLER_PATH}"
curl -fsSL https://ollama.com/install.sh -o "${INSTALLER_PATH}"
chmod 700 "${INSTALLER_PATH}"

echo "[INFO] Installer downloaded. Review it before execution:"
echo "less ${INSTALLER_PATH}"

echo "[INFO] After review, run:"
echo "sudo ${INSTALLER_PATH}"

echo "[INFO] After installation, validate with:"
echo "ollama --version"
echo "systemctl status ollama --no-pager"
echo "curl http://127.0.0.1:11434/api/tags"
