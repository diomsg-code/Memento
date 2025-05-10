#!/usr/bin/env python3
import argparse
import subprocess
import os
import shutil

ADDON_NAME = "Memento"
PACKAGER_DIR = os.path.join("vendor", "packager")

print("📂 Aktuelles Arbeitsverzeichnis:", os.getcwd())
print("📄 Verfügbare TOCs:", [f for f in os.listdir('.') if f.endswith('.toc')])

GAME_SETTINGS = {
    "retail": {
        "meta": "pkgmeta.retail.yaml",
        "toc":  "Memento_Mainline.toc"
    },
    "classic": {
        "meta": "pkgmeta.classic.yaml",
        "toc":  "Memento_Vanilla.toc"
    },
    "cata": {
        "meta": "pkgmeta.cata.yaml",
        "toc":  "Memento_Cata.toc"
    },
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
    game = args.game
    version = args.version

    cfg = GAME_SETTINGS.get(game)
    if not cfg:
        print(f"⚠️ Unbekannte Spielversion '{game}' – übersprungen.")

    toc_src = cfg["toc"]
    if not os.path.isfile(toc_src):
        print(f"❌ Fehlende TOC: {toc_src} – übersprungen.")

    #shutil.copyfile(toc_src, f"{ADDON_NAME}.toc")

    suffix = "" if game == "retail" else f"-{game}"
    zip_name = f"{ADDON_NAME}-{version}{suffix}"
    version_name = f"{version}{suffix}"

    cmd = [
        "bash", os.path.join(PACKAGER_DIR, "release.sh"),
        "-g", game,
        "-m", cfg["meta"],
        "-n", f"{zip_name}:{version_name}",
    ]

    #if CF_ID:
        # cmd += ["-p", CF_ID]
    if WAGO_ID:
        cmd += ["-a", WAGO_ID]

    print("📦 Baue und lade hoch:", " ".join(cmd))
    print("📄 Verfügbare TOCs:", [f for f in os.listdir('.') if f.endswith('.toc')])
    subprocess.run(cmd, check=True)
    print("📄 Verfügbare TOCs:", [f for f in os.listdir('.') if f.endswith('.toc')])

if __name__ == "__main__":
    main()