#!/usr/bin/env bash
set -euo pipefail

ADDON_NAME="Memento"
PACKAGER_REPO="https://github.com/BigWigsMods/packager.git"
PACKAGER_DIR="vendor/packager"

# Argumente
VERSION=""
GAME=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --version) VERSION="$2"; shift 2 ;;
    --game)    GAME="$2";    shift 2 ;;
    *) echo "❌ Unbekanntes Argument: $1"; exit 1 ;;
  esac
done

if [[ -z "$VERSION" || -z "$GAME" ]]; then
  echo "❌ Benötigt: --version und --game"
  exit 1
fi

echo "📂 Arbeitsverzeichnis: $(pwd)"
echo "📄 TOC-Dateien: $(ls *.toc 2>/dev/null || echo '(keine)')"

case "$GAME" in
  retail)
    TOC_SRC="Memento_Mainline.toc"
    META="pkgmeta.retail.yaml"
    SUFFIX=""
    ;;
  classic)
    TOC_SRC="Memento_Vanilla.toc"
    META="pkgmeta.classic.yaml"
    SUFFIX="-classic"
    ;;
  cata)
    TOC_SRC="Memento_Cata.toc"
    META="pkgmeta.cata.yaml"
    SUFFIX="-cata"
    ;;
  *)
    echo "⚠️ Unbekannte Spielversion: $GAME"; exit 1 ;;
esac

if [[ ! -f "$TOC_SRC" ]]; then
  echo "❌ TOC-Datei fehlt: $TOC_SRC"
  exit 1
fi

echo "📄 Kopiere $TOC_SRC → Memento.toc"
cp "$TOC_SRC" "Memento.toc"

ZIP_NAME="${ADDON_NAME}-${VERSION}${SUFFIX}"
VERSION_NAME="${VERSION}${SUFFIX}"

CMD=(
  bash "$PACKAGER_DIR/release.sh"
  -g "$GAME"
  -m "$META"
  -n "${ZIP_NAME}:${VERSION_NAME}"
)

if [[ -n "${WAGO_PROJECT_ID:-}" ]]; then
  CMD+=("-a" "$WAGO_PROJECT_ID")
fi

echo "🚀 Klone BigWigs-Packager..."
git clone --depth 1 --branch master "$PACKAGER_REPO" "$PACKAGER_DIR"

echo "📦 Starte Packaging: ${CMD[*]}"
"${CMD[@]}"

echo "✅ Packaging abgeschlossen."