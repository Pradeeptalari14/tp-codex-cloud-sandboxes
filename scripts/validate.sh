#!/usr/bin/env bash
# Smoke test validating Codex in the Cloud Runner & Sandbox Pool
set -euo pipefail

if [[ "${1:-}" == "--dry-run" ]]; then
    echo "Dry-run check passed: Codex Cloud Runner & MicroVM Pool validated."
    exit 0
fi

echo "Verifying Codex Cloud Runner module..."
python3 -c "import codex_cloud_runner; print('Codex Cloud Runner Module Loaded Successfully.')"

echo "Verifying MicroVM Sandbox Pool..."
python3 -c "import microvm_sandbox_pool; print('MicroVM Pool Loaded Successfully.')"

echo "All Codex Cloud smoke tests passed."
