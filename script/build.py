#!/usr/bin/env python3
import argparse
import subprocess
import os
import sys

ADDON_NAME = "Memento"
PACKAGER_DIR = os.path.join("vendor", "packager")

GAME_SETTINGS = {
    "retail":  {"meta": "pkgmeta.retail.yml"},
    "classic": {"meta": "pkgmeta.classic.yml"},
    "cata":    {"meta": "pkgmeta.cata.yml"},
}

CF_ID = os.getenv("CF_PROJECT_ID", "")
WAGO_ID = os.getenv("WAGO_PROJECT_ID", "")

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--version", required=True)
    parser.add_argument("--game", required=True)
    return parser.parse_args()

def main():
    args = parse_args()

    cfg = GAME_SETTINGS.get(args.game)
    if not cfg:
        print(f"⚠️ Unbekannte Spielversion '{args.game}' – übersprungen.")

    toc_src = f"{ADDON_NAME}_Mainline.toc" if args.game == "retail" else f"{ADDON_NAME}_{args.game.capitalize()}.toc"
    if not os.path.isfile(toc_src):
        print(f"❌ Fehlende TOC: {toc_src} – übersprungen.")

    # 1) TOC ins Arbeitsverzeichnis kopieren
    subprocess.run(["cp", toc_src, f"{ADDON_NAME}.toc"], check=True)

    # 2) ZIP-Name zusammenstellen
    suffix = "" if args.game == "retail" else f"-{args.game}"
    zip_name = f"{ADDON_NAME}-{args.version}{suffix}"

    # 3) Packager-Aufruf
    cmd = [
        "bash", os.path.join(PACKAGER_DIR, "release.sh"),
        "-g", args.game,
        "-m", cfg["meta"],
        "-n", f"{zip_name}:{args.version}",
    ]

    #if CF_ID:
        # cmd += ["-p", CF_ID]
    if WAGO_ID:
        cmd += ["-a", WAGO_ID]

    print("📦 Baue und lade hoch:", " ".join(cmd))
    subprocess.run(cmd, check=True)

if __name__ == "__main__":
    main()