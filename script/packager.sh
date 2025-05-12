#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT=$(git rev-parse --show-toplevel)
ADDON_NAME=$(basename "$REPO_ROOT")

PACKAGER_REPO="https://github.com/BigWigsMods/packager.git"
PACKAGER_DIR="vendor/packager"

VERSION=""
LAST_VERSION=""
GAME=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --version) VERSION="$2"; shift 2 ;;
    --last-version) LAST_VERSION="$2"; shift 2 ;;
    --game)    GAME="$2";    shift 2 ;;
    *) echo "⚠️ Unbekanntes Argument: $1"; exit 1 ;;
  esac
done

if [[ -z "$VERSION" || -z "$LAST_VERSION" || -z "$GAME" ]]; then
  echo "⚠️ Benötigt: --version, --last-version und --game"
  exit 99
fi

case "$GAME" in
  retail)
    TOC_SRC="${ADDON_NAME}.toc"
    META="pkgmeta.retail.yaml"
    SUFFIX=""
    ;;
  *)
    echo "⚠️ Unbekannte Spielversion: $GAME"; exit 1 ;;
esac

if [[ ! -f "${TOC_SRC}" ]]; then
  echo "⚠️ TOC-Datei fehlt: ${TOC_SRC}"
  exit 99
fi

if [[ -f CHANGELOG.md ]]; then
  echo "🔧 Ersetze Platzhalter in CHANGELOG.md mit Version ${LAST_VERSION}"
  sed -i "s/@last-project-version@/${LAST_VERSION}/g" CHANGELOG.md
fi

ZIP_NAME="${ADDON_NAME}-${VERSION}${SUFFIX}"
VERSION_NAME="${VERSION}${SUFFIX}"

CMD=(
  bash "$PACKAGER_DIR/release.sh"
  -g "$GAME"
  -m "$META"
  -n "${ZIP_NAME}:${VERSION_NAME}"
)

if [[ -n "${CF_PROJECT_ID:-}" ]]; then
  CMD+=("-p" "$CF_PROJECT_ID")
fi

if [[ -n "${WAGO_PROJECT_ID:-}" ]]; then
  CMD+=("-a" "$WAGO_PROJECT_ID")
fi

echo "🚀 Klone BigWigs-Packager..."
git clone --depth 1 --branch master "$PACKAGER_REPO" "$PACKAGER_DIR"

echo "📦 Starte Packaging: ${CMD[*]}"
"${CMD[@]}"

echo "✅ Packaging abgeschlossen."