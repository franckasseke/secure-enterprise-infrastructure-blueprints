#!/usr/bin/env bash
set -euo pipefail

# cleanup-ollama-lab.sh
# Purpose: print cleanup commands for the secure local LLM lab.
# Review before running any cleanup action.

echo "Cleanup options for the Ollama local LLM lab"
echo

echo "1. List installed models:"
echo "   ollama list"
echo

echo "2. Remove lab models if no longer needed:"
echo "   ollama rm deepseek-r1:7b"
echo "   ollama rm qwen2.5:7b"
echo "   ollama rm qwen2.5-coder:7b"
echo "   ollama rm llama3.2:3b"
echo

echo "3. Stop the Ollama service if you no longer need it running:"
echo "   sudo systemctl stop ollama"
echo

echo "4. Disable automatic service startup if required:"
echo "   sudo systemctl disable ollama"
echo

echo "5. Validate local port state:"
echo "   ss -lntp | grep 11434 || true"
echo

echo "6. Document what was removed in your lab notes."
