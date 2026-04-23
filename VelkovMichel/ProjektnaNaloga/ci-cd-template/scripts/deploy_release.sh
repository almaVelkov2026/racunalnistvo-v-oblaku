#!/usr/bin/env bash
set -euo pipefail

APP_PATH="${APP_PATH:-/var/www/html}"
ARTIFACT_PATH="${ARTIFACT_PATH:-/tmp/release.tar.gz}"
RELEASE_SHA="${RELEASE_SHA:-manual}"
RELEASES_DIR="${RELEASES_DIR:-/var/www/releases}"
CURRENT_LINK="${CURRENT_LINK:-/var/www/current}"
LAST_FILE="${RELEASES_DIR}/.last_successful"
PREV_FILE="${RELEASES_DIR}/.previous_successful"

if [[ ! -f "${ARTIFACT_PATH}" ]]; then
  echo "ERROR: Artifact not found at ${ARTIFACT_PATH}"
  exit 1
fi

SHORT_SHA="$(echo "${RELEASE_SHA}" | cut -c1-8)"
RELEASE_ID="$(date +%Y%m%d%H%M%S)-${SHORT_SHA}"
RELEASE_DIR="${RELEASES_DIR}/${RELEASE_ID}"

echo "Preparing release ${RELEASE_ID}"
sudo mkdir -p "${RELEASES_DIR}" "${RELEASE_DIR}"
sudo tar -xzf "${ARTIFACT_PATH}" -C "${RELEASE_DIR}"

echo "Running basic syntax checks"
if command -v php >/dev/null 2>&1; then
  sudo find "${RELEASE_DIR}" -type f -name "*.php" -print0 | sudo xargs -0 -n1 php -l >/dev/null
fi

if [[ -f "${LAST_FILE}" ]]; then
  sudo cp "${LAST_FILE}" "${PREV_FILE}"
fi

echo "Switching current symlink"
sudo ln -sfn "${RELEASE_DIR}" "${CURRENT_LINK}"

echo "Syncing files to ${APP_PATH}"
sudo mkdir -p "${APP_PATH}"
sudo rsync -a --delete "${CURRENT_LINK}/" "${APP_PATH}/"
sudo chown -R www-data:www-data "${APP_PATH}"

echo "Restarting Apache"
sudo systemctl restart apache2

echo "${RELEASE_ID}" | sudo tee "${LAST_FILE}" >/dev/null
echo "Deployment finished: ${RELEASE_ID}"
