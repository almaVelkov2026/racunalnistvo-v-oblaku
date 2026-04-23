#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://localhost}"

echo "Health check: ${APP_URL}/index.html"
curl --fail --silent --show-error "${APP_URL}/index.html" >/dev/null

echo "Health check: ${APP_URL}/izpis.php"
curl --fail --silent --show-error "${APP_URL}/izpis.php" >/dev/null

echo "Health checks passed."
