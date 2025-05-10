#!/usr/bin/env python3
import argparse
import subprocess
import os
import sys

# === Konfiguration ===
ADDON_NAME = "Memento"
PACKAGER_DIR = os.path.join("vendor", "packager")

# Mapping: Spielversion → pkgmeta-Datei
GAME_SETTINGS = {
    "retail":  {"meta": "pkgmeta.retail.yaml"},
    "classic": {"meta": "pkgmeta.classic.yaml"},
    "cata":    {"meta": "pkgmeta.cata.yaml"},
}

# Env-IDs (aus GitHub-Workflow)
#CF_ID = os.getenv("CF_PROJECT_ID", "")
WAGO_ID = os.getenv("WAGO_PROJECT_ID", "")

def parse_args():
    parser = argparse.ArgumentParser(
        description="Package und upload mehrere WoW-Versionen"
    )
    parser.add_argument("--version", required=True, help="Addon-Version, z.B. 1.2.0")
    parser.add_argument("--games", required=True, help="Kommaseparierte Liste: retail,classic,cata")
    return parser.parse_args()

def main():
    args = parse_args()
    games = args.games.split(",")

    for game in games:
        cfg = GAME_SETTINGS.get(game)
        if not cfg:
            print(f"⚠️ Unbekannte Spielversion '{game}' – übersprungen.")
            continue

        toc_src = f"{ADDON_NAME}_Mainline.toc" if game == "retail" else f"{ADDON_NAME}_{game.capitalize()}.toc"
        if not os.path.isfile(toc_src):
            print(f"❌ Fehlende TOC: {toc_src} – übersprungen.")
            continue

        # 1) TOC ins Arbeitsverzeichnis kopieren
        subprocess.run(["cp", toc_src, f"{ADDON_NAME}.toc"], check=True)

        # 2) ZIP-Name zusammenstellen
        suffix = "" if game == "retail" else f"-{game}"
        zip_name = f"{ADDON_NAME}-{args.version}{suffix}.zip"

        # 3) Packager-Aufruf
        cmd = [
            "bash", os.path.join(PACKAGER_DIR, "release.sh"),
            "-g", game,
            "-m", cfg["meta"],
            "-n", f"{args.version}:{zip_name}",
        ]
        # Optional: IDs anhängen
        #if CF_ID:
           # cmd += ["-p", CF_ID]
        if WAGO_ID:
            cmd += ["-a", WAGO_ID]

        print("📦 Baue und lade hoch:", " ".join(cmd))
        subprocess.run(cmd, check=True)

if __name__ == "__main__":
    main()