#!/usr/bin/env bash
set -euo pipefail

# === Konfiguration ===
ADDON_NAME="Memento"
PACKAGER_REPO="https://github.com/BigWigsMods/packager.git"
PACKAGER_DIR="vendor/packager"

# Mapping: Spielversion → TOC-Datei
declare -A TOC_FILES=(
  [retail]="${ADDON_NAME}.toc"
  [classic]="${ADDON_NAME}_Classic.toc"
  [cata]="${ADDON_NAME}_Cata.toc"
)

# Env-IDs (werden aus GitHub Secrets gesetzt)
CF_ID="${CF_PROJECT_ID:-}"
WAGO_ID="${WAGO_PROJECT_ID:-}"

# === Usage ===
usage() {
  echo "Usage: $0 --version <version> --games <retail,classic,cata>"
  exit 1
}

# === Argumente parsen ===
VERSION=""; GAMES_ARG=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --version) VERSION="$2"; shift 2;;
    --games)   GAMES_ARG="$2"; shift 2;;
    *)         usage;;
  esac
done
[[ -z "$VERSION" || -z "$GAMES_ARG" ]] && usage

# === BigWigs-Packager klonen oder auf Tag v2 updaten ===
if [[ ! -d "$PACKAGER_DIR" ]]; then
  echo "🚀 Klone BigWigs-Packager v2..."
  git clone --depth 1 --branch v2 "$PACKAGER_REPO" "$PACKAGER_DIR"
else
  echo "🔄 Update auf v2..."
  git -C "$PACKAGER_DIR" fetch --depth 1 origin v2
  git -C "$PACKAGER_DIR" checkout --force v2
fi

# === Python-Skript aufrufen ===
python3 script/build.py --version "$VERSION" --games "$GAMES_ARG"