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

VERSION=""; GAMES_ARG=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --version) VERSION="$2"; shift 2;;
    --game)   GAMES_ARG="$2"; shift 2;;
    *)         usage;;
  esac
done
[[ -z "$VERSION" || -z "$GAMES_ARG" ]] && usage

echo "🚀 Klone BigWigs-Packager..."
git clone --depth 1 --branch master "$PACKAGER_REPO" "$PACKAGER_DIR"

echo "📁 Verzeichnisinhalt:"
find . -type f

# release_type kommt aus Aufruf, z. B. "Release" oder "Alpha"
RELEASE_TYPE="${RELEASE_TYPE:-Release}"

# 📦 Tags berechnen über Python-Skript
eval $(python3 script/tag.py "$RELEASE_TYPE")

# ✳️ Vorher: Zugriffstoken prüfen
if [[ -z "${G_TOKEN:-}" ]]; then
  echo "❌ G_TOKEN (GitHub Token) ist nicht gesetzt!"
  exit 5
fi

# ✳️ Remote-URL mit Token zusammenbauen
REPO_URL="https://x-access-token:${G_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

# ✳️ Tag setzen, falls nicht vorhanden
if git rev-parse "$NEW_TAG" >/dev/null 2>&1; then
  echo "🔁 Tag '$NEW_TAG' existiert bereits."
else
  echo "🏷 Setze neuen Tag: $NEW_TAG"
  git tag "$NEW_TAG"
  git push "$REPO_URL" "refs/tags/$NEW_TAG"
fi

echo "📌 Neuer Tag gesetzt: $NEW_TAG"
echo "⬅️  Letzter Release-Tag war: $LAST_RELEASE_TAG"
echo "⬅️  Letzter Tag war: $LAST_TAG"

python3 script/build.py --version "$VERSION" --game "$GAMES_ARG"