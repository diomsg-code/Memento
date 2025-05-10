#!/usr/bin/env bash
set -euo pipefail

# === Konfiguration ===
ADDON_NAME="Memento"
PACKAGER_REPO="https://github.com/BigWigsMods/packager.git"
PACKAGER_DIR="vendor/packager"

CF_ID="${CF_PROJECT_ID:-}"
WAGO_ID="${WAGO_PROJECT_ID:-}"

usage() {
  echo "Usage: $0 --version <version> --game <retail,classic,cata>"
  exit 1
}

VERSION=""; GAME=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --version) VERSION="$2"; shift 2;;
    --game)   GAME="$2"; shift 2;;
    *)         usage;;
  esac
done
[[ -z "$VERSION" || -z "$GAME" ]] && usage

echo "🚀 Klone BigWigs-Packager..."
git clone --depth 1 --branch master "$PACKAGER_REPO" "$PACKAGER_DIR"

echo "📁 Verzeichnisinhalt-1:"
find . -type f

python3 script/build.py --version "$NEW_TAG" --game "$GAME"

echo "📁 Verzeichnisinhalt-2:"
find . -type f