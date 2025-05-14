#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT=$(git rev-parse --show-toplevel)
ADDON_NAME=$(basename "$REPO_ROOT")

PACKAGER_REPO="https://github.com/BigWigsMods/packager.git"
PACKAGER_DIR="vendor/packager"

VERSION=""
LAST_VERSION=""
GAME=""
RELEASE_CF=""
RELEASE_WAGO=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --version) VERSION="$2"; shift 2 ;;
    --last-version) LAST_VERSION="$2"; shift 2 ;;
    --game)    GAME="$2";    shift 2 ;;
    --release-cf)    RELEASE_CF="$2";    shift 2 ;;
    --release-wago)    RELEASE_WAGO="$2";    shift 2 ;;
    *) echo "⚠️ Unbekanntes Argument: $1"; exit 1 ;;
  esac
done

if [[ -z "$VERSION" || -z "$LAST_VERSION" || -z "$GAME" || -z "$RELEASE_CF" || -z "$RELEASE_WAGO" ]]; then
  echo "⚠️ Benötigt: --version, --last-version und --game"
  exit 99
fi

MAPPING_FILE="./build.ini"
SECTION_FOUND=false

while IFS= read -r line; do
  line="${line#"${line%%[![:space:]]*}"}"
  line="${line%"${line##*[![:space:]]}"}"

  [[ -z "$line" || "$line" =~ ^# ]] && continue

  if [[ "$line" =~ ^\[$GAME\]$ ]]; then
    SECTION_FOUND=true
    continue
  fi

  if [[ "$line" =~ ^\[.*\]$ && "$SECTION_FOUND" == true ]]; then
    break
  fi

  if [[ "$SECTION_FOUND" == true ]]; then
    IFS='=' read -r key value <<< "$line"
    key="${key// /}"
    value="${value##*( )}"
    value="${value%%*( )}"

    case "$key" in
      toc) TOC_SRC="$value" ;;
      meta) META="$value" ;;
      suffix) SUFFIX="$value" ;;
    esac
  fi
done < "$MAPPING_FILE"

if [[ -z "$TOC_SRC" || -z "$META" ]]; then
  echo "⚠️ Fehler: Kein gültiger Abschnitt für Spielversion '$GAME' in $MAPPING_FILE"
  exit 1
fi

if [[ ! -f "${TOC_SRC}" ]]; then
  echo "⚠️ TOC-Datei fehlt: ${TOC_SRC}"
  exit 99
fi

if [[ "$TOC_SRC" != "${ADDON_NAME}.toc" ]]; then
  cp "$TOC_SRC" "${ADDON_NAME}.toc"
  git add "${ADDON_NAME}.toc"
fi

if [[ -f CHANGELOG.md ]]; then
  echo "🔧 Ersetze Platzhalter in CHANGELOG.md mit Version ${LAST_VERSION}"
  sed -i "s/@last-project-version@/${LAST_VERSION}/g" CHANGELOG.md
fi

if [[ -n "$SUFFIX" ]]; then
  SUFFIX="-$SUFFIX"
fi

ZIP_NAME="${ADDON_NAME}-${VERSION}${SUFFIX}"
VERSION_NAME="${VERSION}${SUFFIX}"

CMD=(
  bash "$PACKAGER_DIR/release.sh"
  -g "$GAME"
  -m "$META"
  -n "${ZIP_NAME}:${VERSION_NAME}"
)
echo "${RELEASE_CF}"
echo "${RELEASE_WAGO}"
if [[ -n "${CF_PROJECT_ID:-}" && "${RELEASE_CF:-false}" == "true" ]]; then
  CMD+=("-p" "$CF_PROJECT_ID")
fi

if [[ -n "${WAGO_PROJECT_ID:-}" && "${RELEASE_WAGO:-false}" == "true"  ]]; then
  CMD+=("-a" "$WAGO_PROJECT_ID")
fi

echo "🚀 Klone BigWigs-Packager..."
git clone --depth 1 --branch master "$PACKAGER_REPO" "$PACKAGER_DIR"

echo "📦 Starte Packaging: ${CMD[*]}"
"${CMD[@]}"

echo "✅ Packaging abgeschlossen."
